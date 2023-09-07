## 데브옵스 온보딩 4일차

1. 인터넷 게이트웨이란?
  인터넷 게이트는 VPC와 인터넷간의 통신을 제공하는 서비스입니다. 즉, VPC 내부 리소스는 internet gateway를 통해서 외부와의 통신이 가능합니다. 이로 인해 인터넷에 연결된 리소스와의 통신이 가능합니다. 특이한 점은 인터넷 게이트웨이는 단순히 인터넷과의 통로 역할을 할 뿐 아니라 공인 IP주소가 할당된 VPC내 인스턴스에 대해 NAT의 역할도 수행합니다.

2. NAT 게이트웨이란?
  NAT는 Private subnet에서 인터넷 또는 다른 AWS 서비스를 사용하기 위해 사용합니다. 서비스 보안 유지를 위해서 외부의 접근을 막고자 private subnet에 서비스를 배치하는 경우, 외부와 연결이 필요할 때 private subnet 혼자서는 외부 네트워크와 통신할 수 없습니다. 이때 통신하기 위해서는 연결된 VPC에 NAT 게이트웨이가 있어야합니다. 

3. NAT 게이트웨이와 NAT Instance의 차이점
  NAT 게이트웨이는 높은 요금으로 사용자에게 부담이 될수 있습니다. NAT 인스턴스는 EC2 인스턴스를 NAT로 설정해서 사용하는것인데 사용 금액을 1/3 정도로 낮출 수 있어 비용면에서 매우 효율적으로 사용이 가능합니다. 대신 NAT 인스턴스는 꺼지면 죽고 보안그룹에 영향을 받는다는 단점이 있지만 NAT 게이트웨이는 꺼져도 죽지 않아 고가용성이 보장되고 보안그룹의 영향을 받지 않는다는 장점ㅁ이 있습니다.

4. Routing Table?
  네트워크상의 라우팅 테이블은 특정 목적지까지의 거리와 가는방법등을 명시하고 있는 테이블입니다. 라우터는 어떤 목적지를 찾아갈때 이 라우팅 테이블을 보고 찾아가게 됩니다. 즉, 라우터에게 목적지에 대한 정보를 알려주는 역할을 합니다.. AWS 설명서에 있는 정의를 보면 모든 라우팅 테이블에는 VPC 내부 통신을 위한 로컬 라우팅이 포함되어 있고 기본적으로 모든 라우팅 테이블에 추가됩니다. VPC에 하나 이상의 IPv4 CIDR블록이 연결되어 있는 경우, 라우팅 테이블에 각 IPv4 CIDR 블록의 로컬 경로가 포함되고, 이러한 라우팅을 수정하거나 삭제할 수 없습니다. VPC 내에는 Subnet이 있으며 각 Subnet은 각기 다른 네트워크 대역을 가지고 있습니다. 그리고 한 Subnet에서 다른 한쪽으로 가기 위해서는 라우팅이 필요합니다. 이떄 사용되는것이 라우팅 테이블입니다.

5. Bastion이 왜 필요할까?
  Bastion Host는 Public Subnet에 위치하며, Private Subnet과의 통신을 도와주는 역할을 합니다. 즉, 외부와 내부 네트워크 사이에서 게이트 역할을 하여 VPC에서 private subnet에 접속해야 하는 일이 있을 경우 직접 접근할 수 없기 때문에 Bastion Host를 거쳐 private subnet에 접속할 수 있습니다. 

6. 실습

  - VPC와 서브넷들을 생성해주세요. (어제와 같은 방식으로 만드시면 됩니다.)
  
  - NAT Gateway를 생성해주세요

  - Internet Gateway를 생성해주세요

  - public-routing-table, private-routing-table 을 생성해주세요.

  - 각각의 VPC 리소스들을 routing table에 연결시켜주세요.


참고 블로그 

https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/vpc-nat-comparison.html

https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/vpc-nat-gateway.html

https://err-bzz.oopy.io/f5616e26-79ca-4167-b2eb-140de69b9b54