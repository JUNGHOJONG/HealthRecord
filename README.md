# HealthRecord project
## 프로젝트 개요
HealthRecord(H.R.) 프로젝트는 전신 거울을 연상케 하는 디스플레이 화면에 자신의 모습이 투영되고 특정 운동을 시작하면 올바른 자세를 유도한다. 운동을 마쳤을 때 앱의 사용자 운동일지를 통해 운동기록을 볼 수 있고 경험치 시스템으로 운동에 동기를 부여한다.

## 개발 환경
- Java
- Android
- PHP
- MySQL
- AWS EC2
- Apache
- Tomcat

## 사용 흐름도
1. 키넥트 카메라의 depth3D를 이용하여 3차원의 정보를 2차원 화면에 표현.
2. 전신 거울을 연상케 하는 디스플레이 화면에 자신의 모습이 투영되고 특정 운동을 시작하면 올바른
자세를 유도.
3. 다른 사람들과 카운트된 개수를 비교하여 운동 의욕을 촉진.
4. 운동을 마친 후 QR코드 인식을 통해 운동한 데이터를 DMBS에 저장.
5. 실시간 운동 데이터를 앱의 운동일지 기능을 통해 보며 건강 상태 체크.

## 장애 요인과 해결방안
### processing
- 장애 요인: depth3D 화면크기가 일정 사이즈로만 지원이 되어 확대할 수 없었다. 전체 스크린 위에서 모션인식이 되지 않아 불편함을 느낌

  - 해결방안: depth3D 화면상에서 인식되는 좌표를 map()함수를 이용하여 인식범위를 넓혔다.

- 장애 요인: 모션인식 클릭(손을 폈다가 쥠)이 한 번만 인식이 되어야 하는데 여러 번 인식이 되어 정확한 제어가 이루어지지 않았다.

  - 해결방안: handopen, handclose라는 boolean 변수값을 이용하여 한 번만 인식되도록 개선

### Android
- 장애 요인: 회원가입을 시도하는 과정에서 뒤로 가기를 눌렀을 때 작성했던 정보가 사라지는 것이 사용자 입장에서 불편했을 것이라고 느낌

  - 해결방안: BackIntent라는 함수를 만들어서 이전의 화면을 넘어가더라도 정보를 계속 가지고 있도록 개발

## 개발 결과물의 차별성
- 동영상이나 디스플레이 화면을 보면서 따라 하는 운동제품은 시중에 있다. 하지만 이런 제품들은 사용자가 따라 할 수는 있지만 누군가 알려주지 않는 이상 자세가 맞는지 정확하게 판단을 할 수 없다. 하지만 H.R. 제품은 사용자의 정보값을 체크해주어 자세가 맞는지 혼자서 판단할 수 있는 강점이 있다.

- 운동 종료 후 나타나는 QR코드를 앱의 QR코드 인식 기능으로 찍고 실시간으로 업데이트 된 운동일지를 앱에서 확인할 수 있다. 7일간의 운동일지 데이터는 사용자가 적절한 컨디션에 따라 운동할 수 있도록 도와준다. 또한 ‘내 정보’란에 포함된 레벨과 경험치는 사용자의 운동 의욕을 증진 시키는 역할을 한다.

## 시연 영상
- https://github.com/JUNGHOJONG/H.H.H