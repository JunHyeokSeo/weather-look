# WEATHER LOOK
> 기온별 옷차림을 한눈에 파악할 수 있다!

<br/>

## 소개
기온별 옷차림을 파악할 수 있는 웹사이트입니다.<br/>
업로드 된 사진의 메타데이터를 통해 촬영 시점의 기온을 저장합니다.<br/>
사용자는 특정 기온의 OOTD를 모아볼 수 있으며,<br/>
우리가 제공하는 실시간 기상정보를 통해 날씨에 맞는 옷차림을 쉽게 결정할 수 있습니다.<br/>

<br/>

## 프로젝트 구조
<img width="1239" alt="KakaoTalk_Photo_2023-12-14-10-54-40" src="https://github.com/JunHyeokSeo/weather-look/assets/55777781/f1b44ace-8029-4fcd-b021-11a19d55435f">

<br/>

## DB 설계
![DB-structure](https://github.com/JunHyeokSeo/weather-look/assets/55777781/b91e45ad-29f1-4253-9d9a-dc53259fb3ce)

<br/>

## 작업흐름도
<img width="1161" alt="flow-chart" src="https://github.com/JunHyeokSeo/weather-look/assets/55777781/ebfec889-8133-4545-b01f-2a7d34eac0fd">

<br/>

## 주요기능 설명
| 기능 | 담당자 | 상세설명 |
| --- | --- | --- |
| OAuth2.0 | 여인범 | [Kakao Developer]에서 제공하는 오픈소스를 활용하여 JavaScript로 카카오 소셜 로그인 기능 구현.<br/>OAuth2.0 방식으로 Kakao에서 데이터를 제공받아 카카오 로그인 시 DB에 저장하여 회원으로 관리하고 세션이 연결되도록 구현 |
| 실시간 기상정보 수집 | 김선홍 | [OpenWeather]에서 제공하는 실시간 기상정보 수집. 기온, 날씨, 아이콘을 받아와 메인 페이지에 표시 |
| 사진 메타데이터 추출 | 서준혁 | [EXIF] JavaScript 라이브러리를 활용하여 사진에 포함된 메타데이터(위/경도 및 촬영일자) 추출 |
| 좌표계 행정구역 변환 | 서준혁 | [Kakao] API를 활용하여 좌표계 값을 행정구역명으로 변환.<br/>Decimal 형태의 x, y 좌표값을 구하기 위해 사용자 정의 함수로 좌표계 변환 로직 구현.<br/>사진 메타데이터 추출 ⇒ 좌표계 변환 로직 ⇒ 행정구역명 추출의 순서로 로직을 수행 |
| 과거 기상정보 추출 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 서준혁 &nbsp;&nbsp;&nbsp;| [기상청]의 지상관측 데이터를 받아올 수 있는 API 활용.<br/>관측소 STN 값과 날짜 데이터를 통해 촬영 시점의 기온값 호출 |

[Kakao]:https://developers.kakao.com/
[Kakao Developer]:https://developers.kakao.com/
[OpenWeather]:https://openweathermap.org/
[EXIF]:https://github.com/exif-js/exif-js
[기상청]:https://apihub.kma.go.kr/


