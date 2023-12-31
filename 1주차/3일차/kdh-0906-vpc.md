# network 기초
### 공인/사설 ip
<img width="626" alt="Screenshot 2023-09-06 at 10 50 32 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/81e20e72-3353-4386-8b6d-4abad1473220">

IP라 하면 배웠을 때 고유하다고 그리도 또 부족하다고 배웠을 것이다.<br>
하지만 IP가 곂치는 것을 많이 봤었을 것이다. 예를 들어 172.xx.xx.xx나 192.168.xx.xx 등등<br>
처음 말한 IP가 공인 IP이고 그런 공인 IP의 문제점인 갯수 부족을 해결하기 위한 사설 IP가 두번째에 말한 애들이다<br>
공인 IP는 전체 인터넷에서 고유하고 사설IP는 사설망 내에서만 고유하다.<br>
이러면 당연히 사설IP로는 인터넷 통신을 할 수 없다. 같은 IP가 존재할테니 받은 서버에서 출발지ip를 보고 보내려는데 이 IP가 여러 곳 존재할테니 말이다.<br>
이에 게이트웨이 란것을 사용하는데 게이트웨이는 공인IP를 가진다. 그리고 게이트웨이의 사설망안에 있는 사설IP를 가진 기기들이 통신을 하려할때 게이트웨이의 공인IP로 치환 시켜 보내준다. 이때 당연히 게이트웨이 하나당 하나의 사설망을 가질 것이다. 위 사진을 참고하자<br>
그러면 사설망에서 밖으로 나갈때는 그저 공인IP로 치환돼 나간다 해도 외부에서 사설망으로 들어올땐 위 사진과 같이 사설망에 기기가 하나만 있는 경우가 아닌 이상 내부 사설망의 어떤 기기로 보내줘야할지 혼동이 생긴다. 이를 위해 PAT(NAPT라고도 불린다)방식을 사용한다<br>
PAT에 간단히 설명하면 내부IP:포트를 공인IP:포트로 치환하는 방법이다. 그러면 내부에 A와 B가 있을때 외부에서 들어오는 들어오는 80포트는 A:1010으로 1212들어오는 포트는 B:22로 매칭시켜주면 되니 말이다.<br>
<b>여기서 개인적인 의문은 사설망컴퓨터들이 사용하는 포트들을 전부 합쳐 65536개를 사용하면 어떻게 되냐이다. 내부 사설망의 기기들의 열린 포트를 전부합쳐 65536개인 것이니 각 컴퓨터들은 아직 열 수 있는 포트가 남아있을테니 말이다.</b>

### 서브네팅
서브네팅은 정말 이해될때 까지 계속 알아봐도 좋을거같다.<br>
subnetwork에서 sub즉 큰 네트워크아래에 작은 네트워크들로 나누는 것이다.<br>
목적은 라우팅시 전부 브로드캐스팅하는 것이 아닌 서브네팅하여 나온 네트워크에만 패킷을 보내 성능을 높힐 수 있고, 필요에따라 각 서브네트워크마다 용도를 나눠 관리를 용이하게 할 수 있다. 그리고 보안적으로도 이득이 있다고 한다.(개인적으로 관리 용이와 보안 부분에서의 장점은 크게 와닿지는 않는다)<br>
대충 예시를 들어보자면 200.123.100.0/24 라는 IP를 할당 받았다고 하자 여기에 사무용 pc25개와 서버용 15개를둔다고하자. 그러면 서브네팅을 어떻게 해줘야할까<br>
25개가 마스킹했을때 곂치지 않고 들어갈 수 있는 망이려면 당연히 25개보다 커야할 것이다. 그리고 우리는 최대한 효율적으로 망을 사용하고싶다. 그러면 25보다 크고 가장 최소한의 망인 32개가 필요하다 그러면 이를 이진수로 표현할때 1110 0000 이고 27이라는 마스크를 주면 되겠다.<br>
그러면 우리는 200.123.100.0/27, 200.123.100.32/27, ... , 200.123.100.224/27 중 하나를 저 사무용pc들이 사용할 서브넷으로 사용할 수 있다. 그럼 200.123.100.0/27을 줬다하고 다음 서버들의 서브넷을 만들어주자<br>
이번에도 똑같이 15보다 크고 가장 작은 망 개수인 16을 주면 될까? 물음표에서 예상할 수 있듯이 아니다. 왜냐하면 서브넷에는 게이트웨이 주소와 브로드캐스트 주소를 할당해주어야하기 때문이다. 즉 원래 호스트 개수에 2개를 더해 계산해줘야한다.그럼 15+2 = 17 보다 크고 가장 최소한의 망인 32개를 줄 수있겠다. 이번에는 200.123.100.32/27를 주자<br>

아마 위 서브네팅 설명과 문제를 처음 공부하는 사람이 보면 당연히 이해가 안될 것이다. 그러니 서브넷 공부를 더 하고 와서 문제를 다시 봐 이해할 수 있을때까지 공부하면 좋겠다. 물론 필자도 아직 제대로 이해하지 못한거같다.

# VPN
같은 사설망 즉 한 게이트웨이 내부에 있지만 논리적으로 다른 네트워크에 있는 것처럼 동작하도록 하는 것이다.<br>
라고 이해는 했지만 어떻게 구현되는지 잘 모르겠다

# VPC
VPN을 클라우드 환경에서 구축한 것이다.<br>
한 VPC에 부여할 수 있는 아이피 대역은 아래와 같음만 보고 넘어가자<br>
- 10.0.0.0 ~ 10.255.255.255(10/8 prefix)

- 172.16.0.0 ~ 172.31.255.255(182.16/12 prefix)

- 192.168.0.0 ~ 192.168.255.255(192.168/16 prefix)


# 실습
### VPC
<img width="943" alt="Screenshot 2023-09-07 at 12 09 18 AM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/4231d956-d2f2-451e-8c04-cc37240bb1a7">

### subnet
<img width="869" alt="Screenshot 2023-09-07 at 12 07 21 AM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/11f341ba-9cc7-455b-81ba-2cc6f49d9147">
<img width="869" alt="Screenshot 2023-09-07 at 12 07 25 AM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/02542ff6-babc-4c69-95e4-656f331feba7">
<img width="836" alt="Screenshot 2023-09-07 at 12 07 29 AM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/d222bf1d-f2f2-497a-b077-7ade7e859e2c">
