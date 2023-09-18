## 데브옵스 온보딩 9일차
다들 도커에 대해서 알아보셨으니 도커를 설치하고, 도커 명령어들을 직접 쳐보고, 실제로 실행까지 해보는 과정들을 진행해볼거에요. 그 동안 했던 실습과 달리 작성한 Dockerfile도 같이 업로드해주셔야하기에 `9일차/본인이름/dockerfile,gaseong.md` 
이런식으로 과제 업로드해주시면 감사하겠습니다.

1. Docker 설치
- 도커를 설치하고 설치하는 과정을 보여주세요. (Docker Desktop 이든 CLI 든 상관없지만 저는 둘 다 설치하였어요.)
  ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/c24e9c6e-0f8d-48dd-89cd-a234260c3ea9)
  ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/f19d857f-0101-4f40-b155-2165599ec48c)
  기기버전에 맞춰서 설치
  ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/584b32b1-1596-43a6-9593-9e7e96b21f23)
  install 과정 진행후 재부팅
  ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/5d0f2d10-bce7-463a-acb3-a40610d6dd16)

2. Docker 명령어들을 학습해봅시다.
- docker build, run, pull, stop 등등 도커에서 사용되는 명령어들을 학습해주세요.
- 컨테이너 명령어, 이미지 명령어, 기타 명령어들을 학습하고 실습하는 과정들을 기록해주세요.

    컨테이너 명령어
    - 컨테이너 실행 : docker run [옵션] 이미지_이름 [명령] [인수]
    - 컨테이너 시작 : docker start 컨테이너
    - 컨테이너 정지 : docker stop 컨테이너
    - 컨테이너 삭제 : docker rm 컨테이너
    - 모든 컨테이너 : docker ps -a
    
    이미지 명령어
    - 이미지 빌드 : docker image build -t 이미지명[:태그명] Dockerfile 경로
    - 이미지 목록 : docker images
    - 이미지 삭제 : docker rmi 이미지명:태그
    - 이미지 다운로드 : docker pull 이미지명:태그

    기타 명령어
    - 도커 버전 : docker --version
    - 도커 도움말 : docker --help

3. Dockerfile 작성해보기
- 자신이 띄우고자하는 애플리케이션에(무엇이든 상관없습니다. 애플리케이션에 대한 이해가 낮아 혼자 하기 힘들다면 온보딩 채널에 도움을 요청해주세요) 대한 Dockerfile을 작성해주세요.
- 이때 작성하신 Dockerfile도 과제 .md 파일과 함께 제출해주세요.

    FROM : Docker Base Image (기반이 되는 이미지, <이미지 이름>:<태그> 형식으로 설정)
    MAINTAINER : 작성자 정보
    RUN : Shell Script 또는 명령을 실행
    CMD : 컨테이너가 실행되었을 때 명령이 실행
    ADD : 파일 / 디렉터리 추가
    COPY : 파일 복사
    WORKDIR : "RUN", "CMD", "ENTRYPOINT" 명령이 실행될 작업 디렉터리

