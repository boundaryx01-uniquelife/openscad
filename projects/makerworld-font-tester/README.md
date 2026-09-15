# MakerWorld Font Tester

MakerWorld 서버에 설치된 한국어 폰트를 빠르게 확인하는 테스트 파일입니다.

1. MakerWorld MakerLab의 Parametric Model Maker를 엽니다.
2. `makerworld-font-tester.scad`를 붙여 넣습니다.
3. `test text`에 `가나다라마바사 ㅃㅉㄸ ABC123?!`처럼 한글, 겹자음, 숫자, 기호를 섞어 넣습니다.
4. `font family`로 폰트 이름을 고르고 `font style`로 굵기를 바꾸며 네모 상자, 깨진 자모, 슬라이싱 중 글자 찢어짐이 없는지 확인합니다.

MakerWorld는 로컬 TTF 파일을 함께 업로드해서 `text()`에 쓰는 방식이 안정적으로 지원되지 않습니다. 그래서 실제 모델에는 MakerWorld 폰트 목록에 보이는 이름을 그대로 넣어야 합니다.

2026-09-15 MakerWorld에서 아래 폰트 패밀리와 스타일 분리 UI가 정상 적용됨을 확인했습니다. 글자 입력칸도 정상 표시됩니다.

확인된 폰트 패밀리: Noto Sans KR, Noto Serif KR, NanumGothic, Black Han Sans, Gothic A1, Gowun Batang, Gowun Dodum, Hahmlet, IBM Plex Sans KR, Dongle, Gamja Flower, Hi Melody, Moirai One, Nanum Brush Script.

MakerWorld Customizer는 폰트별 지원 스타일을 조건부로 제한하지 못하므로 `font style`에서 존재하지 않는 스타일을 고르면 깨질 수 있습니다. 실제 키캡 모델에 쓰기 전에는 이 테스트 파일에서 같은 글자와 같은 스타일로 한 번 확인하세요.
