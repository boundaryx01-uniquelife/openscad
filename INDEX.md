# 키캡 프로젝트 파일 안내

## 현재 사용 파일

- `projects/keycap-local/`: OpenSCAD에서 로컬로 쓰는 완성 버전. `open-keycap.cmd`로 실행합니다.
- `projects/makerworld-practice/`: MakerWorld Parametric Model Maker용 최신 배포본입니다. 키캡 전용·하우징 전용·다중 플레이트 파일은 `makerworld-keycap-clicker-v19-separated.zip`에 함께 들어 있습니다.
- `projects/makerworld-practice/makerworld-exports/`: MakerWorld에서 생성·내려받은 3MF와 SCAD 사본.
- `deliverables/`: 다른 곳으로 옮기거나 공유할 ZIP 파일.

## 보관 파일

- `archive/`: 개발 중 만든 이전 버전, 테스트 STL, 미리보기 이미지 및 추출본입니다. 현재 작업에는 필요하지 않지만 삭제하지 않았습니다.

## 앞으로의 저장 규칙

1. `projects/`에는 항상 최신 작업 파일만 둡니다. 작업 중 저장은 이 파일을 갱신합니다.
2. 기능 단위가 완료되면 최신 ZIP 하나만 `deliverables/`에 둡니다. 현재 MakerWorld 배포본은 `makerworld-keycap-clicker-v19-separated.zip`입니다.
3. 새 배포본이 나오면 이전 배포 ZIP은 `archive/versions/`로 옮깁니다. 파일명에는 기능과 날짜를 붙입니다.
4. 테스트 이미지와 임시 STL은 `archive/test-output/`에 보관합니다.
5. 사용자가 명시적으로 요청하기 전에는 보관 파일을 삭제하지 않습니다.

OpenSCAD 프로그램 자체의 파일과 폴더는 변경하지 않았습니다.
