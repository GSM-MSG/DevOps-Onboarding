## 데브옵스 온보딩 5일차

1. EC2 인스턴스란?

    EC2 인스턴스란 Elastic compute cloud 로 AWS에서 제공하는 클라우드 컴퓨팅 서비스입니다. Elastic은 비용적 부분뿐만이 아니라 성능, 용량을 자유롭게 조절할 수 있다는 의미도 가지고 있습니다. 즉, EC2는 AWS에서 비용, 성능, 용량이 탄력적인 클라우드 컴퓨터를 제공하는 서비스라고 할 수 있습니다.

2. AMI란?

    OS, 아키텍쳐 타입, 저장공간 용량 등 EC2 인스턴스를 실행하기 위해 필요한 정보를 모은 단위입니다. EC2 생성시 사용할수 있으며 AMI 이미지에 포함된 OS와 애플리케이션이 그대로 설치됩니다.

3. 보안그룹이란? 

    보안 그룹은 인스턴스에 대한 인바운드 및 아웃바운드 트래픽을 제어하는 가상 방화벽 역할을 합니다. VPC에서 인스턴스를 시작할 때 최대 5개의 보안그룹에 인스턴스를 할당할 수 있습니다. 보안 그룹은 인스턴스 수준에서 작동하므로 VPC에 있는 각 인스턴스를 서로 다른 보안그룹에 할당할 수 있습니다. 시작할 때 특정 그룹을 지정하지 않으면 인스턴스가 자동으로 VPC의 기본 보안 그룹에 할당됩니다.


4. EC2 Instance 실습
  - 어제와 같이 VPC, 서브넷, igw, nat, rtb를 세팅해주세요
  - EC2를 t2.micro 용량으로 생성하시고 AMI는 amazon linux, ubuntu 중 편한걸 선택해주세요.
  - 보안그룹은 '최소한'의 권한만 오픈해주세요
  - 간단한 실습이기 떄문에 인스턴스는 퍼블릭 서브넷에 위치시켜주시고 퍼블릭 IP 할당을 활성화 시켜주세요.
  - key는 본인 이름으로 새로 생성해주시면 되겠습니다.
  - 띄워야하는 애플리케이션은 본인이 원하시는걸 띄우시면 되겠습니다. (html 같은것도 가능해요!)
  - 올라와야하는 캡처본 : EC2 생성을 설명하는 캡처본과 글, EC2의 퍼블릭 IP를 인터넷에 검색하여 뜨는 창

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/3d453541-6e8a-4305-84fc-e726ce54e3fd)
    ec2이름 설정 후 AIM는 linux 를 선택해줍니다.
    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/25ad1c95-14ff-4448-983c-b0a102aef93b)
    인스턴스는 t2 micro를 사용해주고 keypair를 본인이름으로 생성해줍니다.
    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/8e82b15d-40a2-4dc9-8eea-9120f1747de0)
    vpc와 public subnet은 만들어두었던것을 사용하고
    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/8970ec6a-e7f7-47e7-939e-ba212ecf2f38)
    보안그룹은 설치를 위한 ssh와 http에서의 확인을 위한 http 80을 열어줍니다.

    이후에 터미널을 이용해서 인스턴스에 접근후 아파치서버를 설치 후 html 파일을 생성하고 서버실행해주면 완료입니다.

    
    - public IP를 검색하면 뜨는 창
    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/72f383f5-3e99-447f-b122-83ddf0379c25)







5. 실습처럼 EC2를 퍼블릭으로 올리게되면 어떤 문제가 생겨날까요? 자신의 생각을 자유롭게 정리해주시고, 여러분들이 생각한 문제를 해결하기 위해 어떤 조치를 어떻게 취해야하는지 적어주세요. (1~4일차 과제중에 힌트가 있습니다!)

    원래는 보안성을 위해 private subnet에 올리고 접근을 위해 NAT를 사용하게 되는데 만약 public으로 올리게 된다면 외부에서 쉽게 접근할수 있게 되고, 그로 인해서 서비스의 보안성이 취약해져 중요한 정보가 노출될수 있고, 외부에서 공격한다는 등의 문제가 발생할 수 있습니다. 이를 해결하기 위해 중요한 서비스는 rpviate subnet에 두고 안전하게 관리하는것이 좋을것같다고 생각이 됩니다.



참고 블로그

https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/ec2-instances-and-amis.html
