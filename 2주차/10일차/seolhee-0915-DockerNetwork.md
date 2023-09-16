# 도커 네트워크 구조
![](https://velog.velcdn.com/images%2Fckstn0777%2Fpost%2Faa686e2f-098a-4c22-8921-f425802c7156%2Fimage.png)
그림은 항상 여러개 보는 게 좋다!
![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fm9R1m%2FbtrIFH4bS30%2FzJkupwtBS1WeGWXrfSbu40%2Fimg.png)
* eht0(host)라는 네트워크 인터페이스를 할당받는다.
* 호스트에도 veth(virtual ethernet)라는 네트워크 인터페이스가 할당되고 컨테이너에 할당된 eth0 인터페이스와 통신한다.
*  veth는 docker0와 바인딩되고 docker0는 호스트의 eth0 인터페이스와 연결되어 외부로부터 들어온 요청을 처리한다.

# docker0
 * 호스트의 eth0 인터페이스와 컨테이너의 eth0 인터페이스 사이의 중재자 역할을 하는 가상의 브릿지이다.
 * 컨테이너가 외부로 통신할 때는 무조건 docker0 인터페이스를 지나야 한다.


# veth
* 가상의 네트워크 인터페이스
* 자신과 연결된 컨테이너의 네트워크 인터페이스와 `패킷`을 주고받는 식으로 동작


# 도커 컨테이너 Port를 외부에 노출
## 컨테이너 포트 연결 명령어
` docker run -p [HOST:PORT]:[CONTAINER PORT] [CONTAINER NAME]`
이런 명령어로 외부에 노출한다
* ex) docker run -d -p 80:80 nginx
    * 호스트 80포트와 컨테이너 80 포트 연결

* 혹시나 뜻을 모르신다면..
    * -d : background start
    * -p : port binding

# 도커 네트워크 드라이버

* 네트워크 드라이브(Network Drive)

  > 브리지(Bridge), 호스트(Host), 논(none), 컨테이너(container), 오버레이(overlay)

  > 서드파티(Third-party) : weave, flannel, openvswitch

* Weave는
    * 컨테이너 간에 가상 네트워크를 생성하고, 컨테이너를 연결하는데 사용
* Flannel
    * Kubernetes 클러스터에서 사용됨
    * 가상 네트워크를 생성하여 컨테이너 간 통신을 가능
* Open vSwitch
    * 가상 스위치 솔루션
    * 컨테이너와 가상 머신 간의 네트워크 트래픽을 관리하는 데 사용
    * 도커 환경에 통합하여 네트워크 가상화 및 관리를 개선
# 도커 네트워크 종류
`Bridge
Host
None`

`overlay`


# 네트워크 동작 방식에 따라 드라이버 분류

### 기본적으로 제공되는 단일 호스트 네트워크
* Bridge
* Host
* None
### 다중 호스트 네트워크
* Overlay

# 도커 네트워크 목록 확인
`docker network ls`

명령어로 확인할 수 있다.

# 도커 네트워크 확인하기
`docker netork ls`
명령어로 확인 가능하다.

# 도커 네트워크 생성하기
`docker network create` 
명령어로 실행할 수 있다.

`--driver` 
옵션으로 네트워크 드라이버를 지정할 수 있다.

# 네트워크 지정 후 컨테이너 실행
`docker network connect mybridge mynetwork_container`
> connect {network} {container_name}

`docker attach mynetwork_container`

# Bridge 네트워크
*  사용자 정의 브리지를 새로 생성해 각 컨테이너와 연결하는 구조이다.

`docker network create --driver bridge mybridge`
이런식으로 생성하고,

`docker run -it --name mynetwork_container --net mybridge ubuntu:18.04`
이렇게 연결해준다.

# Host 네트워크
* 컨테이너에서 호스트의 네트워크 환경을 그대로 쓸 수 있다.

`$ docker run -it --name network_host --net host ubuntu:18.04`

컨테이너에서 ifconfig를 해보면 host와 동일한 결과를 볼 수 있다. 포트포워딩 없이 바로 서비스할 수 있게된다.

# None 네트워크 
 아무런 네트워크를 쓰지 않는 것을 의미한다. 
 
 *외부와의 단절을 의미...*

 참고 

 https://velog.io/@ckstn0777/%EB%8F%84%EC%BB%A4-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EA%B5%AC%EC%A1%B0
https://yoo11052.tistory.com/208
https://bluese05.tistory.com/15
https://docs.docker.com/network/drivers/ 이건 꼭 읽으세요