/* [출력 / Output] */
// 출력할 부품 / Part to export
part = "미리보기 / Preview"; // [미리보기 / Preview,키캡 몸체 / Body,글자 부품 / Legend,민무늬 키캡 / Blank]
// 글자 방식 / Legend style
style = "다색 매립 / Inlay"; // [다색 매립 / Inlay,음각 / Engraved,양각 / Raised]

/* [키캡 배열 / Keycap array] */
// 만들 키캡 수 / Number of keycaps
key_count = 1; // [1:1:30]
// 한 줄의 키캡 수 / Columns
columns = 5; // [1:1:10]
// 키 중심 사이의 간격 / Center-to-center spacing
key_spacing = 21; // [18.2:0.1:30]
// 키 순서대로 한 글자씩 입력 / One character per key
legend_text = "최강한글";

/* [첫 번째 글자 / Primary legend] */
// 글꼴 / Font family
font_name = "Noto Sans KR"; // [Noto Sans KR,빙그레체,빙그레체Ⅱ,빙그레 메로나체,빙그레 따옴체,배달의민족 도현,배달의민족 을지로체 TTF,배민 을지로10년후체,배달의민족 을지로오래오래체,배달의민족 한나는 열한살,배달의민족 한나체 Air,배달의민족 한나체 Pro,배달의민족 주아,배달의민족 기랑해랑,배달의민족 꾸불림,배달의민족 연성,Malgun Gothic]
// 굵기 / Weight (없는 굵기는 폰트의 기본 굵기로 표시됨 / unsupported weights fall back)
font_style = "Bold"; // [Thin,ExtraLight,Light,Regular,Medium,SemiBold,Bold,ExtraBold,Black]
// 크기 / Size
size = 7.6; // [2:0.1:12]
// 깊이 또는 높이 / Depth or height
depth = 0.5; // [0.1:0.05:1]
// 회전 / Rotation
rotation = 0; // [-180:1:180]
// 가로 위치 / Horizontal position
x = 0; // [-5:0.1:5]
// 세로 위치 / Vertical position
y = 0; // [-5:0.1:5]
// 좌우 반전 / Mirror horizontally
mirror_horizontal = false;
// SVG 경로(입력하면 모든 키에 같은 SVG 사용) / SVG path
svg_file = "";

/* [두 번째 글자 / Secondary legend] */
// 두 번째 글자 사용 / Enable secondary legend
double_legend = false;
// 키 순서대로 한 글자씩 입력 / One character per key
second_legend_text = "ABCD";
second_size = 3;
second_x = 3;
second_y = -3;

/* [미리보기 색상 / Preview colors] */
body_color = [0.08,0.09,0.12];
legend_color = [0.96,0.96,0.96];

/* [Hidden] */
$fn = 48;
selected_font = str(font_name, ":style=", font_style);

// Original meshes, in millimeters. Keep both STL files beside this file.
module blank() {
    union() {
        import("blank-4.stl", convexity=10);
        import("blank-5.stl", convexity=10);
    }
}

function char_at(value, index) = index < len(value) ? value[index] : "";

module glyphs(index) {
    translate([x,y]) rotate(rotation) scale([mirror_horizontal ? -1 : 1,1]) {
        if (svg_file == "")
            text(char_at(legend_text,index), size=size, font=selected_font,
                 halign="center", valign="center");
        else
            resize([size,0], auto=true) import(svg_file, center=true);
    }
    if (double_legend)
        translate([second_x,second_y])
            text(char_at(second_legend_text,index), size=second_size, font=selected_font,
                 halign="center", valign="center");
}

// Limit edits to the top region. Depth is measured along Z, not the normal.
module legend_prism(index) {
    translate([0,0,8]) linear_extrude(height=6) glyphs(index);
}

module inset(index) {
    intersection() {
        legend_prism(index);
        difference() {
            blank();
            translate([0,0,-depth]) blank();
        }
    }
}

module raised(index) {
    intersection() {
        legend_prism(index);
        difference() {
            translate([0,0,depth]) blank();
            translate([0,0,-0.02]) blank();
        }
    }
}

module body(index) {
    if (style == "양각 / Raised") union() { blank(); raised(index); }
    else difference() { blank(); inset(index); }
}

module at_key(index) {
    col = index % columns;
    row = floor(index / columns);
    translate([col*key_spacing, -row*key_spacing, 0]) children();
}

module all_bodies() {
    for (i=[0:key_count-1]) at_key(i) body(i);
}

module all_legends() {
    for (i=[0:key_count-1]) at_key(i) {
        if (style == "다색 매립 / Inlay") inset(i);
        else if (style == "양각 / Raised") raised(i);
    }
}

module all_blanks() {
    for (i=[0:key_count-1]) at_key(i) blank();
}

assert(depth > 0 && depth <= 1, "Depth must be 0 < depth <= 1 mm.");
assert(key_count >= 1 && key_count <= 30, "Key count must be 1..30.");
assert(columns >= 1, "Columns must be at least 1.");
if (part == "민무늬 키캡 / Blank") all_blanks();
else if (part == "키캡 몸체 / Body") all_bodies();
else if (part == "글자 부품 / Legend") all_legends();
else {
    if (style == "다색 매립 / Inlay") {
        // Preview-only 0.03 mm lift prevents coincident-surface flicker.
        // Exported body and legend geometry remains exactly aligned.
        color(body_color) all_blanks();
        color(legend_color) translate([0,0,0.03]) all_legends();
    } else {
        color(body_color) all_bodies();
    }
}
