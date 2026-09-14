/*
  MakerWorld Parametric Model Maker keycap prototype.
  The published build embeds the supplied blank 1U mesh; no external assets are required.
*/

// Development source only. The MakerWorld upload replaces this line with the
// same mesh data, so it remains a single self-contained SCAD file.
use <original-keycap-mesh.scad>

/* [출력 / Output] */
// 기본값은 모든 부품을 바닥에 분리 배치하는 인쇄 세트입니다.
export_part = "인쇄 세트 / Print set"; // [인쇄 세트 / Print set,미리보기 / Preview,키캡 / Keycap,글자 / Legend,클리커 하우징 / Clicker housing]

/* [키캡 / Keycap] */
key_count = 4; // [1:1:12]
// 12는 A1 mini 폭(256 mm) 안에 들어가는 한 줄 최대치 / 12 fits within an A1 mini bed
columns = 12; // [1:1:12]
spacing = 21; // [19:0.1:25]
key_width = 18.2; // [16:0.1:20]
key_height = 11.5; // [8:0.1:15]
corner_radius = 1.8; // [0.5:0.1:3]
top_thickness = 1.2; // [0.8:0.1:2]
// 원본 3MF의 외피와 체리 체결부를 그대로 사용합니다 / Use the supplied original blank 1U profile
use_original_blank_keycap = true;

/* [체리 MX 체결부 / Cherry MX mount] */
cherry_mx_mount = true;
// 값이 클수록 스위치에 느슨하게 결합 / Larger value fits more loosely
stem_clearance = 0.15; // [0:0.01:0.35]
// 바닥에서 소켓이 시작하는 높이. 기본 1 mm는 서포트가 필요합니다 / Socket bottom height; 1 mm needs support
socket_bottom_height = 1; // [0:0.1:3]

/* [클리커 하우징 / Clicker housing] */
// 무전원 또는 CR1220 LED 키링 클릭커 / Fidget or CR1220 LED clicker
clicker_mode = "무전원 / Fidget"; // [무전원 / Fidget,CR1220 LED / LED]
layout_pattern = "사용자 그리드 / Custom"; // [가로줄 / Row,직사각 / Rectangle,십자가 / Cross,계단 / Stair,사용자 그리드 / Custom]
grid_row_1 = "1111";
grid_row_2 = "0000";
grid_row_3 = "0000";
grid_row_4 = "0000";
grid_row_5 = "0000";
grid_row_6 = "0000";
housing_form = "키링 바 / Keyring bar"; // [키링 바 / Keyring bar,컴팩트 / Compact,데스크 패드 / Desk pad]
keyring_loop = true;
case_width = 20.5; // [18.5:0.1:26]
// 기성 LED 클릭커 기준 전체 높이 / Overall height based on a commercial LED clicker
case_height = 12.4; // [8:0.1:16]
case_wall = 2; // [1.4:0.1:3]
outer_corner_radius = 2; // [0.8:0.1:5]
desk_frame_margin = 5; // [2:0.5:12]
// 상단에서 일반 내부 바닥까지의 깊이 / Top to ordinary internal floor
main_cavity_depth = 9.3; // [6:0.1:11]
// 상단에서 CR1220 포켓 바닥까지의 깊이 / Top to CR1220 pocket floor
battery_pocket_depth = 10.5; // [8:0.1:12]
plate_thickness = 1.5; // [1:0.1:2]
// 표준 MX 플레이트 컷아웃: 14.0 mm, 프린터 공차 포함 / MX plate cutout
switch_cutout = 14.15; // [14:0.05:14.5]
// CR1220(약 12.5 mm)보다 1.2 mm 큰 포켓 / 1.2 mm larger than a CR1220
coin_cell_diameter = 13.7; // [13.5:0.05:14.2]
led_diameter = 3.2; // [3.1:0.05:3.5]
keyring_hole_diameter = 3.5; // [3:0.1:5]
keyring_anchor_diameter = 9; // [7:0.1:14]
base_option = "평면 바닥 / Flat"; // [평면 바닥 / Flat,자석 홈 / Magnet pockets]
magnet_diameter = 8; // [5:0.1:12]
magnet_depth = 1.5; // [0.8:0.1:2.5]

/* [글자 / Legend] */
// 한 글자씩 순서대로 입력 / One character per key
legend_text = "가나다라";
// MakerWorld에서 먼저 Noto Sans KR을 시험하세요 / Test Noto Sans KR first
font_preset = "노토 산스 KR / Noto Sans KR"; // [노토 산스 KR / Noto Sans KR,나눔고딕 / NanumGothic]
font_weight = "Bold"; // [Regular,Bold]
font_size = 7.5; // [2:0.1:12]
// Original mesh uses a shallow raised legend for robust slicing.
legend_depth = 0.5; // [0.2:0.1:1]
legend_x = 0; // [-5:0.1:5]
legend_y = 0; // [-5:0.1:5]
legend_rotation = 0; // [-180:1:180]

