# 컨테이너란?

---

컨테이너란 애플리케이션 실행하기 위해 필요한 라이브러리와 애플리케이션을 모두 패키지한 것을 의미합니다.
즉, 어느 환경에서나 애플리케이션을 실행시키기 위한 **소프트웨어 패키지**라고 보면 될것같습니다.

- **컨테이너의 장점**
    - 가볍다!
    컨테이너는 VM에 비해 굉장히 가볍습니다. 그 이유는 VM은 OS를 포함하기 때문에 상당히 무겁지만 컨테이너는 애플리케이션과 필요한 라이브러리만 담기 때문에 상당히 가볍다
    - 관배(관리 배포)가 쉽다!
    컨테이너는 운영체제를 가리지 않고 또한 어느 환경에서나 구동이 되므로 개발 및 배포가 상당히 쉬워집니다!
    - 일정하다!
    개발자의 환경에선 실행이 되지만 다른 환경에서 실행이 되는 문제를 방지할 수 있습니다
    즉, 다양한 환경에서 일관성이 있게 동작할 수 있도록 지원한다는 것이지요!
- **가상화의 역사**
    - **가상화 전(Bare-Metal) 시대**
    이때의 시스템은 하나의 하드웨어에 하나의 OS만 실행이 가능했다.
    즉, 이땐 각각의 컴퓨터마다 리소스가 효율적으로 사용되지 못했다고 볼 수 있습니다.
    - **완전 가상화(Fully  Emulated)**
    전에는 모든 시스템이 물리적으로 구현되었다면 이때는 모든 시스템이
    논리적 즉 에뮬레이터로 모든게 돌아갔습니다.
    CPU, 하드 디스크, 메인보드 등 다 에뮬레이터 안에서 구현하고 OS와 연동했다는 것이죠
    이것 역시 이런 방식이다 보니 엄청나게 느립니다.
    또한 OS가 가상화를 지원하다보니 그런것도 있는것같습니다ㅣ.
    모바일 에뮬레이터 같은게 느린 이유가 아마 이런 이유지 않을까싶습니다.
    - **반가상화(Full Virtualization)**
    게스트 OS가 기존엔 OS와 연동하고 그 다음에 하드웨어와 연동했다면
    이 모든것을 하이퍼바이저라는 가상화 매니저가 처리해주는것입니다.
    즉, 이로 인해 속도가 향상되게 됩니다.
    - **Hardware Virtual Machine(HVM)**
    얘는 이제 하이퍼바이저와도 통신 안합니다.
    게스트 OS가 직접 하드웨어와 통신하고 하드웨어에서 직접 가상화를 지원하는것이지요
    이렇다보니 매우 빠른 속도기 때문에 near  bare-matal이라고도 불립니다.

# 도커도커도커

---

- **도커란?**
컨테이너 기술을 기반으로 하는 오픈 소스 가상화 플랫폼이라고 볼 수 있습니다.
- **도커의 중요한 개념**
    - 컨테이너
    얜 한번 설명했으니 넘어가도록 하겠다. 추가 점이 있다면
    격리된 공간에서 프로세스를 실행시킨다고 보면 될것같다.
    또한, 이미지의 인스턴스?라고 봐도 될듯하다.
    - **이미지**
    **컨테이너** 실행에 필요한 파일과 설정값들을 포함하고 있는 것으로
    상태값을 가지지 않고 변하지 않는 특성을 가집니다.
    즉 예를 들어 ubuntu이미지 라고 한다면 얘는 ubuntu를 실행 시키기 위한 모든 파일을
    가지고 있는 녀셕이라고 할 수 있다.
        - **레이어**
        이미지는 컨테이너를 실행시키기 위한 모든 파일을 담고 있기에 용량이 매우 크다.
        그런데 처음엔 다운을 할 수 있다고 치는데 만약 파일 하나를 추가 했다라고 한다면
        그 파일을 다시 다운 받아야할거시다. 그러면 너무 비효율적이지?
        그래서 이미지를 나눠서 레이어란 개념을 만든것이다.
        즉, 여러개의 읽기 전용 레이어들을 뭉쳐서 이미지를 만들고 레이어를 추가하여 파일을 추가하는 형식이 되는것이다.
- **도커의 장점**
얘는 컨테이너 기반 서비스라 그런지 장점이 다 컨테이너랑 크게 다른게 없는것같다.
    - **도커 허브**
    공개적으로 사용가능한 소프트웨어 패키지들이 도커이미지 형태로 도커 허브에 올라가있어
    필요한 소프트웨어를 굉장히 편하고 쉽게 다운 받을 수 있게 해준다.
    약 50만개가 올라가있다고 한다.
    - **많은 호환성**
    다양한 클라우드 서비스들과 직접적으로 호환된다.
- **도커의 단점**
    - 도커는 리눅스에서만 실행이 가능하다.
    - 물리 서버 한개에 여러개의 컨테이너를 올리는 형식으로 물리 서버가 조지면
    모든 컨테이너에 영향이 끼쳐진다.
- **이미지와 컨테이너의 차이점**
사실 간단하게 말하면 이미지는 기획서 같은 느낌이라면
컨테이너는 기획서를 기반으로 만들어진 게임같은 느낌이다.
- **도커의 구조**
    1. docker file로 도커 이미지를 생성한다
    2. 생성된 도커 이미지를 실행하면
    3. 도커 이미지를 기반으로 컨테이너를 만든다.
    ![다운로드](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/ecf7af0a-bdac-458a-a6b7-dc14bc3318d2)


# 참고한 자료

---

https://aws.amazon.com/ko/containers/services/

[https://aws.amazon.com/ko/containers/services/](https://docs.aws.amazon.com/ko_kr/AmazonECS/latest/developerguide/Welcome.html)
https://cloud.google.com/learn/what-are-containers?hl=ko

https://nearhome.tistory.com/83

[https://selog.tistory.com/entry/가상화-가상화Virtualization의-등장-배경과-발전](https://selog.tistory.com/entry/%EA%B0%80%EC%83%81%ED%99%94-%EA%B0%80%EC%83%81%ED%99%94Virtualization%EC%9D%98-%EB%93%B1%EC%9E%A5-%EB%B0%B0%EA%B2%BD%EA%B3%BC-%EB%B0%9C%EC%A0%84)

http://www.opennaru.com/cloud/physical-server-virtualization-container/

https://www.youtube.com/watch?v=hb_4Tf6bAtY

https://suyeon96.tistory.com/53

[https://squirmm.tistory.com/entry/Docker-도커란-무엇인가](https://squirmm.tistory.com/entry/Docker-%EB%8F%84%EC%BB%A4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80)

[https://velog.io/@markany/도커에-대한-어떤-것-1.-도커란-무엇인가](https://velog.io/@markany/%EB%8F%84%EC%BB%A4%EC%97%90-%EB%8C%80%ED%95%9C-%EC%96%B4%EB%96%A4-%EA%B2%83-1.-%EB%8F%84%EC%BB%A4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80)

https://subicura.com/2017/01/19/docker-guide-for-beginners-1.html

https://be-developer.tistory.com/18

https://wooono.tistory.com/123

https://whitewing4139.tistory.com/204

https://devaom.tistory.com/5
