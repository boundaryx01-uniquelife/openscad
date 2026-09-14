/*
  MakerWorld Parametric Model Maker practice file.
  Self-contained: no imports, fonts, or assets required.
*/

/* [출력 / Output] */
export_part = "미리보기 / Preview"; // [미리보기 / Preview,키캡 / Keycap,글자 / Legend]

/* [키캡 / Keycap] */
key_count = 1; // [1:1:12]
columns = 4; // [1:1:6]
spacing = 21; // [19:0.1:25]
key_width = 18.2; // [16:0.1:20]
key_height = 11.5; // [8:0.1:15]
corner_radius = 1.8; // [0.5:0.1:3]

/* [글자 / Legend] */
// 한 글자씩 순서대로 입력 / One character per key
legend_text = "ABCD";
font_name = "Liberation Sans:style=Bold";
font_size = 7.5; // [2:0.1:12]
legend_depth = 0.6; // [0.2:0.1:1]
legend_x = 0; // [-5:0.1:5]
legend_y = 0; // [-5:0.1:5]
legend_rotation = 0; // [-180:1:180]

/* [미리보기 색상 / Preview colors] */
keycap_color = [0.08,0.09,0.12];
legend_color = [0.96,0.96,0.96];

/* [Hidden] */
$fn = 32;

function char_at(value, index) = index < len(value) ? value[index] : "";

module rounded_square(size, radius) {
    offset(r=radius) square([size-2*radius,size-2*radius], center=true);
}

module keycap_shell() {
    // A simple printable keycap shell for workflow practice; not a Cherry MX-fit design.
    difference() {
        linear_extrude(height=key_height, scale=0.84)
            rounded_square(key_width, corner_radius);
        translate([0,0,1.4])
            linear_extrude(height=key_height, scale=0.80)
                rounded_square(key_width-2.0, corner_radius);
    }
}

module legend(index) {
    translate([legend_x,legend_y,key_height-legend_depth])
        rotate([0,0,legend_rotation])
            linear_extrude(height=legend_depth+0.02)
                text(char_at(legend_text,index), size=font_size, font=font_name,
                     halign="center", valign="center");
}

module keycap(index) {
    if (export_part == "글자 / Legend") legend(index);
    else if (export_part == "키캡 / Keycap") difference() { keycap_shell(); legend(index); }
    else {
        color(keycap_color) keycap_shell();
        color(legend_color) translate([0,0,0.02]) legend(index);
    }
}

for (i=[0:key_count-1])
    translate([(i % columns)*spacing, -floor(i / columns)*spacing, 0])
        keycap(i);
