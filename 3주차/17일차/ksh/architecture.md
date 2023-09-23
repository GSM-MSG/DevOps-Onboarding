# 3 tier architecture

## 설명

![seolheeArchitecture](https://cdn.discordapp.com/attachments/954177766604030013/1155014304865722409/2023-09-23_14.34.24.png)

고가용성까지는 필요없어서 2개의 AZ로 구성을 하였습니다.

IAM 롤로 Ec2 등 리소스 접근 권한을 설정합니다.

프로젝트에 따라서 백엔드/데브옵스 user 권한도 할당할 수 있습니다.

VPC Endpoint를 사용해서 Public Access를 차단한 S3 버킷과 S3에 접근할 수 있는 IAM role을 가진 EC2 인스턴스는 S3에 접근할 수 있게 구성했습니다.

EFS EBS 등 스토리지 서비스는 있지만 특별한 거 아닌이상  s3가 가장 노멀한 것 같아서 s3 그렸습니다.

* 트래픽에 따른 비용 절감을 기대할 수 있고 private S3 접근은 해야할 거 아녜요~!~!
* watch에서 어플리케이션 모니터링도 해야하기 때문에 사용해주었습니다!


왼쪽은 백업용으로 구성한 느낌입니다.

전국과제를 풀다가 기본적인 3tier 아키텍처 형식이길래 그려봤습니다!!

아키텍처를 3번이나 바꿔서.. 늦게 올라온 점 양해 부탁드려요.

가장가장 기본적인 아키텍처라고 할 수 있죠 백엔드 쪽에서 보면 레이어드 아키텍처랑 되게 비슷해 보이더라고요!

---
### 회고

네트워크가 필요없는 리소스들과 있는 리소스들을 다시 한 번 상기시키기 돼서 공부하게 됐어요 


모니터링/로깅 파이프라인도 구축해보는 걸 그리고 싶었는데 오버스택 같아서 MSA나 ECS 적용된 아키텍처에 그려볼려고 합니다

아키텍처에 없는 서비스 설명도 있는데 기존에 그렸던 거 정리한 게 아까워서 일단 같이 올려봅니다

----
## 서비스

### CloudFormation
* AWS의 대표적인 IaC 기반의 구성 조정 도구
* AWS 리소스를 수동으로 생성하거나 구성할 필요가 없고 어떤 것이 무엇에 의존하는지 파악할 필요가 없음.
* JSON, YAML 이용하여 작성.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbgs8rp%2FbtraWTqsGR6%2FRTfCpFA2tStZyKBzKDjJ21%2Fimg.png)
작동 방식 
Stack을 생성하고 Stack에 대한 변경 사항을 확인 및 업데이트Stack 생성 및 변경 중 에러 감지를 통한 롤백 지원

### PostgreSQL
> ORDBMS(객체 관계형 데이터베이스 관리 시스템)

* PostgreSQL은  무료이며 오픈 소스 소프트웨어이다. 소스 코드는 자유 오픈 소스 라이센스인 PostgreSQL 라이센스에 따라 
제공되고 있다. PostgreSQL은 어떤 형태로든 자유롭게 사용, 수정 및 배포할 수 있다.


### EFS
* EC2용 관리형 파일 스토리지
* Linux 인스턴스에만 사용가능 (Windows 지원하지 않음)
* 파일이 추가 또는 제거됨에 따라 자동으로 확장 및 축소
* 복잡한 파일시스템을 배포 및 패치가 필요 없다
* 필요한 만큼 자동으로 스토리지 공간 확보
* NFS Protocol 사용
    *  원격 파일 공유 프로토콜  
* 높은 가용성 및 내구성을 제공 하도록 설계
    * 스토리지 서비스 비교 https://inpa.tistory.com/entry/AWS-%F0%9F%93%9A-S3-EBS-EFS-%EC%8A%A4%ED%86%A0%EB%A6%AC%EC%A7%80-%EC%84%9C%EB%B9%84%EC%8A%A4-%EB%B9%84%EA%B5%90

### Instance Store vs EFS vs EBS
Instance Store : IO를 최대로 사용하게 해줌, 임시 드라이브
EFS : 다수의 인스턴스에 걸쳐 연결해야하는 네트워크 파일 시스템에 적합
EBS : 네트워크 볼륨을 한 번에 하나의 인스턴스에 연결할 수 있고 특정 AZ에 한정

### EFS Mount Target
* VPC 안의  AZ Subnet에 Mount Target 생성
* AZ의 Subnet 하나만 Mount Target이 생성
* AZ의 Subnet 두개일 경우 한개만 Mount Target 생성이 가능 

### VPC Endpoint
* Private 네트워크에 있는 인스턴스에서 VPC 외부의 AWS 서비스와 통신이 필요한 경우 사용
* 유형
    * Interface
        * Network Load Balancer를 사용하여 트래픽을 분산하는 엔드포인트 서비스로 트래픽을 전송하기 위한 인터페이스 엔드포인트 를 생성한다.  엔드포인트 서비스로 향하는 트래픽은 DNS를 사용하여 확인됨.
    * GatewayLoadBalancer
        * 게이트웨이 로드 밸런서 엔드포인트 를 생성 하여 프라이빗 IP 주소를 사용하여 가상 어플라이언스 집합에 트래픽을 보낸다.  라우팅 테이블을 사용하여 VPC에서 게이트웨이 로드 밸런서 엔드포인트로 트래픽을 라우팅함.  게이트웨이 로드 밸런서는 트래픽을 가상 어플라이언스로 분산하고 수요에 따라 확장할 수 있음.
    * Gateway
        * 프라이빗 IP 주소를 사용하여 Amazon S3 또는 DynamoDB로 트래픽을 전송 하는 게이트웨이 엔드포인트 를 생성함.  라우팅 테이블을 사용하여 VPC에서 게이트웨이 엔드포인트로 트래픽을 라우팅함.  게이트웨이 엔드포인트는 AWS PrivateLink를 활성화하지 않음.