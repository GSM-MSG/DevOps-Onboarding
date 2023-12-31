# 데브옵스 온보딩 3일차

1. 네트워크 대역 배우기 (네트워크 대역폭, 공인 IP 사설 IP, 서브넷팅 하는법, IP 읽는법 등에 대해 공부해주세요)

    - 네트워크 대역폭 : 네트워크 대역폭은 네트워크가 시간 내 전달할 수 있는 최대 크기의 전달 용량을 의미합니다. 대역폭이 높을수록 많은 데이터가 네트워크에 실려서 전달하고 전달받을 수 있습니다.

    - 공인 IP : 공인 IP 주소란 실제 다른 컴퓨터와 통신할 때 쓰는 IP 주소입니다. 지역별로 쓸 수 있는 IP 주소의 범위가 있으며 특정한 IP 주소를 쓰고 싶다면 주소를 관리하는 기관에 사용권을 요청하여 할당을 받아야 사용이 가능합니다.

    - 사설 IP : 사설 IP 주소는 공유기가 노트북, TV, 휴대폰 등 홈 네트워크에 연결된 장치에 할당한 내부 IP 주소를 의미합니다. IP주소를 할당받기 위해서는 할당받으려는 수가 많을수록 비용이 매우 높아지기 떄문에 대량으로 IP를 확보하는 것이 어렵습니다. 그렇기 때문에 흔히 사용되는 방법이 내부의 사설 네트워크를 구축하는 방식입니다.

    - 서브넷팅 하는법 : 서브넷팅을 하기 위해서는 서브넷 구분 비트를 지정해야 합니다. 서브넷 구분 비트는 네트워크 주소를 어느 기준으로 쪼개서 서브넷을 만들어 구분할지 정하는 비트입니다. 그리고 그 주소를 기준으로 쪼개서 나눠진 서브넷을 네트워크, 브로드캐스트 주소를 제외한 후 필요한 곳에 분배하면 됩니다.

    - IP 읽는법 : IPv4주소는 32비트로 구성되어있으며 8비트마다 끊어서 점으로 구분합니다. IPv6은 16진수로 표현하며 16비트씩 끊어서 :로 구분합니다. 또, CIDR은 IPv4주소의 4개의 옥텟그룹 뒤에 /숫자 를 붙이면서 표현합니다. /24는 앞에서 24bit만큼의 주소를 고정해놓고 뒷부분은 호스트 IP로 제공한다는 뜻입니다. 앞에서부터 24bit이 동일하면 해당 IP는 호스트 IP라는 의미입니다.

2. VPN이란? : VPN의 기초 개념을 정리해주세요!

    VPN은 한국어로 가상사설망이라고 합니다. 가상이라는 단어에서 알 수 있듯 실제 사설망이 아닌 가상의 사설망입니다. VPN은 인터넷을 통해 장치간에 사설 네트워크 연결을 생성하는 서비스입니다. 장치의 실제 IP 주소를 가상 IP 주소로 대체하고, 데이터를 암호화하고, 데이터를 전 세계 보안 네트워크로 라우팅함으로써 정보를 보호합니다.

3. VPC란? : VPC란 무엇이고 어떻게 쓰이며 장단점등을 정리해주세요!

    사용자가 정의하는 IP 주소 범위 선택, 서브넷 생성, 라우팅 테이블 및 네트워크 게이트웨이 구성 등 가상 네트워킹 환경을 VPC라고 합니다. VPC는 네트워크 환경을 가상으로 구성하여, 리소스 배치, 연결 및 보안을 포함해서 완벽하게 제어할 수 있도록 도와주는 역할을 하고 있습니다. VPC를 이용해 사용자가 정의한 가상 네트워크로 AWS 리소스를 사용할 수 있습니다.
    
    이전에 VPC가 없었을 때는 클라우드에 있는 리소스를 격리 할 수 있는 방법이 없었고, 따라서 인스턴스들이 서로 거미줄처럼 연결되고, 인터넷과 연결되어 시스템의 복잡도과 의존도를 높였습니다. 따라서 유지및 관리에 많은 비용과 노력을 투입해야 하는 단점이 있었습니다. 그러나 VPC를 분리함으로써 확장성을 가질 수 있고, 네트워크에 대한 완전한 통제권을 가질 수 있습니다.

    - VPC 구성요소

    subnet : VPC를 특정 범위로 나눈 범위

    Routetable : 네트워크 트래픽을 전달할 위치가 명시된 규칙 집합 테이블

    Igw : VPC의 리소스에서의 인터넷 통신을 활성하기 위한 게이트웨이

    NAT : 네트워크 주소 변환을 통해 private subnet 에서 인터넷 통신을 연결하는 게이트웨이

    VPC endpoint : NAT, IGW 등을 통하지 않고 AWS의 서비스를 비공개로 연결 가능하게 하는 서비스

4. VPC 생성해보기 : VPC와 서브넷을 생성해주세요! public 2a,2b and private 2a,2b 를 만들어주시면되겠습니다! 만드는 과정을 정리해주세요!

    1) VPC 네크워크를 생성합니다.
    -> vpc 적당한 대역폭에 생성합니다.
    2) Subnet(서브넷)을 생성합니다.
    -> 만든 vpc에 가용영역 a와 b를 이용하여 각각 public, private subnet을 생성해줍니다. CIDR은 만든 VPC중 적당한 주소를 적습니다.
    3) Route Table(라우트 테이블)을 생성합니다.
    4) Internet Gateway(인터넷 게이트웨이)를 생성합니다.
    5) Network ACL(네크워크 ACL)을 설정합니다.
    6) Security Group(보안 그룹)을 설정합니다.


참고 블로그 

https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/what-is-amazon-vpc.html

https://memory-hub.tistory.com/11

https://inpa.tistory.com/entry/WEB-IP-%ED%81%B4%EB%9E%98%EC%8A%A4-%EC%84%9C%EB%B8%8C%EB%84%B7-%EB%A7%88%EC%8A%A4%ED%81%AC-%EC%84%9C%EB%B8%8C%EB%84%B7%ED%8C%85-%EC%B4%9D%EC%A0%95%EB%A6%AC

https://ksabs.tistory.com/255