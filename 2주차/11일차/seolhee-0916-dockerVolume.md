## 도커 볼륨이란?
![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FWcukC%2Fbtq8G5Hlcb4%2FdTrdl4TQqp9sw3lrEFceKk%2Fimg.png)
컨테이너를 종료하면 내부 데이터가 다 날아간다.

* Docker 컨테이너의 생명 주기와 관계없이 데이터를 영속적으로 저장하기위한 별개의 공간
### 어떤게?
볼륨은 모든 데이터 유형을 저장할 수 있기 때문에 데이터 볼륨이라고 한다.

코드가 될 수도 있고 로그파일 일 수도 있다.

##  호스트와 볼륨을 공유하는법
컨테이너를 생성할 때 -v 옵션을 사용하여 호스트의 디렉터리와 컨테이너 디렉터리를 공유한다.

`docker run -d --name devtest -v myvol2:/app nginx:latest`

존재하지 않는다면 자동으로 만들어서 공유한다.    

Volume을 생성해서 연결한다.

-v 옵션을 사용해서 볼륨에 연결한다.

` docker run -v /home/ec2-user/ahachul_data/datas/:/home -d -p 80:8080 --name XX ...`


## 도커가 관리하는 볼륨을 생성
`docker volume create {name}`
* 하나의 볼륨을 서로 다른 컨테이너가 동시에 마운트해서 사용할 수 있다는 것이 특징이다.
* /var/lib/docker/volumes/{volumes_name}/_data  에 저장된다.
> 마운트 : 볼륨을 사용하지 않고 Host의 디렉토리에 직접 Access하는 것을 말한다.

## 도커 로그
docker에서 생성된 로그를 확인할 수 있다.

나는
`docker logs -f {container_id}`
이거 많이 써서 봤다

* 로그도 날짜/시간 별로 나눠서 볼 수 있다.
    * 전체 로그 보면 너무 많아서 힘들 수 있다..

`docker logs --tail 10 <CONTAINER_id>`

최근 10개만 보는건데 test 할 때 유용하게 썼다