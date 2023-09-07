## 1. 인터넷 게이트웨이란?

인터넷 게이트웨이는 VPC(가상 사설 클라우드) 내에서 호스팅되는 리소스와 인터넷 간의 통신을 가능하게 해주는 역할을 합니다. 이것은 서브넷 내에 있는 EC2 인스턴스와 같은 리소스가 외부의 인터넷과 연결하기 위해서 반드시 필요한 요소입니다.

인터넷 게이트웨이는 수평적으로 확장 가능하며 높은 가용성을 제공하는 중요한 구성 요소로, 네트워크 대역폭에 제약이 없습니다.

더불어, VPC 내에서 호스팅되는 서비스가 외부 세계와 통신할 수 있도록 채널 역할을 하며, AWS 내에서 호스팅되는 리소스가 인터넷에 연결되도록 해줍니다.

## 2. NAT 게이트웨이란?

외부 서비스에서 프리이빗 서브넷의 인스턴스로 접근할 수 없게 하되, 프라이빗 서브넷의 인스터에서는 외부 서비스로 접근할 수 있게 해주는 서비스입니다.

## 3. NAT 게이트웨이와 NAT Instance의 차이점

NAT gateway는 AWS의 관리형 리소스 이기 때문에, 생성 및 관리는 쉽지만 비용이 비쌉니다.

NAT 인스턴스는 구축은 어려울지도 모르지만 t2.micro타입의 EC2비용이 소요되기 때문에 저렴합니다.

## 4. Routing Table?

네트워크에서 라우팅 테이블이란 네트워크상의 특정 목적지까지의 거리와 가는 방법등을 명시하고 있는 테이블입니다.

클라우드에서 라우팅 테이블이란 서브넷 또는 게이트웨이의 네트워크 트래픽이 전송되는 위치를 결정하는 라우팅 규칙이 저장되어 있는 테이블을 의미합니다.

## 5. Bastion이 왜 필요할까?

Bastion은 보안 그룹, 방화벽 또는 기타 보안 설정을 통해 외부에서의 접근을 관리합니다.

이를 통해 외부에서의 무단 접근을 방지하고, 내부 리소스를 보호합니다.

## 6. 실습

- VPC와 서브넷들을 생성
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149285542098370560/image.png">
  <img src ="https://cdn.discordapp.com/attachments/1149234059680153650/1149287019978174535/image.png">

- NAT Gateway를 생성해주세요
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149273351848722574/image.png">
- Internet Gateway를 생성해주세요
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149288271541698600/image.png">
- public-routing-table, private-routing-table 을 생성
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149288386163654667/image.png">
- public-rounting-table에 internet gateway를 연결합니다.
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149290568745222245/image.png">
- private-rounting-table에 NAT gateway를 연결합니다.
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149292810273574932/image.png">
- 각각의 rounting-table에 VPC 리소스 연결
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149298118567940136/image.png">
  <img src = "https://cdn.discordapp.com/attachments/1149234059680153650/1149296102911254568/image.png">

참고 블로그

https://yoo11052.tistory.com/57

https://jaykos96.tistory.com/12

https://yoo11052.tistory.com/40
