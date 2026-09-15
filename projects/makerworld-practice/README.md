# MakerWorld 연습용 키캡 업로드

MakerWorld에는 용도별 SCAD를 각각 올리는 방식을 권장합니다. `makerworld-keycap-only-v21.scad`는 키캡 전용, `makerworld-clicker-housing-only-v21.scad`는 하우징 전용이며 각 파일에는 관련 메뉴만 표시됩니다. `makerworld-keycap-clicker-multiplate-v21.scad`는 키캡과 하우징을 한 3MF의 별도 플레이트로 내보내는 전용 파일입니다.

1. MakerWorld에 로그인합니다.
2. MakerLab의 **Parametric Model Maker**를 엽니다.
3. 키캡만 만들 때는 `makerworld-keycap-only-v21.scad`, 하우징만 만들 때는 `makerworld-clicker-housing-only-v21.scad`를 코드 영역에 붙여 넣거나 각각 별도 Parametric Model로 업로드합니다.
4. 실행 또는 미리보기를 누릅니다.
5. `key count`, `columns`, `legend text`를 바꾸어 보고 3MF를 생성합니다.

처음 테스트 값은 `key_count = 4`, `columns = 12`, `legend_text = "가나다라"`를 권장합니다. 12개 이하에서는 항상 한 줄로 중앙 정렬됩니다. 13개 이상을 지원하도록 확장할 때도 마지막 줄을 포함해 각 줄이 중앙 정렬됩니다.

`keycap colour`과 `legend colour`은 색 이름으로 선택하며, 미리보기에서 해당 색을 바로 확인할 수 있습니다. 글자는 원본 메시의 불리언 오류를 피하기 위해 상단에 0.5 mm 돌출한 별도 부품으로 생성합니다. 내보낸 STL은 색상 정보를 보존하지 않으므로 다색 출력은 Bambu Studio에서 키캡과 글자 부품을 따로 불러와 필라멘트를 지정해야 합니다.

한글은 `font family`에서 **Noto Sans KR**을 고르고 `font style`에서 **Bold**를 먼저 시험하세요. 스크린샷에서 MakerWorld 목록에 보인 Noto Sans KR, Noto Serif KR, NanumGothic, Black Han Sans, Gothic A1, Gowun Batang, Gowun Dodum, Hahmlet, IBM Plex Sans KR, Dongle, Gamja Flower, Hi Melody, Moirai One, Nanum Brush Script를 후보로 추가했습니다. 맑은 고딕과 Liberation Sans는 MakerWorld에서 한글이 네모로 표시돼 선택지에서 제거했습니다. 서버에 설치되지 않은 TTF 파일은 이 단일 SCAD에 직접 첨부할 수 없습니다.

기본값 `use original blank keycap = true`는 원본 3MF의 외피와 체결부를 사용합니다. 원본 체결부는 `socket bottom height`만큼 실제로 위로 이동하므로 기본 1 mm에서는 서포트가 필요합니다. 원본 메시의 단면은 고정되어 있어 `stem clearance`는 대체 키캡 모드에서만 적용됩니다.

원본 키캡 모드에서는 `socket bottom height = 1 mm`일 때 10 mm 길이의 원본 체결부 전체가 1 mm 위에서 시작합니다. 서포트 없이 출력하려면 `0 mm`로 바꾸세요. 대체 키캡 모드에서는 소켓 길이가 자동 계산되며, 콘솔에서 길이와 시작 높이를 확인할 수 있습니다.

## 클리커 하우징

`export part`의 기본값인 **인쇄 세트 / Print set**은 현재 레이아웃 수에 맞춘 원본 키캡과 하우징을 서로 6 mm 이상 띄운 독립 개체로 배치합니다. 모든 부품은 Z=0에서 시작하므로 바로 슬라이싱할 수 있습니다. 조립 상태를 자동으로 표시하는 `mw_assembly_view()`는 제거했습니다. **클리커 하우징 / Clicker housing**은 하우징만 따로 만듭니다.

키캡과 하우징을 한 번에 만들려면 `makerworld-keycap-clicker-multiplate-v21.scad`를 사용합니다. 이 파일에는 최상위 형상이 없고 `mw_plate_1()`과 `mw_plate_2()`만 있으므로 MakerWorld는 키캡을 **Plate 1**, 하우징을 **Plate 2**로 내보냅니다. 생성 후 Bambu Studio의 플레이트 탭을 바꾸어 각각 슬라이싱하세요. 다중 플레이트 생성은 3MF 전용이므로 MakerWorld에서 STL 다운로드가 제공되지 않을 수 있습니다.

출력 순서는 하우징, MX 스위치, 키캡입니다. 기본 `plate thickness = 1.5 mm`는 표준 MX 스위치의 걸쇠에 맞춘 값입니다. 스위치가 너무 빡빡하면 `switch cutout`을 0.05 mm씩 올리세요. 너무 느슨하면 값을 내리거나 소량의 접착제를 사용하세요.

`clicker mode`에서 **무전원 / Fidget** 또는 **CR1220 LED / LED**를 선택할 수 있습니다. LED 모드는 각 스위치 아래에 CR1220 한 개가 들어가는 하단 포켓을 추가합니다. 전체 높이는 12.4 mm, 일반 내부 바닥은 상단에서 9.3 mm, 배터리 포켓 바닥은 상단에서 10.5 mm입니다. 포켓 지름은 CR1220보다 1.2 mm 큰 13.7 mm이며 벽면 배선 홀과 별도 원형 덮개는 생성하지 않습니다. 각 키 아래는 독립 포켓으로 만들며, 키 사이 재료는 내부 바닥까지 이어지는 구조 벽입니다. 키링 고리는 하우징과 넓게 겹친 9 mm 앵커와 3.5 mm 구멍으로 보강했습니다. `clicker layout`은 1구, 2구 가로, 4구 가로, 2×2 중에서 선택합니다.

LED 모드는 하우징만으로 전기가 흐르지 않습니다. 3mm 2핀 LED, CR1220, 금속 배터리 접점과 짧은 배선을 별도로 넣어야 합니다. LED의 긴 다리(+)는 배터리 +극, 짧은 다리(-)는 MX 스위치를 거쳐 -극에 연결하는 구성이 기본입니다. 극성을 반대로 연결하면 LED가 켜지지 않습니다.

한글 폰트는 MakerWorld 서버에 설치된 폰트부터 시험해야 합니다. 외부 TTF를 SCAD에 함께 넣는 방식은 지원되지 않습니다. 먼저 `projects/makerworld-font-tester/makerworld-font-tester.scad`로 후보 폰트를 확인한 뒤, 깨지지 않는 폰트만 키캡 파일에서 선택하세요. 글자 입력칸이 보이려면 입력 변수는 반드시 실제 `text()` 형상 생성에 사용되어야 합니다.

하우징 전용 파일에서는 housing form으로 키링 바, 컴팩트, 데스크 패드를 선택할 수 있습니다. 데스크 패드는 외곽 여백을 조절하고, ase option = 자석 홈으로 지름과 깊이를 조절할 수 있는 자석 홈 4개를 추가합니다. 키링 바는 고리 구멍과 앵커 지름도 조절할 수 있습니다.
