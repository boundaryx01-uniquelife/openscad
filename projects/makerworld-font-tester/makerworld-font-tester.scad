/*
  MakerWorld Korean font tester.
  Paste this into Parametric Model Maker and test each font before adding it to
  a keycap model. The variables below are used by real geometry, so MakerWorld
  shows the text input and font selector.
*/

/* [글자 시험 / Text Test] */
test_text = "가나다라마바사 ㅃㅉㄸ ABC123?!";
font_name = "Noto Sans KR:style=Bold"; // [Noto Sans KR,Noto Sans KR:style=Black,Noto Sans KR:style=Bold,Noto Sans KR:style=Regular,Noto Serif KR,Noto Serif KR:style=Black,Noto Serif KR:style=Bold,Noto Serif KR:style=Regular,NanumGothic,Black Han Sans:style=Regular,Gothic A1:style=Black,Gothic A1:style=Bold,Gothic A1:style=Medium,Gothic A1:style=Regular,Gothic A1:style=SemiBold,Gowun Batang:style=Bold,Gowun Batang:style=Regular,Gowun Dodum:style=Regular,Hahmlet:style=Black,Hahmlet:style=Bold,Hahmlet:style=Medium,Hahmlet:style=Regular,Hahmlet:style=SemiBold,IBM Plex Sans KR:style=Bold,IBM Plex Sans KR:style=Medium,IBM Plex Sans KR:style=Regular,IBM Plex Sans KR:style=Thin,Dongle:style=Bold,Dongle:style=Regular,Gamja Flower:style=Regular,Hi Melody:style=Regular,Moirai One:style=Regular,Nanum Brush Script:style=Regular]
font_size = 7; // [3:0.5:12]
font_height = 0.6; // [0.2:0.1:1.2]
tile_width = 95; // [40:1:140]
tile_depth = 18; // [12:1:40]

/* [Hidden] */
$fn = 32;

color([0.08,0.09,0.12])
    linear_extrude(height=1)
        offset(r=2)
            square([tile_width-4,tile_depth-4], center=true);

color([0.96,0.96,0.96])
    translate([0,0,1])
        linear_extrude(height=font_height)
            text(test_text, size=font_size, font=font_name,
                 halign="center", valign="center");
