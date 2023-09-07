# 4일차 - MSG

# 인터넷 게이트웨이란?

---

**인터넷 게이트웨이(Internet Gateway)는** 가용성이 높은 중복 VPC 구성 요소 중 하나로, VPC와 외부 인터넷을 연결(통신)할 수 있도록 해주는 역할을 합니다. 보다 구체적으로 이야기하자면, **인터넷 게이트웨이**는 VPC와 인터넷 사이에서 패킷의 전달을 중개하며, 인터넷을 통해 VPC 내부의 리소스에 대한 외부 액세스를 가능하게 합니다. 이러한 기능으로 인해 인터넷에 연결된 서비스와의 통신도 가능하게 됩니다.

# NAT  게이트웨이란?

---

**NAT이란 무엇인가?**

NAT이란 간단히 말하자면 private 주소를 public 주소로 변환해주고
외부의 사설 주소를 내부의 주소로 변환해주는 것이라고 할 수 있다.
이걸 이제 게이트웨이를 붙여 클라우드와 접목 시키게 된다면 프라이빗 서브넷의 인스턴스가 

VPC 외부의 서비스에 연결할 수 있도록 하게 해주고 추가로 외부의 공인 IP 주소를 가진 호스트에만 접속할 수 있도록 설정할 수 있는 NAT gateway가 되는것이다.
이제 간단하게 정리하자면 **외부 서비스에서 프라이빗 서브넷의 인스턴스로 접근할 수 없게 하되, 프라이빗 서브넷의 인스턴스에서는 외부 서비스로 접근할 수 있게 해주는 서비스**이다.

# NAT 게이트웨이와 NAT Instance의 차이점

---

**NAT 게이트웨이와 NAT Instance의 차이점은 크게 보면 아래의 구성으로 볼 수 있다.**

- **비용**
- **이중화 구성**
- **AWS**
- **가용성**

|  | NAT gateway | NAT Instance |
| --- | --- | --- |
| 비용 | 비싸다 | 싸다 |
| 이중화 구성 | 자동으로 이중화 구성 | 직접 이중화 구성 요구 |
| AWS | AWS에서 자동 지원 | NAT 구성 AMI |
| 가용성 | 고가용성으로 꺼져도 죽지 않는다 | 꺼지면 죽는다 |

# 부록 - AMI와 인스턴스

---

어떻게 보면 중요한 부분인것 같아 한번 짚고 넘어가려 한다.

AMI(**Amazon Machine Image)란 무엇인가?**

일종의 EC2를 위한 소프트웨어 구성이 포함된 템플릿이다.

AMI에서 인스턴스를 바로 실행 시킬 수 있게 만들어준다.

**Instance란 무엇인가?**

클라우드이 가상 서버이다. 

인스턴스는 상당히 여러 유형으로 나뉘는데 이에 따라 비용도

제공되는 리소스도 달라진다.

# Routing Table?

---

**라우팅 테이블이란** 컴퓨터 네트워크에서 목적지로 갈 수 있도록 특정 목적지까지의 거리와 가는 방법등을 명시하고 있는 테이블이다.

즉, **라우팅 테이블을 라우터가 참조하여 패킷을 어디로 전송할지 경로를 결정하는 것이다.**

또한 라우팅 테이블 구성은 라우팅 프로토콜의 **가장 중요한 목적**이기도 하다.

**라우팅 테이블에 담겨지는 정보는 다음과 같다.**

- 목적지 네트워크 주소(목적지)
- 패킷의 입출력 관계(방향)
- 목적지 라우팅을 위한 메트릭 정보(거리)

**그렇다면 라우팅 프로토콜은 무엇일까?**

패킷이 목적지까지 가는 방법을 결정해주는 프로토콜이다.

RIP, OSPF, IGPR, BGP등이 있으며 라우팅 테이블을 참조해 가장 좋은 길로 패킷을 전송시키게 된다.

이때 **라우팅 프로토콜은 스태틱과 다이나믹 프로토콜로 구분되는데**

**스태틱 라우팅의 경우** 정적으로 라우팅을 관리하는 것을 의미한다.

이 경우 라우팅 테이블을 교환하지 않고 라우팅이 가능해지기 때문에 네트워크 대역폭을 절약할 수 있다. 또한 외부에 자신의 경로를 알리지 않기에 보안에도 강하다. 

단 경로에 문제가 생길 셩우 대하기가 까다롭다

**다이나믹 라우팅은** 이와 반대로 자동으로 경로가 설정되는 프로토콜이다.

즉, 라우터가 판단하여 가장 효율적인 방법으로 패킷을 전송키는 것이다.

# Bastion이 필요한 이유?

---

먼저 용어를 정리하고자 한다. 내가 찾아본 대부분의 자료들은 보통 Bastion을 그대로 쓰지 않고

Host를 붙여 Bastion Host라고 명시해 놓아서 약간의 혼동이 왔었지만 둘이 같다고 간주하고 

글을 작성하겠다.

**Bastion Host란?**

보안을 위해 고안된 Host로 침입 차단 소프트웨어가 설치되어 내부와 외부 네트워크 사이에서 일종의 게이트웨이 역할을 수행하는 호스트를 뜻한다.

즉, 외부 네트워크에서 Bastion Host를 통해서만 접근할 수 있도록 허용하는 방식등을 사용해서 말이다.

**그렇다면 이 친군 왜 필요할까?**

위에서 설명했다시피 보안을 위해서다.

