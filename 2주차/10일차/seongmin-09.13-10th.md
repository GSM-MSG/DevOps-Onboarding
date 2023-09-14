# 10일차 - MSG

# 포트 포워딩

---

도커 컨테이너 간의 연결을 위해서 사용하는 것이라고 생각하면 될것같다.

즉 이걸 **포트 포워딩이라고 하는데**

지난번에 실습했던 내용을 잠시 다시 살펴보자면 우린 지난번 실습때

docker run -p 8888:8000 —name test-server test-server-build;

이런 식으로 **도커 데몬에서 만든 웹 서버를 컨테이너화** 해서 실행시켰다.

여기서 **주목할 점은 -p 8888:8000** 이다. 이건 무엇이냐?

컨테이너로 만든 가상의 포트가 **8000이고 이걸 실제 Host OS 포트의 8888포트와**

**연결시켜 주는것**이라고 볼 수 있겠다.

# 도커 네트워크의 구조

---

- **도커 네트워크란?**

도커 네트워크는 도커 컨테이너와 컨테이너 그리고 호스트 os와의 네트워크 통신을 구성하기 위한

기능입니다.

- **도커 네트워크의 구조**
    1. host의 네트워크 인터페이스로부터 요청이 들어온다.
    2. 들어온 요청은 docker0라는 네트워크 인터페이스와 통신한다.
    3. 그 후에 도커 컨테이너와 컨테이너 혹은 호스트와 통신하기 위해 veth 페어가 생성된다.
    4. 생성된 veth 페어는 하나는 컨테이너에 할당하고 (IP 주소는 도커가 자동으로 할당)
        
        남은 하나는 호스트에 생성되고 docker0에 위치해 바인딩 되어 컨테이너와 통신한다.
        
        이때 통신하는 네트워크는 가상의 네트워크이다.
        
    5. 위 과정을 다시 역순으로 반복하면 그게 도커 네트워크 구조다.
    <img width="1280" alt="34" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/388ca138-260f-4396-9186-2f4e3cd53bf3">

- **docker0**
    
    호스트의 네트워크 인터페이스와 컨테이너의 인터페이스를 연결해주는 브릿지 역할을 한다.
    

~~그니까 약간 포워딩이랑 비슷하면서 세부적인 것들이 좀 다른것같다.~~

~~포워딩을 공부해 둬서 좀 더 이해하기 쉬웠다.~~

# Veth?

---

Virtual Ethernet 인터페이스

- 컨테이너를 실행할 때 자동으로 도커가 생성해주는 친구
- 반드시 페어로 생성되고 자신과 연결된 컨테이너의 네트워크 인터페이스와 패킷을 주고 받는다.
    
    (이때 자신과 페어로 생성된 또다른 veth와 자동으로 연결된다)
    
- veth는 컨테이너 하나당 하나씩 페어로 생성된다.
- veth는 ‘vethxxxx’ 라는 이름의 형식으로 호스트에 생성되며 docker0에 바인딩 되고
- 남은 하나는 컨테이너 내부에 할당되는 방식이다.

# 도커 컨테이너 포트를 외부에 노출

---

이부분이 아마 포트 포워딩이지 않을까 싶다.

위에서 설명했으니 넘어가도록 하겠다.

# 도커 네트워크 드라이버 종류

---

- **도커 네트워크 드라이버란?**
    
    위에서 우리는 컨테이너간 네트워크를 위해 도커 네트워크를 사용한다고 했다.
    
    하지만 세부적으로 각각 통신을 위해 사용할 수 있게 제공하는 드라이버라고 할 수 있겠다.
    
- **네트워크 드라이버 분류**
    - **도커 자체 제공**
        - 브리지(bridge)
        - 호스트(host)
        - 논(none)
        - 컨테이너(container)
        - 오버레이(overlay)
    - **3rd-party plugin**
        - weave
        - flannel
        - openvswitch
