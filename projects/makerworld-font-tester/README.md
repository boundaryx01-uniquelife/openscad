# MakerWorld Font Tester

MakerWorld 서버에 설치된 한국어 폰트를 빠르게 확인하는 테스트 파일입니다.

1. MakerWorld MakerLab의 Parametric Model Maker를 엽니다.
2. `makerworld-font-tester.scad`를 붙여 넣습니다.
3. `test text`에 `가나다라마바사 ㅃㅉㄸ ABC123?!`처럼 한글, 겹자음, 숫자, 기호를 섞어 넣습니다.
4. `font name`을 바꾸며 네모 상자, 깨진 자모, 슬라이싱 중 글자 찢어짐이 없는지 확인합니다.

MakerWorld는 로컬 TTF 파일을 함께 업로드해서 `text()`에 쓰는 방식이 안정적으로 지원되지 않습니다. 그래서 실제 모델에는 MakerWorld 폰트 목록에 보이는 이름을 그대로 넣어야 합니다.

현재 키캡 모델에 넣은 후보는 Noto Sans KR, Noto Serif KR, NanumGothic, Black Han Sans, Gothic A1, Gowun Batang, Gowun Dodum, Hahmlet, IBM Plex Sans KR, Dongle, Gamja Flower, Hi Melody, Moirai One, Nanum Brush Script입니다.
