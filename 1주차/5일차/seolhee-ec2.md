##  EC2 인스턴스란?
### 크기 조정이 가능한 컴퓨팅 용량!
* 탄력성
    * 스케일 업, 스케일 다운 등 스케일링이 편하고 컴퓨터 유형과 사이즈를 선택해서 할당받을 수 있음

### 리소스 완전제어
* 온프레미스 서버에서 했던 작업을 그대로 구현할 수 있음

### 연동
* ELB, S3, RDS 등 여러 AWS Service와 통합할 수 있음

### 보안
* AWS 기업에서 제공하는 여러 보안 단계 (완전 든든)
* VPC내에서 동작하기 때문에 컴퓨팅 리소스에 계층적인 보안을 적용하여서 더욱 안전하게 사용할 수 있음


---

## AMI란?
> AMI란 운영체제, 애플리케이션 서버, 애플리케이션과 같은 필요한 소프트웨어 밒 AMI 시작권한 그리고 시작 될떄 인스턴스에 연결할 볼륨을 지정하는 블록디바이스맵핑 등이 구성된 템플릿이다.

*도커 이미지 생각하면 쉬움*

### 활용 방안
ec2에 아파치+웹서버 깔아둔 상태로 이미지화 시키면
다른 ec2에 내가 만든 이미지를 적용시켜서 똑같은 웹서버 2개를 반복작업 없이 띄울 수 있음.

---

## 보안그룹이란?
보안적인 규칙들이 모아져있는 그룹.

### 보안그룹 만드는 룰!
> 인바운드란 클라이언트에서 자신의 서버 데이터에 들어올 수 있는 규칙을 말함

> 아웃바운드란 서버에서 외부로 나가는 규칙을 의미함

* 인바운드 트래픽을 허용할 것만 지정한다
    * 아웃바운드는 보통 다 연다
* 포트번호와 트래픽으로 필터링 한다.

---

## EC2 Instance 실습
vpc, subnet, igw, nat, rtb는 어제와 똑같이 생성해줍니다.
![](https://cdn.discordapp.com/attachments/954177766604030013/1149265121793810462/seolhee-vpc.png)

![](https://cdn.discordapp.com/attachments/954177766604030013/1149265121290489906/seolhee-subnet.png)
Vpc 대역폭 안에 서브넷 생성해주는 게 중요합니다. (어차피 안 만들어짐)

![](https://cdn.discordapp.com/attachments/954177766604030013/1149265120334188564/seolhee-nat.png)
오늘은 private subnet에 위치시킬 서버가 없기 때문에 이건 만들기만 하고 굳이 연결은 안하겠습니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1149265120896229446/seolhee-public-rtb.png)
routing table에 internat gateway 연결해주고 public subnet 할당해줍니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1149615738248773642/2023-09-08_17.02.27.png)

보안그룹 최소한만 오픈하라는 뜻은 0.0.0.0 anywhere로 열지말고 내 ip로 열어봅시다. 

public ip로 접근할거니까 http도 내 ip로 열어줍니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1149737406711484537/2023-09-09_01.05.55.png)
ec2는 Amazon Linux2 AMI를 선택해줍니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1149737182819532810/2023-09-09_01.04.58.png)
Network Setting에서 vpc 생성했던 걸로 바꿔주어야합니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1149617488905117737/2023-09-08_17.09.22.png)

`sudo yum httpd -y`
아파치 깔아주고 

`systemctl start httpd`
아파치 실행합니다

` cd /var/www/html `
디렉토리 가서

`vim index.html`
아래 내용 복사해줍니다.

`systemctl restart httpd`
명령어로 서버를 재시작하여 변경사항을 적용시켜줍니다.
````
<html>

<body>Hello, world!</body>

</html>
````
간단하게 Hello, world!를 반환하는 화면입니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1149617686045790208/2023-09-08_17.10.10.png)


## 실습처럼 EC2를 퍼블릭으로 올리게되면 어떤 문제가 생겨날까요? 
어제 bastion 실습 한 것 처럼 보안적인 문제가 대두 될 수 있습니다.

*  EC2 인스턴스가 공개되면 그 안에 저장된 개인 정보나 민감한 데이터가 노출될 위험있음
* 다른 사용자가 자원을 사용할 수 있음
* 공격자가 인스턴스에 액세스하고 시스템을 해킹할 수 있음