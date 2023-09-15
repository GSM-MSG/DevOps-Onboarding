# 도커 볼륨

---

- **도커 볼륨이란 무엇일까?**
    
    컨테이너에서 사용자의 로그는 이미지 위에 컨테이너 레이어란 공간에 기록된다.
    
    단 이때 컨테이너 레이어는 컨테이너를 삭제하면 로그도 같이 삭제된다는 단점이 있다.
    
    이때 이 로그가 같이 삭제되는걸 막기 위해 사용되는 방법 중 하나가 볼륨인 것이다.
    즉, 가상의 컨테이너 로그 디렉토리라고 보면 될것같다.
    
- **도커 호스트와 볼륨 공유법**
    
    볼륨을 공유하는 방법은 총 3가지가 있는데
    
    1. **호스트와 볼륨을 공유하기**
        
        호스트와 볼륨을 공유
        
    2. **볼륨 컨테이너 활용하기**
        
        볼륨을 사용하고 있는 컨테이너의 볼륨을 다른 컨테이너와 공유하는 방법이다.
        
    3. **볼륨을 생성해 연결하기**
        
        따로 볼륨을 생성해서 연결하기
        
    

# 볼륨 확인 실습!

---

- **도커 호스트와 컨테이너 볼륨 공유**
    
    위에 사실 굉장히 부실하게 적었는데 사실 개념은 저게 전부라고 생각하고 중요한건 실습이라고 생각해서 그렇게 적었다
    
    ```jsx
    docker run -d —name test-server -v C:\Users\User\문서\test\tesrt:/var/www/html test-server-build
    ```
    ![41](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/ad0ddd8c-76f1-4862-b5af-4da6ce63b544)

    이런식으로 작성하게 되면 test-server라는 컨테이너가 생성됨과 동시에 호스트 주소인
    
    **C:\Users\User\문서\test\tesrt에** /var/www/html 디렉토리와 연결된다!
    
    단 이때 호스트 경로에 파일이 없다면 자동으로 입력한 이름대로 생성을 해준다.
    
    그리고 볼륨이 정말 생성되었는지 확인하기 위해 컨테이너를 지워본다면
  
    ![42](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/e69f8409-9d57-4a11-8b67-602607543625)
    ![43](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/3b1a89e4-2c36-493f-8da1-c4f7ab625e0e)

    여전히 볼륨으로 연결해둔 파일은 남아있는것을 확인할 수 있다!
    
- **볼륨 생성하기!**
    
    아래와 같은 volume 명령어를 통해 실행하면 된다!
    
    ```markdown
    docker volume create —name [volume-name]
    ```
    ![54](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/73e1a985-649d-46fa-9513-0988304f893a)

    그 후에 제대로 생성됐는지 확인 해보자!
    
    ```markdown
    docker volume ls
    ```
    ![55](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/828d2ddd-817b-4c63-b775-145c53944552)

    이렇게 생성한 볼륨을 이제 컨테이너와 연결시켜 봅시다!
    
    ```markdown
    docker run -p 8888:8000 --name volume-test -v seongmin-volume:/var/www/html test-server-build
    ```
    ![44](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/de425e7b-33cd-4782-9e62-03ae9b482aef)

    +이때  -d 옵션을 넣어서 서버가 포그라운드가 아닌 백그라운드에서 실행되게 해주지 않으면
    
    추가로 그 터미널에선 명령어를 입력할 수 없다!
    ![49](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/28ae5f17-56f7-4627-b4de-c29609bf97ba)

    이제 만들었으니 어디 위치해 있는지도 추가로 궁금하니 확인해봅시다.
    
    ```jsx
    docker volume inspect seongmin-volume
    ```
    ![45](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/8a999e45-1066-49ec-87a1-8fc3d1334f0d)

    그 다음에 위에서와 마찬가지로 한번 컨테이너를 삭제 해보면
    
    여전히 볼륨은 남아있는걸 확인할 수 있습니다.
    ![46](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/75808b36-c9f2-4ca0-a4c5-36f7fc9d49d1)

    추가로!
    
    볼륨 삭제는 어떻게 할까?
    
    ```jsx
    docker volume rm [volume-name]
    docker volume prune
    ```
    
    rm 형식은 특정 볼륨만 지우는 것이다.
    ![48](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/9c1e6f82-a395-4e3a-8360-ff3bf5e76b3e)

    prune은 사용하지 않는 모든 볼륨을 전부 지우는것이다.
    ![47](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/f1bc6014-6311-4f2c-b734-1200407479e2)

    단 밑의 이미지를 보면 위에서 컨테이너를 지워서 연결을 해제한 seongmin-volume이
    
    삭제가 되지 않는데 이유는 위의 볼륨이 컨테이너 이미지의 html 파일을 참조되고 있어
    
    생긴 문제지 않을까 하는 추측을 해본다.(잘 모르겠어요 ㅠㅠ)
    
    추가 하나 더!
    
    volume을 생성할때 항상 create를 사용해야 할까? 그건 아니다.
    
    도커는 친절하게도 자동으로 볼륨을 생성해주는 기능을 가지고 있기 때문이다.
    
    ```markdown
    docker run -p 8888:8000 --name volume-test -v /root test-server-build
    ```
    ![50](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/7e81f6d7-0fba-42fa-8fdc-b12c0559e368)

    이렇게 작성하면 위의 컨테이너 디렉토리를 자동으로 찾아줄뿐 아니라 그 위치와 연동되어 있는
    
    볼륨을 자동으로 생성해주게된다.(16진수의 이름으로 볼륨이 생성된다)
    
