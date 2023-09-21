## 데브옵스 온보딩 12일차


1. docker-compose 란?
- docker-compose 의 정의와 왜 사용하는지 등에 대해서 정리해주세요.
    도커 컴포즈는 하나의 서버에서 여러개의 컨테이너를 한개의 서비스로 정의해 컨테이너의 묶음으로 관리할 수 있는 작업 환경을 제공하는 관리 도구입니다. 여러 개의 컨테이너가 하나의 어플리케이션으로 동작할 때 도커 컴포즈를 사용하지 않는다면, 이를 테스트하려면 각 컨테이너를 하나씩 생성해야 합니다. 예시로 웹 어플리케이션을 테스트하려면 웹 서버 컨테이너, 데이터베이스 컨테이너 두 개의 컨테이너를 각각 생성해야 합니다. 테스트 단계에서는 이런식으로 매번 여러개의 컨테이너를 실행하기는 번거롭기에, 하나의 서비스로 정리해 컨테이너 묶음으로 관리할 수 있다면 좀 더 편리할 것입니다.

2. docker-compose 파일 작성해보기
- docker-compose 로 이미지 2개 이상을 띄워주세요.
- 이미지의 종류는 상관없습니다. 자신이 만드셔도되고, 다른 사람들이 만든 이미지를 사용하셔도 좋아요.
    docker-compose.yml

3. 자신이 작성한 docker-compose 파일을 설명하고 docker-compose 파일이 어떤식으로 이루어져있는지 설명해주세요.
    컨테이너 버전은 3으로 지정해주고 apache와 mysql 이미지를 이용해 파일을 작성하였습니다. 컨테이너 이름을 지정후 컨테이너 다운 시 재시작하는 restart 명령어를 사용하였습니다. apache에는 접속할 port를 열어주었고 db에는 비밀번호와 같은 환경변수를 설정해주었습니다

4. 자신이 작성한 docker-compose 와 관련된 명령어 실습하기
- docker-compose 와 관련된 명령어들을 실습해주세요.
    - docker-compose --version : 버전 확인
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/76b45fc9-ddc4-4eb8-8f3d-6a6cb557501d)

    - docker-compose up : 컨테이너를 생성 및 실행 합니다.
    docker-compose up [옵션] [서비스명]
    -d	백그라운드 실행
    --no-deps	링크 서비스 실행하지 않음
    --build	이미지 빌드
    -t	타임아웃을 지정(기본 10초)
    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/00cf0865-3850-40db-a834-34b131bf2ec0)

    - docker-compose ps : 현재 동작중인 컨테이너들의 상태 확인
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/894394fd-d332-448a-9788-7a27010a9d35)

    - docker-compose logs : 컨테이너들의 로그를 출력
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/f8987d6d-2ce5-4508-98e0-2b9111f720ff)

    - docker-compose (start/stop/pause/unpause/restart) : 여러개의 서비스 또는 특정 서비스를 시작/정지/일시정지/재시작
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/bcf441f2-fd68-4d0c-816b-e0853e32fa58)
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/a16dd550-cecb-441f-8c1f-e592b2b8a7ee)


    - docker-compose rm : docker-compose로 생성한 컨테이너들을 일괄 삭제
    - ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/ba83424a-36e1-4337-94bc-d77aa9a11e5b)

      
    - docker-compose kill : 실행중인 컨테이너를 강제로 정지
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/523730ec-162a-4ceb-a23b-e418ce4ef03c)

    - docker-compose down : 네트워크 정보, 볼륨, 컨테이너들을 일괄 정지 및 삭제
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/4623372d-9311-4a25-b354-e656bc9b56d5)
