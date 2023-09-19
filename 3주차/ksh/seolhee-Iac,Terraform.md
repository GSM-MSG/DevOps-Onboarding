## Iac란?
![](https://velog.velcdn.com/images/jm1225/post/033f55f8-7ec7-40b2-91ca-9e6267f1ffdb/image.png)

코드형 인프라! 

코드를 통해 인프라를 관리하고 프로비저닝하는 것을 뜻한다.

파일의 내용에 따라 인프라가 만들어진다.

서버, 데이터베이스, 네트워크, 로그 파일, 애플리케이션 구성, 문서, 자동화된 테스트, 배포 프로세스 등 거의 모든 것을 *코드(스크립트)로* 관리 가능하다


### 종류

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F93Y14%2FbtryyAnHFLo%2F9yppNntbkJ3aJeTsIuqIfk%2Fimg.png)

### Provisioning Tool 
* AWS CloudFormation 
* Terrafrom

### SCM Tool
* 앤서블
    * 자동화 관리 도구로 오픈 소스 기반으로 제작  
    * SSH를 기반으로 Target Host에 Agentless방식으로 자동화를 구성, 관리함



## Iac가 필요한 이유
처음엔 오히려 GUI로 딸각딸각 하나씩 이어주는 게 훨씬 빠르지 않아?라고 생각했는데 서브넷 CIDR 바꾸고싶어서 rtb 할당한거에서 지우고... 뭐 그런 복잡한 짓을 하는 것보다 스크립트에서 CIDR 대역 바꾸면 끝나는 일이란 걸 알았다. 그 뒤로 매우매우 관심이 생겨서 실제로 공부하고 있기도 하다!

그리고 Iac는 최종적인 인프라를 생각하고 구축하기 때문에 에러가 날 확률이 적고 생각을 크게크게 할 수 있다. 

~~다 계획/구성 하는게 특징이라 아키텍처 그려두면 너무 편하다~~

### 이점
* 배포 속도 향상
    * 수동으로 코드를 변환하지 않아도 되므로 소프트웨어를 효율적으로 배포 가능
    * 자동화된 프로세스는 일관되고 반복 가능하며 수동으로 진행했을 때 보다 오류가 적게 발생하기 때문에 더 안전하다
* 오류 감소 
    * 코드로 되어있으니까 스크립트처럼 내리기만 하면 됨!(ex: GUI rtb에 nat/igw 등 연결되어있는 걸 찾아가며 확인하지 않아요 무슨 느낌인지 알겠쥬?)
* 인프라 일관성 향상


## Terraform 이란?

> 하시코프(Hashicorp)에서 오픈소스로 개발중인 클라우드 인프라스트럭처 자동화 를 지향하는 코드로서의 인프라스트럭처(IaC)도구이다.
코드를 통해 인프라 서버를 구축/운영 할 수 있게 해주는 오픈 소스 소프트웨어이다.


### 장점
* AWS에서 새로운 서버를 생성 하기 위해서 AWS 콘솔에 로그인할 필요없이 Terraform 코드를 실행시키면 돼서 자동화 가능!
* 코드로 실행 되기 때문에 사람이 수동으로 작업하는 것 보다  훨씬 빠르며  또한 사람이 직접 할 때 생길 수 있는  실수들을 방지할 수 있음!
* 모든 인프라가 코드로 기록 및 관리 되기 때문에  자동으로 문서화가 된다!
* git에 올려서 코드 리뷰와 테스트를 통해  문제가 실제로 발생 되는 것을 어느 정도  예방가능

https://btcd.tistory.com/20

## Tf 실습
*main.tf 으로 한 번에 묶는 대신 다 나눠서 실습 진행했습니다*

![](https://cdn.discordapp.com/attachments/954177766604030013/1153591606167994450/2023-09-19_16.21.04.png)
`terraform init` 으로 git init처럼 알려준다 테라폼 파일 있어용~
![](https://cdn.discordapp.com/attachments/954177766604030013/1153635043202322503/2023-09-19_19.13.39.png)
cd로 디렉토리 옮겨줘야해요~
![](https://cdn.discordapp.com/attachments/954177766604030013/1153636252277555220/2023-09-19_19.18.29.png)
`terraform apply` 소스 만든다!! -> yes를 쳐준다
그러면 저렇게 돼요!!!

![](https://cdn.discordapp.com/attachments/954177766604030013/1153640944906809426/2023-09-19_19.37.09.png)
public-rtb에 igw, subnet을 다 할당했다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1153640984228397106/2023-09-19_19.37.19.png)
public-rtb에 igw, subnet을 다 할당했다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1153641279805202443/2023-09-19_19.38.31.png)
priave-rtb에 nat, subnet을 다 할당했다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1153641303091978300/2023-09-19_19.38.37.png)
priave-rtb에 nat, subnet을 다 할당했다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1153643305431736340/2023-09-19_19.46.30.png)
ec2 tag name  대로 생성됐는데 가용영역 지정을 안 했더니 2c에 생겨서
![](https://cdn.discordapp.com/attachments/954177766604030013/1153645408690634763/2023-09-19_19.54.54.png)
`availability_zone = "ap-northeast-2a` 추가해주니까 원하는 가용영역에 생겼다!

![](https://cdn.discordapp.com/attachments/954177766604030013/1153661824357642260/2023-09-19_21.00.06.png)
`terraform destroy` 테라폼으로 생성한 리소스를 모두 삭제시킬 수 있습니다.

![](https://cdn.discordapp.com/attachments/954177766604030013/1153662922137014303/2023-09-19_21.04.27.png)
지워줍니다~

.csv는 iam 접근권한이 없어서 user 못 지웠습니다!