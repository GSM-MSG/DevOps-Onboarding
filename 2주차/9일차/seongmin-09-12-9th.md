# Docker 설치

---

저는 도커 데스크탑을 설치하는 방식으로 진행하였습니다.

먼저 hyper-V 기능을 활성화 시켜주어야합니다.
<img width="275" alt="13" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/83bba56a-c155-4cdc-a884-ae1b7b26045b">

그 다음 아래의 링크로 들어가 도커 데스크탑을 다운 받아준다.
![14](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/2e2aaefc-761f-466c-a8af-86366763a278)

[Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)

이렇게 하면 도커는 다운이 끝나긴 하는데 wsl에 관하여 오류가 뜨는경우가 있다.
예를 들어 wsl 2가 아닌 wsl이라던지 이런 경우엔 오류 메시지가 뜨는데 다음과 같이 해결할 수 있다.

먼저 파워쉘을 관리자 권한으로 실행한다.


그 다음

```jsx
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestar
```

명령어를 입력해줍니다.

그 후에 하나 더 입력해주는데

```jsx
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

그 다음에 https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi 링크로 들어가 리눅스 커널을 업데이트 해줍니다.

다음으론 다시 파워쉘을 키고 wsl 2를 기본으로 설정해주는 명령어를 입력해주면 됩니다.

```jsx
wsl --set-default-version 2
```
![15](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/2d5f1bf9-9e33-4607-bbab-9221e044d5d4)

그 후에 원하는 리눅스를 다운 받고 설정해주면 끝이 나게 됩니다.

# 도커도커 명령어

---

- docker run
    
    docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
    
    이런식으로 작성하면 되는데 예를 들자면
    
    ```jsx
    docker run hello-world
    ```
    
    이 코드를 실행 시키면 자동으로 이미지와 컨테이너가 생성되고 생성된 컨테이너에 접속한다.
    
    docker run -it 이미지ID
    해당 이미지에 대한 컨테이너를 생성함과 동시에 실행한다.
    
- docker container
    
    docker container ls -a
    ![30](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/db5392e5-0b95-4771-b195-3519e80e0d5c)

    가지고 있는 컨테이너를 전부 보여준다
    
- docker start
    
    docker start -a 컨테이너 ID
    
    위와 같이 실행하면 입력한 컨테이너가 실행된다.
    ![16](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/5fc12e41-96ec-41b8-b52d-fa732a0557c9)

- docker build
    
    docker build -t 이미지 이름 -f 도커 파일 경로
    
    이렇게 생성하면 도커파일에 대한 이미지가 생성된다.
    
- docker pull
    
    docker pull ubuntu:latest
    ![28](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/c5bd1616-219b-49f3-8cc1-cac5fd10b66f)

    이렇게 입력하면 우분투의 도커 이미지를 가져온다.
    
    : 뒤는 태그로 이미지들중 특징을 표현한다.
    
    즉 다른것을 입력하면 다른게 들어온다는거다
    
- docker images
    
    현재 내 컴퓨터에 어떤 이미지들이 있는지 확인하는 명령어
    ![29](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/e465436a-55b8-4c4b-8853-21302c0c93db)

- docker stop 컨테이너 ID
    
    현재 실행중인 컨테이너 종료
    

# 도커 실습

---

ubuntu 220.4를 이용한 이미지 만들기

먼저 run 기능을 사용해서 컨테이너를 만들어봅시다.

docker run —name test-server -it ubuntu:22.04
![32](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/bbbf3060-3858-49b0-8c5e-eceecdfc1271)
![19](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/724ca19c-2c13-41b8-9f65-18ab4c40952e)

여기서 -it은 쉘에서 바로 명령어를 실행시킬 수 있게 해주는 코드입니다.

그 다음은 도커 커밋을 이용해서 이미지를 생성해줍니다.

docker commit test-server test-server-commit
![20](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/5e2dbde1-58a0-4a9a-b5cf-9502aa32166b)
![22](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/c5567494-3ad7-433c-90b5-4463f90039ef)

이런식으로 간단하게 만들어봤으니 이제 제대로 한번 도커 파일을 작성해서 만들어봅시다.

먼저 도커 파일을 작성해줍니다.
![25](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/edb02113-8a8a-4b8f-bea9-69c538b9d4bf)
1. **FORM**은 시작하는 이미지를 뜻합니다. 즉, 여기선 ubuntu:22.04에서 시작한다는거죠
2. **RUN**은 새로운 레이어를 만들고 실행하는 명령어인데 업데이트와 인스톨을 따로 실행하면 레이어가 계속 생성되면서 효율이 좋지 않으니 같이 실행합니다
이때 **&&** 를 넣으면 앞에 있는 명령어가 실행되고 뒤에 있는 명령어가 그 뒤에 실행된다.
추가로 -y를 넣은 이유는 도커 파일은 선택지가 생기는 창이 뜨면 실행되지 않는다 그래서 자동으로 y가 선택되도록 -y를 사용한다.
3. **WORKDIR**은 mkdir과 접속을 합쳐놓은 것이라고 생각하면 편할것같다.
4. RUN을 넣어서 아까 만들어둔 /var/www/html에 index.html 파일을 넣어준다.
5. **CMD**는 실행될때 사용되는 명령어로 여기선 python3의 http.server 라는 기능을 사용한다는 의미이다.
그 후에 빌드를 통해 이미지를 생성해주면 되는데 이때 도커 파일의 위치를 -f 기능을 통해 지정해줍시다.
<img width="868" alt="23" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/20e4934d-35e6-4e40-a583-d220af271c8e">

그 다음은 이제 정말 쉽습니다.

한번 더 run을 이용해 컨테이너를 생성 후 실행시켜주면 됩니다.
단 이때 혹시나 같은 이름이 있을 경우 실행이 되지 않기때문에
docker rm —force test-server; 을 통해 지워줍시다.
![26](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/06c1cc49-c526-4abb-9e76-a61f44d98258)

그 다음은 docker run -p 8888:8000 —name test-server test-server-build
![31](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/10ec9f8b-f7f4-446b-aa05-02c139276cfd)
이때 중요한건 포트번호를 지정해주어야한다는 것입니다.
사실 전에도 똑같이 했던것같지만 중간에 그만두거나 여러가지로 어지럽게 명령어를 적고 작성을 해서 이 과정에 오류가 생겨서 접속이 되지 않을것같습니다.
그래서 오늘 다시 깔끔하게 실습을 진행했을때 된것도 있는것같습니다
이러면 이제 실습은 끝나게 됩니다.

# 참고한 자료들

---

[https://da2uns2.tistory.com/entry/Docker-도커-시작하기-1-도커-설치하기](https://da2uns2.tistory.com/entry/Docker-%EB%8F%84%EC%BB%A4-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-1-%EB%8F%84%EC%BB%A4-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0)

https://learn.microsoft.com/ko-KR/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package

https://learn.microsoft.com/ko-KR/windows/wsl/setup/environment#set-up-your-linux-username-and-password

[https://velog.io/@agzg/docker도커-명령어-모음](https://velog.io/@agzg/docker%EB%8F%84%EC%BB%A4-%EB%AA%85%EB%A0%B9%EC%96%B4-%EB%AA%A8%EC%9D%8C)

https://captcha.tistory.com/49

[https://velog.io/@dhk22/Docker-기본-명령어-사용법-및-예시](https://velog.io/@dhk22/Docker-%EA%B8%B0%EB%B3%B8-%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%82%AC%EC%9A%A9%EB%B2%95-%EB%B0%8F-%EC%98%88%EC%8B%9C)

https://code-masterjung.tistory.com/132#recentComments

[https://velog.io/@wlsdud2194/-Docker-도커-기본-명령어-모음#sudo-없이-docker-명령어-쓰기](https://velog.io/@wlsdud2194/-Docker-%EB%8F%84%EC%BB%A4-%EA%B8%B0%EB%B3%B8-%EB%AA%85%EB%A0%B9%EC%96%B4-%EB%AA%A8%EC%9D%8C#sudo-%EC%97%86%EC%9D%B4-docker-%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%93%B0%EA%B8%B0)

https://devlog-wjdrbs96.tistory.com/318

https://recordsoflife.tistory.com/1442

[https://velog.io/@whattsup_kim/Docker-Docker-실습-Docker-Image-빌드하기](https://velog.io/@whattsup_kim/Docker-Docker-%EC%8B%A4%EC%8A%B5-Docker-Image-%EB%B9%8C%EB%93%9C%ED%95%98%EA%B8%B0)

https://devocean.sk.com/blog/techBoardDetail.do?ID=163621

https://www.youtube.com/watch?v=0kQC19w0gTI

https://velog.io/@heony/vscode-terminal-split

https://wooono.tistory.com/123

[https://velog.io/@pinion7/도커-이미지-생성해보기-feat.-Dockerfile](https://velog.io/@pinion7/%EB%8F%84%EC%BB%A4-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%83%9D%EC%84%B1%ED%95%B4%EB%B3%B4%EA%B8%B0-feat.-Dockerfile)

https://haengsin.tistory.com/128

https://cocook.tistory.com/65

https://cocook.tistory.com/139

https://hub.docker.com/_/ubuntu?tab=tags&page=1&ordering=last_updated

https://aiday.tistory.com/76

https://wooono.tistory.com/698

[https://velog.io/@pinion7/도커-이미지-생성해보기-feat.-Dockerfile](https://velog.io/@pinion7/%EB%8F%84%EC%BB%A4-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%83%9D%EC%84%B1%ED%95%B4%EB%B3%B4%EA%B8%B0-feat.-Dockerfile)
