## 1. 인터넷 게이트웨이란?
aws에서 vpc와 외부 인터넷을 연결해주는 게이트 웨이이다.<br>
하지만 private 서브넷에 있는 리소스와 직접 연결하지는 못(안?)한다

## 2. NAT 게이트웨이란?
private 서브넷에서 igw와 연결하기 위해 거치는 게이트 웨이이다.<br>
private 서브넷에서 나간 요청에 대한 응답은 받아들이지만 그냥 private 서브넷에 요청이 오면 차단한다.

## 3. NAT 게이트웨이와 NAT Instance의 차이점
nat instance가 nat 게이트웨이의 구식버전이다 ec2를 nat로써 사용한다<br>
하지만 nat 게이트웨이에 비해 비용이 1/3 이므로 기업입장에선 nat instance를 더 좋아한다.
이외 몇가지 차이점이다.
<img width="776" alt="Screenshot 2023-09-07 at 5 29 35 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/55444598-4670-4dda-a832-cb7664d7381a">

## 4. Routing Table?
router가 가장 빠르고 적은 홉 수로 목적지를 찾아갈 수 있게끔하는 테이블<br>
aws routing의 경우 "dest로 가려면 target으로 가라"와 같은 식으로 이루어져있다<br>
실제 라우터의 라우팅 테이블의 경우 더 복잡하게 이루어져있다

## 5. Bastion이 왜 필요할까?
위에서 외부에서 private 서브넷으로 들어오는 요청은 차단한다고 했다. 즉 ssh로 서버에 접속이 안된다느 소리이다.<br>
그런데 private 서브넷에 접속할 일이 생겼으면 어떡해야 할까? 이때 필요한 것이 bastion host이다.<br>
public 서브넷에 bastion host를 두고 private 서브넷의 보안그룹에 해당 호스트로 오는 요청만 허용하도록 하면 bastion host에 ssh접속후 private 서브넷에 접속하는 방식으로 진행된다.<br>

## 6. 실습
vpc와 subnet어제와 동일하게 생성

nat gateway
<img width="1187" alt="Screenshot 2023-09-07 at 6 15 30 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/37d719c6-565e-47a8-b382-40e85456ef38">

igw
<img width="932" alt="Screenshot 2023-09-07 at 6 08 31 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/3a67e092-6732-48c3-9ee5-48bc4b7a6bd4">

routing table
<img width="909" alt="Screenshot 2023-09-07 at 6 19 48 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/e5c7df2a-c6c7-4b38-b139-6280a3c56687">
<img width="922" alt="Screenshot 2023-09-07 at 6 17 52 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/0af187af-b379-4f16-8c4c-40c79d7edc10">

subnet에 routing table 연결
<img width="944" alt="Screenshot 2023-09-07 at 6 21 47 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/b64d1075-0bca-47a0-a9e6-914bbad30979">