또한 공인 IP엔 갯수 한계가 있고 보안상으로 외부에서 불리는걸 꺼려하는 친구들도 있기에

사설 IP로 만들어진 친구들을 부르는 역할도 하기 위해서이다.

이렇게 된다면 Bastion Host or server 하나에 공인 IP를 할당해 주기 때문에

방화벽 역할도 겸하며 사설 IP로 이루어진 친구들을 부르는 역할을 할 수 있기에

꼭 필요한 존재라고 할 수 있다.

# 실습
---

먼저 VPC를 생성해줍니다 이때 전 VPC등 항목을 체크하여 igw와 서브넷들을 한번에 생성했지만 이러지 않는게 좋은것같습니다.
내가 뭘 생성했는지 잘 모름 이 다음엔 VPC등으로 같이 생성된 서브넷들의 이름을 바꿔줍니다.
그 후 NAT 게이트웨이를 생성 해주는데 이때 private 서브넷에서 모든 패킷을 nat으로 보내라는 테이블을 추가해 주어야합니다.
저는 이 항목을 보지 못하고 까먹었습니다..ㅠㅠ
그 후 인터넷 게이트웨이를 설정해 주어야하는데 저는 이미 생성된 터라 그냥 이름만 바꾸어서 넣었습니다.
암튼 그 다음엔 라우팅 테이블을 생성한 후 서브넷들을 privat과 public에 맞는데로 넣어주면 과제는 끝나게 됩니다.




---

# 참고한 자료들

---

**인터넷 게이트웨이**

[https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/VPC_Internet_Gateway.html](https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/VPC_Internet_Gateway.html)

[https://nuri-go.tistory.com/89](https://nuri-go.tistory.com/89)

[https://martinkim1954.tistory.com/entry/AWS-인터넷게이트웨이Internet-Gateway-생성-및-라우팅](https://martinkim1954.tistory.com/entry/AWS-%EC%9D%B8%ED%84%B0%EB%84%B7%EA%B2%8C%EC%9D%B4%ED%8A%B8%EC%9B%A8%EC%9D%B4Internet-Gateway-%EC%83%9D%EC%84%B1-%EB%B0%8F-%EB%9D%BC%EC%9A%B0%ED%8C%85)

**NAT 게이트웨이**

[https://kimjingo.tistory.com/180](https://kimjingo.tistory.com/180)

[https://jaykos96.tistory.com/12](https://jaykos96.tistory.com/12)

[https://guide.ncloud-docs.com/docs/natgw-overview](https://guide.ncloud-docs.com/docs/natgw-overview)

[https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/vpc-nat-gateway.html](https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/vpc-nat-gateway.html)

**NAT 게이트웨이와 NAT 인스턴스**

[https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/vpc-nat-comparison.html](https://docs.aws.amazon.com/ko_kr/vpc/latest/userguide/vpc-nat-comparison.html)

[https://yeddong.tistory.com/entry/AWS-NAT-Gateway와-NAT-Instance](https://yeddong.tistory.com/entry/AWS-NAT-Gateway%EC%99%80-NAT-Instance)

[https://inpa.tistory.com/entry/AWS-📚-NAT-Gateway-NAT-Instance-대체해서-비용-절약](https://inpa.tistory.com/entry/AWS-%F0%9F%93%9A-NAT-Gateway-NAT-Instance-%EB%8C%80%EC%B2%B4%ED%95%B4%EC%84%9C-%EB%B9%84%EC%9A%A9-%EC%A0%88%EC%95%BD)

[https://blog.2dal.com/2018/12/31/nat-gateway-to-nat-instance/](https://blog.2dal.com/2018/12/31/nat-gateway-to-nat-instance/)

**AMI**

[https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/ec2-instances-and-amis.html](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/ec2-instances-and-amis.html)

[https://aws.amazon.com/ko/ec2/instance-types/](https://aws.amazon.com/ko/ec2/instance-types/)

[https://velog.io/@ghldjfldj/AWS-AMI란-무엇인가](https://velog.io/@ghldjfldj/AWS-AMI%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80)

**Routing Table?**

[https://ko.wikipedia.org/wiki/라우팅_테이블](https://ko.wikipedia.org/wiki/%EB%9D%BC%EC%9A%B0%ED%8C%85_%ED%85%8C%EC%9D%B4%EB%B8%94)

[https://yoo11052.tistory.com/40](https://yoo11052.tistory.com/40)

[https://velog.io/@wlsdnjs156/라우터와-라우팅-테이블](https://velog.io/@wlsdnjs156/%EB%9D%BC%EC%9A%B0%ED%84%B0%EC%99%80-%EB%9D%BC%EC%9A%B0%ED%8C%85-%ED%85%8C%EC%9D%B4%EB%B8%94)

[http://www.ktword.co.kr/test/view/view.php?m_temp1=1327](http://www.ktword.co.kr/test/view/view.php?m_temp1=1327)

[https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=seungj1031&logNo=221012340470](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=seungj1031&logNo=221012340470)

**Bastion이 필요한 이유**

[https://err-bzz.oopy.io/f5616e26-79ca-4167-b2eb-140de69b9b54](https://err-bzz.oopy.io/f5616e26-79ca-4167-b2eb-140de69b9b54)

[https://jadehan.tistory.com/66](https://jadehan.tistory.com/66)

[https://dodomp0114.tistory.com/7](https://dodomp0114.tistory.com/7)

[https://velog.io/@yyy96/Bastion](https://velog.io/@yyy96/Bastion)
