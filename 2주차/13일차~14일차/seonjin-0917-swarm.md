## 데브옵스 온보딩 13~14일차


1. docker-swarm 이란?
    docker-swarm은 도커에서 만든 컨테이너 오케스트레이션 툴입니다. 여기서 컨테이너 오케스트레이션이란, 여러 호스트의 컨테이너 배포 및 관리, 제어를 자동화하는 것을 의미합니다. Swarm은 무리, 군중이라는 의미를 가지고 있습니다. Docker Swarm은 여러 컨테이너를 묶어 클러스터로 만들어 관리해줍니다.

2. container 클러스터링이란?
    클러스터링이란 똑같은 구성의 여러대의 서버를 병렬로 연결한 상태를 의미합니다. 여러대의 컴퓨터를 하나의 가상 컴퓨터처럼 업무를 수행하도록 하는것을 의미합니다. container 클러스터링도 마찬가지로 여러대의 컨테이너를 병렬로 연결해 하나처럼 작동하게 하는것입니다. 클러스터링 된 서버들중에서 한대에서 문제가 발생하더라도 로드밸런서에서 제거하여 전체적인 서비스에는 영향을 주지 않고 해결할수 있습니다.

3. docker-swarm 실습해보기
    docker swarm init --advertise-addr <host IP>
    
    host IP 부분에는 Swarm Master로 사용할 호스트의 IP를 입력합니다.

    가입할 Host에 Token을 입력하면 정상적으로 Join 됩니다.

    docker node ls로 Swarm에 속한 모든 노드를 볼 수 있습니다.

    AVAILABILITY를 보고 스케쥴러가 노드에게 Task를 부여할 수 있는지 확인 가능합니다.
    - Active : 스케쥴러가 Task할당이 가능한 상태
    - Pause : 이미 존재하는 Task는 실행 중이지만, 스케쥴러가 새로운 Task에 대해서 할당할 수 없음
    - Drain : 이미 존재하는 Task도 Shutdown되며, 사용가능한 노드로 스케쥴링 하게되고 스케쥴러가 새로운 Task에 대해서는 할당할 수 없음

    docker node inspect <node ID>를 입력하면 Swarm에 속한 해당 노드의 정보를 볼 수 있습니다.