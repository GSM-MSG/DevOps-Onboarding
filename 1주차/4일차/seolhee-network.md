## 인터넷 게이트웨이란?
> 인터넷 게이트웨이는 수평 확장되고 가용성이 높은 VPC 구성 요소로, VPC와 인터넷 간에 통신할 수 있게 해줍니다.
>>  따라서, VPC 내에서 호스팅하는 서비스가 외부 세계에 액세스 되도록 합니다.

1) 인터넷에 라우팅 가능한 트래픽을 위해 VPC 라우팅 테이블에 있는 타겟을 제공

2) 공인 IPv4 주소가 할당된 인스턴스를 위한 NAT(네트워크 주소 변환기)를 수행

### 왜 사용하나요?
* 인스턴스가 리소스가 인터넷에 연결되기 위해 꼭 필요합니다.
* 외부로 나가는 통로이기 때문입니다.
    * 외부인터넷 -> 인터넷 게이트웨이 -> 라우팅 테이블 -> 퍼블릭 서브넷 -> 인스턴스 (보안그룹 생략)

## NAT 게이트웨이란?
> AWS에서 제공하는 네트워크 주소 변환 시스템 
* 프라이빗 서브넷의 인스턴스가 VPC 외부의 서비스(인터넷)에 연결할 수 있게 합니다.
## NAT
> 네트워크 주소 변환

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F996C43495EB7F8D814)

### 왜 사용?
* NAT는 IPv4의 주소 부족 문제를 해결하기 위한 방법으로서 고려됐습니다.
    * 대부분 PrivateIp으로 통신하기 때문에 인터넷을 사용할때만  PublicIP를 사용하게된다면 외부에 노출되는 PublicIP수를 크게 줄일 수 있습니다.
* 공인, 사설 IP를 나눠서 쓸 때 이 사이에서 인터넷 주소를 주고 받고 트래픽을 주고 받는 역할입니다.


##  NAT 게이트웨이와 NAT Instance의 차이점
Nat Gateway 요금이 시간당 0.059달러의 비용입니다.
NAT Instance EC2 인스턴스를 NAT용으로 설정해 사용하며 불안정하고 한물 간 구식 기술이지만 요금을 거의 1/3 수준으로 줄일 수 있습니다.

### Nat Instance를 사용할 때 
* 프리티어 인스턴스 요금제를 쓴다면 무료로도 사용할수도 있습니다.
* 퍼블릭 서브넷 기능만 있으면 되므로 NAT 인스턴스을 씁니다.

## Routing Table?
> 네트워크상의 특정 목적지까지의 거리와 가는 방법등을 명시하고 있는 테이블입니다.
* 목적지까지 갈 수 있는 경로들 중에서 효율적으로 판단되는 경로를 저장시키는 곳이 Routing Table입니다.
* subnet이 라우터를 통해 보내는 네트워크 트래픽이 전달되는 위치를 제어하는 역할을 합니다.

AWS VPC 내에는 Subnet이 있으며 각 Subnet은 각기 다른 네트워크 대역을 가지고 있습니다.

그리고 한 Subnet에서 다른 한쪽 Subnet으로 가기 위해서는 라우팅이 필요합니다. (동일 vpc 내부에서는 자동으로 생성되어서 별 다른 세팅 없이 통신 가능함.)

### 네트워크 상에서 Route
 네트워크에서 목적지 주소를 목적지에 도달하기 위한 네트워크 최적 경로 노선으로 변환시키는 목적으로 사용됩니다.

 패킷을 어디로 전송할지 경로를 결정하는 바법을 라우팅 테이블을 참조해서 결정합니다.

## Bastion이 왜 필요할까?
* 보안상의 이유 입니다.
    * Public subnet에 웹서버를 배치하게 된다면 도어락(ssh접속 성공)만 열면 접속이 됩니다.
    * 아파트 자체 보안 + 도어락 -> bastion + private server
    ![](https://oopy.lazyrockets.com/api/v2/notion/image?src=https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F14d7c3cb-61c0-49c4-9b96-6c4544e82190%2FUntitled.png&blockId=facda48a-9e06-4521-be4c-aa6dec1c31e3)
* 문지기 역할! 
    * 방화벽 호스트 역할을 해줄 수 있습니다.


![](https://oopy.lazyrockets.com/api/v2/notion/image?src=https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7aba022a-ae18-4eb2-b6af-f0ebb1f3a16d%2F6E11890F-2413-4B6B-B4D7-6BDC3504E7B8.jpeg&blockId=04f9ec3c-b208-415b-b387-bf933fc1b170)

참고 : https://err-bzz.oopy.io/f5616e26-79ca-4167-b2eb-140de69b9b54

## 실습
![](https://cdn.discordapp.com/attachments/954177766604030013/1149265121793810462/seolhee-vpc.png)
vpc 생성해줍니다.
![](https://cdn.discordapp.com/attachments/954177766604030013/1149265121290489906/seolhee-subnet.png)
vpc 대역폭 안에서 subnet CIDR 구성해줍니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1149265120334188564/seolhee-nat.png)

nat gateway pulbic subnet위에 위치시켜서 만들고 고정ip 할당해줍니다.


![](https://cdn.discordapp.com/attachments/954177766604030013/1149265120619397141/seolhee-private-rtb.png)
routing table에 nat gateway 연결해줍니다

![](https://cdn.discordapp.com/attachments/954177766604030013/1149265120896229446/seolhee-public-rtb.png)
routing table에 internat gateway 연결해줍니다


![](https://cdn.discordapp.com/attachments/954177766604030013/1149265121546338305/seolhee-subnet-associations.png)
routing table에 서브넷 할당 해줍니다 (public, private 둘다)

