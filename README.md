# Weather App

코딩셰프 조금 매운맛 실습 - 날씨 앱

### 주요 실습기능

* 내 위치 찾기
* 날씨 API 연동하여 세계 주요 도시의 현재 시간 날씨 정보 표시

### 특이사항

* 2022.06 기준 최신 문법 (Flutter 3.0.2)에 맞도록 수정
* 경고 및 중복 코드를 가능하면 줄이는 방향으로 리팩토링

### 작성환경 (2022.06 기준)

* macOS 12.4 Monterey
* Android Studio Chipmunk (2021.2.1, patch 1)
* Flutter 3.0.2

### 사용 라이브러리 (2022.06 기준)

* Geolocator 8.2.1 [링크](https://pub.dev/packages/geolocator)

### Git 이용시 장점

git을 이용하여 코드를 내려받을 경우, 주요 업데이트 시점으로 reset 해가면서 진행 상황을 보는 것이 가능  
최초 시작 시점의 경우 별도의 base 브랜치로 분리하여 두었으므로, checkout 하여 거기서부터 작업 가능  

```git checkout base```

### Geolocator 사용시 Tip

* 안드로이드 최신 버전에서는 위치 획득 전에 명시적으로 권한 획득 여부를 물어봐야 함. [공식 사이트 예제](https://pub.dev/packages/geolocator#example)대로 할 것
* 안드로이드 에뮬레이터에서 현재 위치를 잡기 힘들 경우 내장된 구글 지도 앱을 실행해 주면 쉽게 잡을 수 있음.