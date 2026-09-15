/*
  MakerWorld Korean font tester.
  Paste this into Parametric Model Maker and test each font before adding it to
  a keycap model. The variables below are used by real geometry, so MakerWorld
  shows the text input and font selector.
*/

/* [글자 시험 / Text Test] */
test_text = "가나다라마바사 ㅃㅉㄸ ABC123?!";
font_family = "Noto Sans KR"; // [Noto Sans KR,Noto Serif KR,NanumGothic,Black Han Sans,Gothic A1,Gowun Batang,Gowun Dodum,Hahmlet,IBM Plex Sans KR,Dongle,Gamja Flower,Hi Melody,Moirai One,Nanum Brush Script]
font_style = "Bold"; // [Regular,Bold,Black,ExtraBold,SemiBold,Medium,Light,ExtraLight,Thin]
font_size = 7; // [3:0.5:12]
font_height = 0.6; // [0.2:0.1:1.2]
tile_width = 95; // [40:1:140]
tile_depth = 18; // [12:1:40]

/* [Hidden] */
$fn = 32;

function selected_font(family, style) =
    style == "Regular" ? family : str(family, ":style=", style);

color([0.08,0.09,0.12])
    linear_extrude(height=1)
        offset(r=2)
            square([tile_width-4,tile_depth-4], center=true);

color([0.96,0.96,0.96])
    translate([0,0,1])
        linear_extrude(height=font_height)
            text(test_text, size=font_size, font=selected_font(font_family, font_style),
                 halign="center", valign="center");
