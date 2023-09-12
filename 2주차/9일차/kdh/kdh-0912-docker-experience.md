## 1. Docker 설치
docker desktop깔면 docker cli도 깔리는거 아녔나요?.. 무튼 구글에 docker [본인os]로 검색해서 다운로드 했습니다.
<img width="247" alt="Screenshot 2023-09-12 at 10 50 38 AM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/812764e0-bb52-43a5-b2e4-21180ec64bc3">

## 2. Docker 명령어들을 학습해봅시다.
- docker create [image] : 도커 이미지를 컨테이너로 실행, 정상 수행시 실행된 컨테이너의 해쉬값 반환, 로컬에 이미지가 없을 경우 docker repo에서 pull해옴
- docker start [container] : exited or created상태의 container를 실행
- docker stop [container] : 실행중인 container를 exited상태로 만듦 
- docker kill [container] : 실행중인 컨테이너를 강제로 exited상태로 만듦
- docker rm [container] : 중지된 컨테이널르 완전히 삭제시킴 실행중인 컨테이너의 경우 -f 옵션을 줘 강제로 삭제 가능
- docker run [image] : docker create + docker start
- docker cp : [container]:[container path] [host path]로 인자를 줄 경우 컨테이너에서 호스트로 파일을 복사하고 [host] [container]:[container path]로 인자를 줄경우 호스트의 파일을 컨테이너로 복사한다  
- docker ps : 실행중인 컨테이너 보여줌, -a할경우 모든 상태의 컨테이너 보여줌 -q를 줄경우 종료된 컨테이너만 보여줌
- docker inspect : 이미지나 컨테이너의 상세 정보를 보여줌 
- docker images : 로컬에 있는 이미지들을 보여 
- docker exec [container] [command] : 실행중인 컨테이너에 command를 실행시
- docker logs [container] : 컨테이너의 로그를 보여줌

docker create 실행시 created 상태로 실행됨
<img width="734" alt="Screenshot 2023-09-12 at 12 18 32 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/eabc70f2-24aa-407b-8b39-aa687e98fe6d">
정지 돼있는 컨테이너 다시 살림 ~~네크로멘서~~
<img width="726" alt="Screenshot 2023-09-12 at 1 46 09 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/c3324574-9c92-49f3-bfbd-066ad97f73f5">
created나 exited상태에선 rm시 즉시 삭제
<img width="586" alt="Screenshot 2023-09-12 at 12 19 46 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/91d4e482-f7eb-498d-a93f-08fd304e2314">
실행 중(up)에선 force remove하거나 중지후 삭제하라는 메세지
<img width="740" alt="Screenshot 2023-09-12 at 1 25 23 PM" src="https://github.com/GSM-MSG/DevOps-Onboarding/assets/81360154/88ffd156-7588-44d2-99c7-a49c3621d213">

## 3. Dockerfile 작성해보기
Dockerfile은 쓸 줄 아는데 앱딴에서 자꾸 오류가 떠서 결국 엄청 간단하게 작성했네요.. 


