# VPN 기초 개념 정리하기

---

**VPN이란?**

VPN은 Virtual Private Network의 약자로써 **가상사설망**을 의미합니다.

그렇다면 가상 사설 망(네트워크)은 무엇일까?

가상 사설 망은 인터넷을 이용하여 고비용의 사설망을 대체하는 효과를 얻기 위한 기술로 인터넷망과 같은 공중망을 사용하여 둘 이상의 네트워크를 안전하게 연결하기 위하여 가상의 터널을 만들고 암호화된 데이터를 전송할 수 있도록 구성된 네트워크라고 정의할 수 있으며 공중망 상에서 구축되는 논리적인 전용망이라고 할 수 있다. - 네이버 별의 수다 블로그

즉, 이렇듯 VPN은 **보안을 위해** 사용자가 사설망에 연결된 것처럼 인터넷에 엑세스하게 해주는 서비스를 의미한다고 볼 수 있다.

# VPC란?

---

VPC는 Virtual Private Cloud 서비스로, 클라우드 내 프라이빗 공간을 제공함으로써, 클라우드를 퍼블릭과 프라이빗 영역으로 논리적으로 분리할 수 있게 합니다. - xgro님의 velog

즉, AWS 내의 사설 네트워크를 구축할 수 있게 만들어주는 서비스라고 생각할 수 있습니다.

****VPC 의 장점****

- 격리된 자신만의 네트워크를 구성할 수 있다.
- 격리된 네트워크는 서브넷을 관리할 수 있으며 이때 관리자는 인터넷에 노출될 public 서브넷과 그렇지 않을 private 서브넷을 나눌 수 있게 됩니다 이로 인해 더욱 세세한 네트워크 설정이 가능해지게 됩니다.
- 라우터를 만들고 설정 할 수 있다. 라우터를 이용해서 패킷의 경로를 재 조정할 수 있습니다.
- VPN을 구성해서 기업의 데이터 센터를 AWS로 확장할 수 있다 또한 기존 데이터 센터와 연결하여 하이브리드 환경 구성이 가능합니다.
- AWS의 모든 리전에서 사용이 가능합니다.

**VPC의 단점**

- 케바케지만 경우에 따라선 온프레미스 환경에서 프라이빗 클라우드를 운영하는것보다 비용이 더 비쌀 수 있을정도로 비용이 일반 클라우드에 비해 비싸다.
- 개방형 인터넷을 사용하는 경우 지연이 발생할 수 있다.
- VPN이 상호 연결이 가능할 경우 낮은 대역과 대규모 관리가 복잡하다는 단점이 발생한다.
- VPC 피어링이 포함된 경우 VPC가 할당한 CIDR 범위의 트래픽만 지원한다는 단점과 함께 보안 검사를 삽입할 수 없다는 단점이 발생하게 된다.

**부록**

CIDR이란 용어를 처음 접하게 되었는데 CIDR은 무엇일까?

**CIDR이란?**

클래스리스 방식의 IP 주소이다.

이 방식은 기존의 클래스를 나누어 IP 주소를 할당 방법의 비효율적 부분을 개선하여 부족했던

유연성을 더해주게 되는 방식이다. ex)IPv4같은 부족해지는 주소들을 효율적으로 사용하게 해준다.

단 이때 원해 클래스가 주소체계의 구분점을 해주던걸 대신하여 서브넷 마스크를 사용하여 IP 주소체계에 구분점을 만들어준다.

~~사실 이거 네트워크 책에서 공부했는데 클래스리스 네트워크로만 기억하고 있어서 다시 공부한게 아까워서 적었습니다.~~

# VPC 생성해보기

---

~~정말정말 쉽지 않은 과정이었고 힘들었다고 할 수 있었다.~~

~~약간 미지의 탐험을 하는 기분이랄까?~~

처음은 탐색창에서 VPC 서비스를 찾는것부터 시작한다 그리고 VPC 서비스를 클릭하여

VPC를 설정해주면 되는데 이때 중요한점은 리전을 유럽이 아닌 서울로 해줘야한다는 점이다.

그리고 처음엔 subnet을 설정하고 생성하는 창이 옆에 뜨지 않는다 그래서 **VPC만으로 체크 되어있는 항목을 VPC등으로 바꿔주어야한다.**CIDR을 10.10.0.0/16으로 설정해주고 a2,b2로 설정되어있는 private,public 서브넷의 이름을

형식대로 바꿔주면 이 과제는 끝나게 된다.

# 참고한 자료들

---

**VPN**

https://nordvpn.com/ko/what-is-a-vpn/

https://www.cloudflare.com/ko-kr/learning/access-management/what-is-a-vpn/

https://aws.amazon.com/ko/what-is/vpn/

https://blog.naver.com/wnrjsxo/221072250641

**VPC**

https://www.joinc.co.kr/w/Site/cloud/AWS/VPC

[https://velog.io/@xgro/awsVPC#-vpc-주요-특징](https://velog.io/@xgro/awsVPC#-vpc-%EC%A3%BC%EC%9A%94-%ED%8A%B9%EC%A7%95)

https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=theswice&logNo=221159064002

https://www.44bits.io/ko/post/understanding_aws_vpc

https://gngsn.tistory.com/247

[https://www.itworld.co.kr/tags/50148/프라이빗클라우드/152744](https://www.itworld.co.kr/tags/50148/%ED%94%84%EB%9D%BC%EC%9D%B4%EB%B9%97%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C/152744)

https://docs.aws.amazon.com/ko_kr/prescriptive-guidance/latest/migration-f5-big-ip/interconnecting-vpcs.html

**CIDR**

https://aws.amazon.com/ko/what-is/cidr/

https://ko.wikipedia.org/wiki/CIDR

https://kim-dragon.tistory.com/9

[https://velog.io/@ragnarok_code/CIDR이란](https://velog.io/@ragnarok_code/CIDR%EC%9D%B4%EB%9E%80)

**IT 네트워크 엔지니어를 위한 네트워크 입문 3장 IP**

**VPC 생성해보기**

이름이 기억나지 않는 기능반 AWS 책