/* [미리보기 색상 / Preview colors] */
keycap_colour = "검정 / Black"; // [검정 / Black,흰색 / White,빨강 / Red,파랑 / Blue,초록 / Green,노랑 / Yellow,주황 / Orange,보라 / Purple,분홍 / Pink]
legend_colour = "흰색 / White"; // [검정 / Black,흰색 / White,빨강 / Red,파랑 / Blue,초록 / Green,노랑 / Yellow,주황 / Orange,보라 / Purple,분홍 / Pink]

/* [Hidden] */
$fn = 32;
layout_columns = len(grid_row_1);
layout_rows = 1;
// Derived automatically: bottom height + socket length always reaches the top wall.
active_key_height = use_original_blank_keycap ? 11.83 : key_height;
socket_length = key_height - top_thickness - socket_bottom_height;
effective_socket_length = use_original_blank_keycap ? 10 : socket_length;
function clicker_cols() = layout_columns;
function clicker_rows() = layout_rows;
function clicker_key_count() = layout_columns * layout_rows;
function housing_frame_margin(form) = form == "데스크 패드 / Desk pad" ? desk_frame_margin : 0;

function char_at(value, index) = index < len(value) ? value[index] : "";
function font_family(choice) =
    choice == "노토 산스 KR / Noto Sans KR" ? "Noto Sans KR" :
    choice == "나눔고딕 / NanumGothic" ? "NanumGothic" :
    "Noto Sans KR";
function colour_value(choice) =
    choice == "검정 / Black" ? [0.08,0.09,0.12] :
    choice == "흰색 / White" ? [0.96,0.96,0.96] :
    choice == "빨강 / Red" ? [0.85,0.08,0.08] :
    choice == "파랑 / Blue" ? [0.05,0.25,0.85] :
    choice == "초록 / Green" ? [0.05,0.55,0.20] :
    choice == "노랑 / Yellow" ? [0.95,0.75,0.03] :
    choice == "주황 / Orange" ? [0.95,0.30,0.03] :
    choice == "보라 / Purple" ? [0.42,0.12,0.72] :
    [0.95,0.20,0.48];

module rounded_square(size, radius) {
    offset(r=radius) square([size-2*radius,size-2*radius], center=true);
}

module rounded_rect(size, radius) {
    offset(r=radius) square([size[0]-2*radius,size[1]-2*radius], center=true);
}

module keycap_shell() {
    // Basic printable shell. This is not a clone of a commercial keycap profile.
    difference() {
        linear_extrude(height=key_height, scale=0.84)
            rounded_square(key_width, corner_radius);
        // The cavity opens at the bottom and stops below the top.
        // This keeps a closed top while creating the usual keycap underside hollow.
        translate([0,0,-0.01])
            linear_extrude(height=key_height-top_thickness+0.02, scale=0.80)
                rounded_square(key_width-2.0, corner_radius);
    }
}

module cherry_cross(clearance) {
    // Approximate Cherry MX socket: 4.0 mm overall cross, 1.2 mm arm width.
    // Print a fit-test before printing a full set.
    union() {
        square([4.0 + 2*clearance, 1.2 + 2*clearance], center=true);
        square([1.2 + 2*clearance, 4.0 + 2*clearance], center=true);
    }
}

module cherry_mx_stem() {
    // At bottom height 0, this tube prints from layer 1 with no support.
    translate([0,0,socket_bottom_height])
        difference() {
            cylinder(h=socket_length, d=7.5);
            translate([0,0,-0.01]) linear_extrude(height=socket_length+0.02)
                cherry_cross(stem_clearance);
        }
}

module printable_keycap() {
    // Object 4 is the original outer shell; object 5 is its Cherry socket.
    // Moving object 5 makes socket bottom height work with the original profile.
    if (use_original_blank_keycap)
        union() {
            original_keycap_outer();
            if (cherry_mx_mount)
                translate([0,0,socket_bottom_height]) original_cherry_socket();
        }
    else if (cherry_mx_mount)
        union() { keycap_shell(); cherry_mx_stem(); }
    else keycap_shell();
}

