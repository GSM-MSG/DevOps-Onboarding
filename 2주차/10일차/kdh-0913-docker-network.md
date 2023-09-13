## 도커 네트워크 구조
도커 네트워크는 CNM(container network model)이라 하는 설계도를 참고해 Libnetwork라는 이름으로 구현 돼 있다.<br>
위 부분은 너무 deep해서 다음에 시간나면 알아보기 위해 키워드만 저장해두고 추상적인 부분만 얘기해보자면<br>

![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/448f6e69-f3d1-4675-bfbb-32955ef05e84)

출처: https://gngsn.tistory.com/137

container는 생성되면 lo(localhost)와 eth0 라는 두개의 인터페이스가 생성된다 로컬호스트는 뭐 건너뛰고 eth0에 대해 알아보자면<br>
eth0은 포함된 네트워크의 대역의(기본은 127.17.x.x/16) ip를 할당 받는다.(물론 사설)<br>
이러는 와중에 호스트에는 container의 eth0에 매핑되는 veth라는 가상 네트워크 인터페이스가 만들어진다.<br>
그리고 이 가상 네트워크 인터페이스들은 호스트의 docker0이라는 default 브릿지에 바인딩된다.(docker0 은 default라 사용자가 직접 브릿지를 생성하면 다른 이름으로 생성된다)<br>
결국 호스트가 하나의 사설망이라 할때 docker0이 컨테이너들의 게이트웨이가 되는 셈이지.<br> 

## 도커 네트워크 드라이버
도커의 네트워크 드라이버에는 도커가 자체적으로 제공하는 native driver와 외부에서 제작된 서드파티 플러그인이 있다.

### native
- Bridge : 같은 호스트 상에서 여러 컨테이너의 통신이 필요할 때
- Host : 컨테이너로 분리되길 원하지만, 네트워크 스택은 분리되지 않길 원할 때 (호스트 네트워크를 같이 쓰길 원할 때)
- None : 최소한의 네트워크 환경만을 생성하고 싶을 때
- overlay : 다른 호스트 상에서 실행되는 컨테이너가 통신해야 할 때나, 스웜 서비스로 여러 앱이 실행되어야 할 때
### third party plugin
- weave
- flannel(오.. k8s에서 봤던거 같은데)
- openvswitch
- ...

서드파티는 제쳐두고 네이티브 네트워크 드라이버에대해 알아보자<br>
그중에서도 bridge, host, none만

![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/480e5b7d-574e-45e5-8850-33f5e8e2797e)

출처 : https://gngsn.tistory.com/137

간단한거부터 알아보면 none 말 그대로 네트워크가 존재하지 않는다. 격리되어있다.<br>

다음은 host, host모드는 말그대로 호스트의 네트워크를 사용(?)한다.<br>

마지막으로 bridge, 같은 브릿지의 컨테이너끼리는 톹신이 되고 다른 브릿지의 컨테이너끼린 통신이 안된다.<br>
사실 docker를 사용하는데에 있어서는 이것만 알아도 충분하다고 개인적으로 생각한다.

![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/90cc8a9b-4cd4-4271-be97-d4c5cbfd8cb3)

출처: https://gngsn.tistory.com/140

글의 첫번째 사진과 비교해보자