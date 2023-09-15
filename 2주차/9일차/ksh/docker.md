# Docker 설치
https://www.docker.com/products/docker-desktop/
![](https://cdn.discordapp.com/attachments/954177766604030013/1151866699033874462/2023-09-14_22.06.54.png)
1) 설치한다

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbhsFxd%2FbtrIXwPKVgY%2FbOzp6SXE7Hnvb1omEVpQF1%2Fimg.png)
2) 설치후 옮겨준다!

![](https://cdn.discordapp.com/attachments/954177766604030013/1151866934393057300/2023-09-14_22.07.54.png)

파인더 들어가면 찾을 수 있다 ㅎㅎ

`docker --version` 로 깔려있는지 확인해주기!

![](https://cdn.discordapp.com/attachments/954177766604030013/1151867306222305350/2023-09-14_22.09.22.png)
이렇게 도커 실행하면 중지되어있지만 상태바에 뜨고 고래를 키울 수 있다!


#  Docker 명령어
`docker build`
* docker build -t 이미지명:태그 .
    * docker build -t seolpy:latest

`docker pull`
* docker pull {image_name}:{image_tag}
    * docker pull ubuntu:latest


`docker stop`
* docker (container) stop [옵션] <컨테이너 식별자> [컨테이너 식별자]
    * docker stop {container_id}


`docker run`
* --env , -e
    * 환경 변수 설정
* --name
    * 컨테이너에 이름 할당
* --rm
    * 컨테이너가 종료되면 자동으로 제거
* --detach, -d  
    * 백그라운드 실행
* --user, -u 
    *  사용자명 지정

보통 이미지 안에 특정 소프트웨어를 설치하기 위해서 많이 사용

`docker cmd`
* ENTRYPOINT 명령문으로 지정된 커맨드에 디폴트로 넘길 파라미터를 지정할 때 사용
* CMD ["helloworld.py"]

`docker entrypoint`
*  컨테이너를 띄울 때 항상 실행되야 하는 커맨드를 지정
* 파라미터를 지정할 때 사용할 수도 있음
* ENTRYPOINT ["<커맨드>","<파라미터1>","<파라미터2>"]
    * 하나의 문자열 취급되게(아래처럼) 하면 오류가 생길수도 있지만 하나씩 ""하는 것도 오류가 생길 수 있음 ㅜㅜ(난 후자였음)
    ```
    "--jwt.time.refreshTime=${JWT_REFRESH_TIME}, --gauth.clientId=${GAUTH_CLIENTID}" 
    ```


예제가 좋아요 : https://choco-life.tistory.com/49

# Dockerfile 작성
hello.py 실행이 안 되면 -> `chmod +x hello.py`

`python:3.9-buster` : 대부분의 필요한 패키지가 설치된 것

`python:3.9-slim-buster` : 표준 라이브러리를 제외하고 전부 제외된 것

`FROM` : Base image 선정

`WORKDIR` : WORKDIR <이동할 경로> ex) WORKDIR /usr/app

`ADD` : 자동 tar(압축해제) 가능, URL 사용가능

`COPY와 다른 점` : 로컬 파일 또는 디렉토리를 컨테이너에 복사

```
이미지 빌드하고 실행시 내 dockerfile 기준 hello.py 파일명의 내용이 출력 됨!
```
