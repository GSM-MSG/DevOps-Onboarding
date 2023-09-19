## Iac란?
![](https://velog.velcdn.com/images/jm1225/post/033f55f8-7ec7-40b2-91ca-9e6267f1ffdb/image.png)

코드형 인프라! 

코드를 통해 인프라를 관리하고 프로비저닝하는 것을 뜻한다.

### 종류
Terrafrom
패서블
앤서블 Ansible (앤서블)은 여러 개의 서버를 효율적으로 관리할 수 있게 해주는 IT 환경 구성 자동화 도구




## Iac가 필요한 이유
처음엔 오히려 GUI로 딸각딸각 하나씩 이어주는 게 훨씬 빠르지 않아?라고 생각했는데 Iac는 최종적인 인프라를 생각하고 


## Terraform 이란?

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