- **네트워크 동작 방식에 따라 드라이버 분류**
    
    도커 네트워크는 단일 호스트와 다중 호스트로 분류할 수 있다.
    
    - **단일**
        - bridge
        - host
        - none
    - **다중**
        - overlay
- **도커 네트워크 드라이버에 대해 알아보자**
    - **Bridge Network**
        
        우리는 위에서 docker0라는 가상 브릿지에 대해 알아봤는데
        
        브릿지 네트워크가 바로 이 docker0이다.
        
        veth 페어를 생성하고 컨테이너와 연결하는것 그것이 브릿지 네트워크인 것이다.
        또한 같은 브릿지에 연결되어 있다면 IP를 통해 컨테이너끼리 통신할 수 있다.
        
    - **Host Network**
        
        원래 도커 컨테이너는 격리된 환경에서 브릿지를 통해 호스트와 통신한다.
        
        하지만 호스트 드라이버는 컨테이너가 격리된 환경에서 네트워크 스택을 가지지 않고
        
        직접적으로 바로 호스트와 통신을 할 수 있게 해준다.
        
        즉 호스트의 네트워크 환경을 그대로 사용하여 통신한다고 정리할 수 있다.
        
    - **None Network**
        
        모든 외부,내부의 통신을 차단합니다 그로 인해 완전하게 격리된 환경에서
        
        컨테이너를 실행할 수 있게 해줍니다.
        

# 도커 네트워크 실습

---

- **도커 네트워크 확인하기**
    
    목록 확인 - docker network ls
  
    ![35](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/f06d9553-0203-4704-80dc-70632c9beda7)

    세부 확인 - docker network inspect [Net ID or Name]
    ![367](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/68c201d9-e728-4ca8-acff-4d79ccf61115)

- **도커 네트워크 생성하기**
    
    docker network create —driver [네트워크 드라이버] [드라이버 이름]
    
    기반이 되는 드라이버를 —driver로 지정하고 드라이버 이름을 저장하는 방식이다.
    ![36](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/1860801a-94d1-41fa-a4b9-2050ac42660c)
    ![38](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/807d2ab2-cb7e-4ffe-848d-36f7866aea69)


- **도커 네트워크 지정 후 컨테이너 실행**
  
  ![38](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/37a8bd00-5006-45ac-b3a4-2654580db9bc)



          docker run -d --network=[NETWORK DRIVER] [CONTAINER NAME]

# 참고한 자료들
https://da2uns2.tistory.com/entry/Docker-Docker-Network-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0
https://galid1.tistory.com/723
https://seosh817.tistory.com/373#%EB%8F%84%EC%BB%A4%20%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88%20Port%EB%A5%BC%20%EC%99%B8%EB%B6%80%EC%97%90%20%EB%85%B8%EC%B6%9C-1
https://www.youtube.com/watch?v=SJFO2w5Q2HI&t=2s
https://velog.io/@ckstn0777/%EB%8F%84%EC%BB%A4-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EA%B5%AC%EC%A1%B0
https://www.44bits.io/ko/keyword/veth
https://watchout31337.tistory.com/354
https://www.youtube.com/watch?v=gJVcKVdYhpI
https://devbksheen.tistory.com/entry/%EB%8F%84%EC%BB%A4-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%ACdocker-network-%ED%99%9C%EC%9A%A9%ED%95%98%EA%B8%B0
https://yoo11052.tistory.com/208
https://velog.io/@mohadang/%EB%8F%84%EC%BB%A4-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EB%93%9C%EB%9D%BC%EC%9D%B4%EB%B2%84
https://learn.microsoft.com/ko-kr/virtualization/windowscontainers/container-networking/network-drivers-topologies
https://3-stack.tistory.com/46
https://devaom.tistory.com/31
https://velog.io/@hansyou/%EB%8F%84%EC%BB%A4-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EC%A0%95%EB%A6%AC
https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=alice_k106&logNo=220984112963
https://nearhome.tistory.com/74
https://hmjo.tistory.com/379
https://d2.naver.com/helloworld/47667
https://hwan-shell.tistory.com/371
