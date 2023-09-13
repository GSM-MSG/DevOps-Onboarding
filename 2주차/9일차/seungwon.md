## Docker 설치
현재 기존 Docker Desktop 이 설치되어져 있는 상태여서 건너뛰고 Docker CLI 설치하겠습니다.
![img.png](https://github.com/GSM-MSG/DevOps-Onboarding/assets/78971821/98d0ff09-a157-4340-a0d3-11f73ab189c4)
![img_1.png](https://github.com/GSM-MSG/DevOps-Onboarding/assets/78971821/0d31963a-d3be-488c-9b41-431ade7e753c)
docker 가 설치되어진 화면입니다.
<br>
## Docker 명령어들을 학습해봅시다.
* docker build -t my-image:1.0 . <br>
설명 : Docker 이미지를 빌드하는 명령어입니다. DockerFile을 사용하여 이미지를 정의하고 빌드합니다. <br>
  <br>
* docker run -p 8080:80 <image> <br>
// -i: (대화방식), -t: (콘솔 및 터미널 환경), --name: (실행 컨테이너 이름), -d (백그라운드 실행) <br>
설명 : Docker 이미지를 기반으로 컨테이너를 실행하는 명령어입니다. <br>
  <br>
* docker pull <image>:<version> <br>
// <version>에 latest 를 넣으면 최신 버전을 다운로드 가능하다. <br>
설명 : Docker Hub  또는 다른 Docker 레지스트리에서 이미지를 다운로드 합니다. <br>
  <br>
* docker search nginx --filter=stars=100 <br>
설명 : Docker Hub에서는 이미지 중 별점이 100 이상을 검색합니다. <br>
  <br>
* docker ps <br>
// -a 컨테이너 전체를 조회 합니다. <br>
// -aq 컨테이너의 ID 만 보여줍니다. <br>
설명 : Docker 실행중인 컨테이너 목록을 확인합니다. <br>
  <br>
* docker stop nginx <br>
설명 : Docker Container 종료 <br>
  <br>
* docker start nginx <br>
설명 : Docker Container 시작 <br>
  <br>
* docker rm <image ? name> <br>
// -f 옵션으로 실행 중인 컨테이너도 제거 가능 <br>
설명 : Docker Container 삭제합니다. <br>
  <br>
* docker attach nginx <br>
설명 : Docker Container에 접속하기 위한 옵션이므로 LOG 확인 시 유용하다 <br>
  <br>
* docker exec nginx ls <br>
설명 : Docker Container 내부에 shell(명령어)을 실행합니다. <br>

## DockerFile 작성하기
![img_2.png](https://github.com/GSM-MSG/DevOps-Onboarding/assets/78971821/3754a065-80b9-43f1-b85b-15ed3b33390e)

