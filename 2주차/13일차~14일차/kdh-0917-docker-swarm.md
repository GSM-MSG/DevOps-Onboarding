## 1. docker-swarm 이란?
docker compose가 한 호스트에서 여러 컨테이너를 띄우게 해주는 도구였다면<br>
docker swarm은 여러 호스트에서 docker를 사용할 수 있게 해주는 orchestraion도구이다.(참고로 k8s도 orchestration 도구이다.)<br>
사실 k8s가 orchestraion 도구의 de facto, 사실상 표준으로 자리 잡으면서 현재는 거의 안쓰이는 것으로 알고 있다.<br>
그래도 만약 컨테이너를 도커로 사용하고 있다면 k8s보다 훨씬 쉽다.

- 노드: 도커가 돌아가는 한 호스트를 의미한다.
- 매니저 노드: 클러스터 관리와 컨테이너들의 orchestration을 담당한다. 매니저노드 또한 HA(고가용성)을 위해 여러 대를 띄어놓길 추천하고 k8s와 다르게 매니저 노드 또한 결국엔 워커 노드처럼 작동할 수 있다. 물론 k8s처럼 매니저 노드에 대한 스케쥴링을 막을 수도 있다.
- 워커 노드: 실제 도커 컨테이너가 돌아가는 호스트이다.
- 서비스: 하나의 이미지를 기반으로 해당 이미지에 대해 여러 설정을 한 것을 의미한다. 해당 이미지를 몇개(replica)띄울지, 어떤 volume을 붙일지, 어떤 노드에 해당 컨테이너를 배치시킬 수 있는지 등등 
- 태스크: 서비스의 명세에 따라 각 노드에 생성되는 개별 컨테이너가 태스크이다. 각 태스크에는 서비스명.일련번호 형태의 이름이 붙게 된다
- 스케쥴링: 서비스 명세에 따라 컨테이너를 노드에 분배하는 작업을 의미한다.

## 2. container 클러스터링이란?
여러 호스트에서 돌아가는 컨테이너를 클러스터라는 추상적인 개념으로 관리할 수 있게 해주는것.<br>
큰 기업에선 정말많은 컨테이너를 여러 호스트에서 돌리고 있고 이를 개별로 관리하는 것은 정말 어려운일.<br>
실행해야 할 애플리케이션, 이미지, 사용할 수 있는 이미지, 스토리지, 네트워킹, 보안 같은 서비스를 보다 간편하게 관리,설정 가능 

## 3. docker-swarm 실습해보기
t2.micro ubuntu image로 3개 생성
<img width="805" alt="Screenshot 2023-09-17 at 3 19 20 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/79e701eb-d2eb-4614-8276-df81e37966fd">
<img width="796" alt="Screenshot 2023-09-17 at 3 20 12 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/8fbf4f12-421b-4816-8831-a91dff63897f">
<img width="804" alt="Screenshot 2023-09-17 at 3 19 42 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/5fae1222-1b41-4d4a-aa5e-0fed4d688928">

그리고 docker swarm에서 필요로 하는 포트들 뚫어줌
<img width="629" alt="Screenshot 2023-09-17 at 3 17 17 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/ab00a055-5df7-4390-b5dd-977624f3c433">
<img width="828" alt="Screenshot 2023-09-17 at 3 21 10 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/bd05f9b7-11e0-4c7e-a1bb-d227cba5eaaa">


매니저 노드 지정

<img width="482" alt="image" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/a6f7b448-0ddb-44a5-83b7-42c1ee05fc2a">

docker engine자체에 docker swarm이 통합되어 있으므로 도커가 깔려있다면 바로 스웜 모드실행이 가능하다
<img width="707" alt="image" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/a9bab0b2-132e-43f1-b19e-8f977f893848">

나머지 두 인스턴스를 워커노드로 join
<img width="710" alt="image" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/ed9e38b8-bd3c-4924-805b-27044b8dac08">
<img width="703" alt="Screenshot 2023-09-17 at 3 38 54 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/ce7fb5cf-4c7b-4b44-a6b8-cb2569e447e6">

사설 ip로 docker swarm init을 했기 때문에 로컬에선 join이 안되는 모습
<img width="704" alt="Screenshot 2023-09-17 at 3 44 29 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/d172a61d-ae20-40dd-93ff-574fce7ca73a">

이를 해결하고 싶다면 docker swarm init시 --advertise-addr옵션에 공인 ip를 넣어주면 된다.

docker node ls를 통해 cluster의 노드들 상태 확인
<img width="705" alt="Screenshot 2023-09-17 at 3 39 31 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/d628ad55-5de7-4566-8d88-dcac71c5c466">

특정 서비스 생성
<img width="707" alt="image" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/a60ce03d-cb19-457e-985f-0990e7cdd36a">

<img width="707" alt="Screenshot 2023-09-17 at 3 50 43 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/798a6b37-a7b9-49a2-8ccc-374f9b592218">

어느 인스턴스에 접근하든 잘 작동하는 모습
<img width="441" alt="Screenshot 2023-09-17 at 3 53 43 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/13e443df-5fe4-46cc-9000-6d063f50ed79">
<img width="479" alt="image" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/8a5d5a21-dbff-46bd-b3e5-7ed84ea9602f">
<img width="355" alt="image" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/e318dfa7-0757-467e-a045-f6f0baa3c926">
