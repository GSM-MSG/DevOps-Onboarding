# 도커 네트워크

도커 컨테이너 간 연결을 하기 위해서는 Docker Network를 사용해야 한다.

즉, Docker Network란 같은 호스트 내에서 실행중인 컨테이너 간 연결할 수 있도록 돕는 논리적 네트워크 개념이다.

# 도커 네트워크 구조
![도커네트워크 주소](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/77cbc583-6b5b-4936-b00c-80486b789b74)


도커는 컨테이너에 내부 IP를 순차적으로 할당합니다. 그러나 이 IP는 컨테이너를 재시작할 때마다 변경될 수 있습니다. 내부 IP는 도커가 설치된 호스트, 즉 내부 망에서만 사용할 수 있으므로 외부와 연결되어야 합니다.

도커는 각 컨테이너에 외부와 네트워크를 제공하기 위해 veth를 사용하여 가상 네트워크 인터페이스를 호스트에 생성합니다. veth는 호스트가 갖고 있는 eth0, eth1 등과 연결됩니다.

docker() 브리지는 각 veth와 바인딩되어 호스트의 eth0 인터페이스와 연결됩니다.

# veth란?

리눅스의 가상 네트워크 인터페이스(`virtual ethernet interface`)입니다. 도커와 같이 가상 네트워크를 사용해야 하는 경우 사용합니다.

사용자가 직업 생성할 필요는 없으며 컨테이너가 생성될 때 토커 엔진이 자동으로 생성합니다.

veth는 쌍으로 만들어지며 네트워크 네임스페이스들을 터널로서 연결하거나, 물리 디바이스와 다른 네트워크 네임스페이스의 장비를 연결하는 용도로 사용합니다.

> **네트워크 네임스페이스**

프로세스의 네트워크 환경을 분리하여 사용할 수 있도록 환경을 만드는 것
> 

# 도커 컨테이너 Port를 외부에 노출

## 컨테이너 포트 연결 명령어

```
$ docker run -p [HOST IP:PORT]:[CONTAINER PORT] [CONTAINER NAME]
```

- `p`: publish 옵션. 호스트 ip 포트를 Container Port와 매핑시키는 역할을 합니다.

아래의 예제들로 포트연결을 해보겠습니다.

# 도커 네트워크 드라이버

## 도커 네트워크 드라이버란?

도커 네트워크 드라이버는 도커 컨테이너 간의 네트워킹을 가능하게 하는 소프트웨어입니다.

## 도커 네트워크 종류

![도커네트워크주소1](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/907e7523-cf32-4ec4-a827-05bb162f323a)

도커 네트워크는 Native 드라이버와 Remote드라이버로 나뉩니다.

`Native Drivers` -> Bridge, Host, None, Overlay를 사용합니다.

`Remote Drivers` -> Third-party드라이버(weave, flannel, openvswitch)로 외부에서 잘 만들어진 드라이버를 사용합니다.

> Native Drivers

도커에 기본적으로 포함되어 있으며, 주요 네트워크 기능을 제공합니다.
> 

> Remote Drivers

Third-party 플러그인으로, 외부에서 만들어진 드라이버를 사용할 수 있습니다.
> 

## 네트워크 동작 방식에 따라 드라이버 분류
![드라이버 분류](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/e9342ec1-04f7-4083-9242-5009a249f302)


네트워크 드라이버는 단일 호스트에서 동작하는 네트워킹, 다중 호스트에서 동작하는 네트워킹이 있습니다.

`단일 호스트 네트워크 드라이버` → Brige, Host, None 네트워크

`다중 호스트 네트워크 드라이버` → Overlay 네트워크

## 도커 네트워크 목록 확인

도커 네트워크 목록은 `docker netork ls` 명령어로 확인 가능합니다.

```
$ docker network ls
```

## 도커 네트워크 세부 정보 확인하기

```docker
docker network insepct [NETWORK ID or NAME]
```

## 도커 네트워크 생성하기

도커 네트워크는 `docker network create` 명령어로 생성할 수 있고, `--driver` 옵션으로 네트워크 드라이버를 지정할 수 있습니다.

```
$ docker network create --driver=[NETWORK DRIVER] [DRIVER NAME]
```

## 네트워크 지정 후 컨테이너 실행

도커 네트워크는 `docker run` 명령어에 `--network` 옵션으로 네트워크를 지정할 수 있습니다.

```
$ docker run -d --network=[NETWORK DRIVER] [CONTAINER NAME]
```

# Bridge

도커에서 디폴드로 사용하는 네트워크 드라이버입니다. 컨테이너가 독립형으로 통신해야할 때 사용하는 것이 일반적이며 docker()를 통한 통신도 bridge 드라이버 사용하는 방식입니다.

bridge네트워크 드라이버는 외부 네트워크와 연결되지 않은 다른 컨테이너와의 연결을 격리합닏

# Host

컨테이너와 호스트의 네트워크 격리를 제거합니다. 즉 컨테이너는 호스트의 네트워크를 그래도 이용할 수 있게 됩니다.

컨테이너 네트워크 격리를 할 필요가 없으므로 컨테이너 내부 IP를 할당해주지 않습니다.

## Overlay

여러 도커 데몬을 함께 연결하고 swarm서비스가 서로 통신합니다.

# None

도커 데몬에 별도 네트워크를 할당하지 않습니다. 컨테이너는 내부/외부 모든 네트워크를 사용하지 않습니다.

> **도커 데몬**

도커엔진의 핵심 구성 요소로, 도커 호스트에서 실행되는 백드라운드 프로세스입니다.
>
