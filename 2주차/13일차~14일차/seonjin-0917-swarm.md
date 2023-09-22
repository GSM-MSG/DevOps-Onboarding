## 데브옵스 온보딩 13~14일차


1. docker-swarm 이란?
    docker-swarm은 도커에서 만든 컨테이너 오케스트레이션 툴입니다. 여기서 컨테이너 오케스트레이션이란, 여러 호스트의 컨테이너 배포 및 관리, 제어를 자동화하는 것을 의미합니다. Swarm은 무리, 군중이라는 의미를 가지고 있습니다. Docker Swarm은 여러 컨테이너를 묶어 클러스터로 만들어 관리해줍니다.

2. container 클러스터링이란?
    클러스터링이란 똑같은 구성의 여러대의 서버를 병렬로 연결한 상태를 의미합니다. 여러대의 컴퓨터를 하나의 가상 컴퓨터처럼 업무를 수행하도록 하는것을 의미합니다. container 클러스터링도 마찬가지로 여러대의 컨테이너를 병렬로 연결해 하나처럼 작동하게 하는것입니다. 클러스터링 된 서버들중에서 한대에서 문제가 발생하더라도 로드밸런서에서 제거하여 전체적인 서비스에는 영향을 주지 않고 해결할수 있습니다.

3. docker-swarm 실습해보기
    docker swarm init 명령어로 swarm 모드를 활성화 시켜줍니다.

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/15ae945c-443d-44ea-89e5-4c2bed7775d1)

    docker node ls로 Swarm에 속한 모든 노드를 볼 수 있습니다.

   ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/e440f746-01ed-4e4b-81a6-6fa6e4984144)

    AVAILABILITY를 보고 스케쥴러가 노드에게 Task를 부여할 수 있는지 확인 가능합니다.
    - Active : 스케쥴러가 Task할당이 가능한 상태
    - Pause : 이미 존재하는 Task는 실행 중이지만, 스케쥴러가 새로운 Task에 대해서 할당할 수 없음
    - Drain : 이미 존재하는 Task도 Shutdown되며, 사용가능한 노드로 스케쥴링 하게되고 스케쥴러가 새로운 Task에 대해서는 할당할 수 없음


   docker service create 명령으로 서비스를 생성할 수 있습니다. 블로그에 있는 5개의 레플리카로 구성된 nginx 서비스를 생성하는 예제

   docker service create --name nginx --replicas=5 --publish=8080:80 nginx:latest

   를 사용해 생성해봤습니다. 

   옵션으로
    --name : 서비스의 이름을 지정한다. 지정하지 않을 경우 임의의 단어 조합으로 생성

    --replicas : 서비스를 구성할 태스크(컨테이너)의 수를 지정한다. 지정된 숫자 만큼의 태스크가 클러스터의 가용 노드에 배치

   --publish : 포트 포워딩을 통해 클러스터 외부에서 해당 서비스로 접근 가능한 포트 경로를 지정. 만약 따로 지정하지 않는다면, 스웜 매니저(Swarm Manager)가 30000~32767 범위 안에서 임의의 포트를 할당

     nginx:latest : 태스크에 포함시킬 이미지 정보를 지정

   이 있습니다. 마지막 이미지 정보 지정하는 옵션 말고는 다 선택사항입니다.

   docker service ls 로 현재 실행중인 서비스들을 볼수 있습니다.
   ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/e4adc373-1b0e-4b03-bcdb-2ea1680d196d)

    특정 서비스에 포함된 태스크들의 현재 상태를 확인하기위해 docker service ps <서비스명>을 입력해줍니다
    
    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/013ebeab-1493-4c1f-b508-8056489fbcac)

   마지막으로 docker service rm <서비스명>을 이용해 삭제해줍니다.

   ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/383cff55-696c-446c-b0d9-682beb07f492)



   참고한 블로그
     https://seongjin.me/docker-swarm-services/
