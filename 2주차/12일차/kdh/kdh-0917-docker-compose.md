## 1. docker-compose 란?
도커 컴포즈란 단일 서버에서 여러개의 컨테이너를 하나의 서비스로 정의할 수 있게해주는 관리 도구입니다.<br>
도커 컴포즈를 사용하지않는다면 여러개의 컨테이너를 띄울 때 하나하나 docker run에 일부 필요한 옵션을 추가해 띄었어야 합니다.<br>
이는 상당히 귀찮고 고된 작업이 될 수 있습니다.<br>
이 작업을 도커 컴포즈는 yaml 파일을 통해 하나로 정의할 수 있게 해줍니다.

## 2. docker-compose 파일 작성해보기

## 3. 자신이 작성한 docker-compose 파일을 설명하고 docker-compose 파일이 어떤식으로 이루어져있는지 설명해주세요.
python에서 logging 모듈을 이용해 로그를 남기는 프로그램.<br>
같은 이미지를 두개 띄움(docker-compose upd에서 --scale 옵션으로 같은 기능 동작 가능)

## 4. 자신이 작성한 docker-compose 와 관련된 명령어 실습하기
- docker-compose up : 경로에 있는 yml파일을 읽고 컨테이너들을 생성 -f을 통해 yml파일 위치 지정 가능
- docker-compose down : 경로에 있는 yml파일로 올라간 컨테이너들을 전부 remove함
<img width="737" alt="Screenshot 2023-09-17 at 1 26 04 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/e2833100-0ab5-48b0-b836-74b8b4b1cd0f">
- docker-compose ps : 경로에 있는 yml파일로 올라간 컨테이너들의 목록확인, docker ps로도 확인 가능 하지만 경로에있는 yml로 올라간 컨테이너만 확인하고 싶다면 docker-compose ps로 가능
<img width="740" alt="Screenshot 2023-09-17 at 1 24 04 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/3b3e3053-0442-425c-890a-aa9786302ef6">
- docker-compose logs : 경로에 있는 yml파일로 올라간 컨테이너들의 log확인
<img width="736" alt="Screenshot 2023-09-17 at 1 32 16 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/3c6b2e4e-1b81-4f5c-a7f6-24419cb96304">

