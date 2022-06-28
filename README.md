# Weather App

코딩셰프 조금 매운맛 실습 - 날씨 앱

### 주요 실습기능

* 내 위치 찾기
* 날씨 API 연동하여 세계 주요 도시의 현재 시간 날씨 정보 표시

### 특이사항

* 2022.06 기준 최신 문법 (Flutter 3.0.3)에 맞도록 수정
* 경고 및 중복 코드를 가능하면 줄이는 방향으로 리팩토링

### 작성환경 (2022.06 기준)

* macOS 12.4 Monterey
* Android Studio Chipmunk (2021.2.1, patch 1)
* Flutter 3.0.3

### 사용 라이브러리 (2022.06 기준)

* [geolocator](https://pub.dev/packages/geolocator) 8.2.1
* [http](https://pub.dev/packages/http) 0.13.4
* [google_font](https://pub.dev/packages/google_font) 3.0.1: Null Safety 바로 적용
* [flutter_svg](https://pub.dev/packages/flutter_svg) 1.1.0
* [timer_builder](https://pub.dev/packages/timer_builder) 2.0.0: Null Safety 바로 적용
* [intl](https://pub.dev/packages/intl) 0.17.0: Null Safety 바로 적용

### Git 이용시 장점

git을 이용하여 코드를 내려받을 경우, 주요 업데이트 시점으로 reset 해가면서 진행 상황을 보는 것이 가능  
최초 시작 시점의 경우 별도의 base 브랜치로 분리하여 두었으므로, checkout 하여 거기서부터 작업 가능  

```git checkout base```

### geolocator 사용시 Tip

* 안드로이드 10.0 이후부터는 권한이 필요한 기능 사용 전에 권한 획득 여부를 물어봐야 함. [공식 사이트 예제](https://pub.dev/packages/geolocator#example)대로 할 것
* 현재 iOS의 경우 "한 번만 위치 권한 사용"에 대한 권한 관련 기능이 구현되어 있지 않음. 완료 후 해당 문장 삭제하겠음.
* 현재 내 위치의 정확한 좌표가 필요한 경우 웹 브라우저에서 구글 지도 실행 후 위치를 찾으면 주소 url에 포함되어 있음
* 안드로이드 에뮬레이터에서 위치가 리셋되는 경우 내장된 구글 지도 앱을 실행해 주면 다시 잡아 줌