module clicker_housing(cols=1, rows=1) {
    frame_margin = housing_frame_margin(housing_form);
    width = case_width + (cols-1)*spacing + 2*frame_margin;
    depth = case_width + (rows-1)*spacing + 2*frame_margin;
    cavity_floor = case_height-main_cavity_depth;
    battery_floor = case_height-battery_pocket_depth;
    ring_center_x = -width/2-4.5;
    ring_height = max(4, case_height/2);
    difference() {
        union() {
            linear_extrude(height=case_height)
                rounded_rect([width,depth], min(outer_corner_radius, min(width,depth)/6));
            // A broad, overlapping anchor is stronger than a tangential ring.
            if (keyring_loop && housing_form == "키링 바 / Keyring bar")
                hull() {
                    translate([-width/2+keyring_anchor_diameter/6,0,0]) cylinder(h=ring_height, d=keyring_anchor_diameter);
                    translate([ring_center_x,0,0]) cylinder(h=ring_height, d=keyring_anchor_diameter);
                }
        }
        // Independent cavities leave full-height structural walls between keys.
        // The walls are continuous down to the internal floor, not bridge ribs.
        for (row=[0:rows-1], col=[0:cols-1]) {
            x = (col-(cols-1)/2)*spacing;
            y = ((rows-1)/2-row)*spacing;
            translate([x,y,cavity_floor])
                linear_extrude(height=main_cavity_depth-plate_thickness+0.01)
                    rounded_rect([case_width-2*case_wall,case_width-2*case_wall], 1.2);
        }
        if (keyring_loop && housing_form == "키링 바 / Keyring bar")
            translate([ring_center_x,0,-0.01]) cylinder(h=ring_height+0.02, d=keyring_hole_diameter);
        for (row=[0:rows-1], col=[0:cols-1]) {
            x = (col-(cols-1)/2)*spacing;
            y = ((rows-1)/2-row)*spacing;
            translate([x-switch_cutout/2,y-switch_cutout/2,case_height-plate_thickness-0.01])
                cube([switch_cutout,switch_cutout,plate_thickness+0.02]);
            // The CR1220 recess is 10.5 mm down from the top, 1.2 mm below
            // the ordinary cavity floor. The pocket is circular with no wall slot.
            if (clicker_mode == "CR1220 LED / LED") {
                translate([x,y,battery_floor-0.01])
                    cylinder(h=main_cavity_depth-battery_floor+0.02, d=coin_cell_diameter);
            }
        }
        // Four shallow underside pockets for glue-in magnets on a desk pad.
        if (base_option == "자석 홈 / Magnet pockets")
            for (sx=[-1,1], sy=[-1,1])
                translate([sx*(width/2-frame_margin/2-case_wall),
                           sy*(depth/2-frame_margin/2-case_wall),-0.01])
                    cylinder(h=magnet_depth+0.02, d=magnet_diameter);
    }
}

module legend(index) {
    // Embed only 0.08 mm into the top, then raise the rest above the surface.
    // Avoiding a boolean with the dense original 3MF mesh prevents slicer artifacts.
    translate([legend_x,legend_y,active_key_height-0.08])
        rotate([0,0,legend_rotation])
            linear_extrude(height=legend_depth+0.08)
                text(char_at(legend_text,index), size=font_size,
                     font=str(font_family(font_preset), ":style=", font_weight),
                     halign="center", valign="center");
}

module keycap(index) {
    if (export_part == "글자 / Legend") legend(index);
    else {
        // Separate, shallow raised text avoids unreliable booleans on the embedded mesh.
        color(colour_value(keycap_colour)) printable_keycap();
        color(colour_value(legend_colour)) legend(index);
    }
}

module keycap_array(count, array_columns, part="preview") {
    for (i=[0:count-1]) {
        row = floor(i / array_columns);
        row_start = row * array_columns;
        row_count = min(array_columns, count - row_start);
        column = i % array_columns;
        // Every row is centered independently, including its final incomplete row.
        translate([(column - (row_count-1)/2)*spacing, -row*spacing, 0])
            keycap(i);
    }
}

module printable_clicker_set() {
    cols = clicker_cols();
    rows = clicker_rows();
    count = clicker_key_count();
    holder_depth = case_width + (rows-1)*spacing;
    // Every component starts at Z=0 and has a 6 mm planar gap for printing.
    // The housing is centered; keycaps and covers sit in separate rows above it.
    clicker_housing(cols, rows);
    translate([0,holder_depth/2+key_width/2+6,0])
        keycap_array(count, cols);
    // Battery covers are intentionally generated only with the dedicated
    // "Battery covers" output, so the normal print set contains no loose disks.
}

// MakerWorld Parametric Model Maker multi-plate export.
// Plate 1: keycaps only. Plate 2: housing only. The platform detects these
// reserved module names and writes them as separate build plates in its 3MF.
module mw_plate_1() {
    if (export_part == "인쇄 세트 / Print set")
        keycap_array(clicker_key_count(), clicker_cols());
}

module mw_plate_2() {
    if (export_part == "인쇄 세트 / Print set")
        color(colour_value(keycap_colour))
            clicker_housing(clicker_cols(), clicker_rows());
}

assert(use_original_blank_keycap || socket_length >= 4,
       "Lower socket bottom height or increase keycap height: socket length must be at least 4 mm.");
echo(str("Cherry MX socket length: ", effective_socket_length,
         " mm; bottom height: ", socket_bottom_height, " mm"));

if (export_part == "클리커 하우징 / Clicker housing")
    clicker_housing(clicker_cols(), clicker_rows());
else if (export_part == "인쇄 세트 / Print set")
    printable_clicker_set();
else
    keycap_array(key_count, columns);