- **도커 컨테이너 정보 확인**
  ![51](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/af6432b4-db0d-4b7d-a6f3-7ef31c639211)


# 도커 로그 실습

---

컨테이너는 자체적으로 로그를 남기는데 이때 보통 JSON 파일 로깅 드라이버를 사용한다.

로깅 드라이버란?

Docker에서 실행 중인 컨테이너 및 서비스에서 정보를 얻는데 도움이 되는 로깅 메커니즘이다.

```markdown
docker logs [컨테이너 이름]
```
![52](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/1830ed38-a576-4298-9562-239addc385f0)
컨테이너의 로그를 전부 출력하는 역할을 하는 명령어이다.

docker logs -t [컨테이너 이름]
![53](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/533add9b-3bf6-4430-82f1-ba19b5df0965)


컨테이너의 로그를 시간별로 확일할 수 있게 해준다.

단 docker logs 명령어는 json 파일 형식에서만 사용할 수 있다.

docker 

# 참고한 자료들

---

[https://seosh817.tistory.com/374#호스트 볼륨 공유하기-1](https://seosh817.tistory.com/374#%ED%98%B8%EC%8A%A4%ED%8A%B8%20%EB%B3%BC%EB%A5%A8%20%EA%B3%B5%EC%9C%A0%ED%95%98%EA%B8%B0-1)

[https://velog.io/@ckstn0777/도커-볼륨](https://velog.io/@ckstn0777/%EB%8F%84%EC%BB%A4-%EB%B3%BC%EB%A5%A8)

[https://tech.cloudmt.co.kr/2022/06/29/도커와-컨테이너의-이해-2-3-볼륨과-네트워크/](https://tech.cloudmt.co.kr/2022/06/29/%EB%8F%84%EC%BB%A4%EC%99%80-%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88%EC%9D%98-%EC%9D%B4%ED%95%B4-2-3-%EB%B3%BC%EB%A5%A8%EA%B3%BC-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC/)

[https://devbksheen.tistory.com/entry/도커-볼륨-활용하기](https://devbksheen.tistory.com/entry/%EB%8F%84%EC%BB%A4-%EB%B3%BC%EB%A5%A8-%ED%99%9C%EC%9A%A9%ED%95%98%EA%B8%B0)

https://choco-life.tistory.com/49

https://wiki.webnori.com/pages/viewpage.action?pageId=10387627

https://www.daleseo.com/docker-volumes-bind-mounts/

https://sungwookkang.com/1296

https://cumulus.tistory.com/30

[https://yceffort.kr/2020/07/docker-study-1#1-호스트와-볼륨을-공유하는-방법](https://yceffort.kr/2020/07/docker-study-1#1-%ED%98%B8%EC%8A%A4%ED%8A%B8%EC%99%80-%EB%B3%BC%EB%A5%A8%EC%9D%84-%EA%B3%B5%EC%9C%A0%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95)

https://yoonsu.tistory.com/20

https://gomu92.tistory.com/29

https://docs.docker.com/engine/reference/commandline/volume_prune/
