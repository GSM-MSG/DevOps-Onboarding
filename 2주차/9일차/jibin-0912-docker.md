# 1. Docker 설치

## Docker Desktop

![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/222a4a9e-ead0-4136-a2b3-3c9f3278f01b)

- Download and install을 눌러 다운받습니다.

![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/e8a30e80-deab-4a09-82b9-37ee684625ac)


- OS에 맞게 설치합니다.

![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/10d82ddb-b641-416d-9dcc-14b1ad603ca4)


- 설치 후 이러한 화면이 나오게 됩니다.

# 2.Docker 명령어

1. **도커 이미지 관리:**
    - 이미지 검색: **`docker search 이미지_이름`**
    - 이미지 빌드: `docker image build -t 이미지명[:태그명] Dockerfile경로`
    - 이미지 다운로드: **`docker pull 이미지_이름:태그`**
    - 이미지 목록 확인: **`docker images`**
    - 이미지 삭제: **`docker rmi 이미지_이름:태그`**
2. **컨테이너 관리:**
    - 컨테이너 실행: **`docker run [옵션] 이미지_이름 [명령] [인수]`**
    - 실행 중인 컨테이너 목록: **`docker ps`**
    - 모든 컨테이너 목록(실행 중 및 정지된 컨테이너): **`docker ps -a`**
    - 컨테이너 시작: **`docker start 컨테이너_ID_또는_이름`**
    - 컨테이너 정지: **`docker stop 컨테이너_ID_또는_이름`**
    - 컨테이너 재시작: **`docker restart 컨테이너_ID_또는_이름`**
    - 컨테이너 삭제: **`docker rm 컨테이너_ID_또는_이름`**
3. **컨테이너 로그 및 정보:**
    - 컨테이너 로그 보기: **`docker logs 컨테이너_ID_또는_이름`**
    - 컨테이너 정보 확인: **`docker inspect 컨테이너_ID_또는_이름`**
4. **컨테이너 쉘 접속:**
    - 컨테이너 쉘에 접속: **`docker exec -it 컨테이너_ID_또는_이름 /bin/bash`**
5. **이미지 및 컨테이너 레지스트리 관리:**
    - 이미지를 Docker Hub에 업로드: **`docker push 이미지_이름:태그`**
    - Docker Hub에 로그인: **`docker login`**
    - Docker Hub에서 로그아웃: **`docker logout`**
6. **도커 네트워크 관리:**
    - 도커 네트워크 목록 확인: **`docker network ls`**
    - 컨테이너에 네트워크 연결: **`docker network connect 네트워크_이름 컨테이너_ID_또는_이름`**
7. **도커 볼륨 관리:**
    - 도커 볼륨 목록 확인: **`docker volume ls`**
    - 컨테이너에 볼륨 연결: **`docker run -v 볼륨_이름:컨테이너_내_경로 이미지_이름`**
8. **기타 유용한 명령어:**
    - 도커 버전 확인: **`docker --version`**
    - 도커 정보 확인: **`docker info`**
    - 도커 도움말 보기: **`docker --help`** 또는 **`docker 명령어 --help`**

# 3. Dockerfile 작성해보기

## 스프링 프로젝트 생성

![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/2ebd7c54-5468-498a-a445-97f44136987e)


## 도커파일 생성
![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/aebc798a-5bfe-4aa0-9275-425bc551f6ec)

![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/5b881779-081e-452b-b95a-f936dd8762ae)


- **FROM** : Docker Base Image (기반이 되는 이미지, <이미지 이름>:<태그> 형식으로 설정,
- **ARG** : 컨테이너 내에서 사용할 수 있는 변수를 지정할 수 있다.
- **COPY** : 위에 선언했던 JAR_FILE 변수를 컨테이너의 app.jar로 복사한다.
- **ENTRYPOINT** : 컨테이너가 시작되었을 때 스크립트 실행

## ibin-docker라는 도커이미지 생성
![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/7b91e987-b50b-46c8-b2f4-d0c54d727962)
![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/b6bae01b-718e-4396-8639-5971a72914f8)



## 컨테이너 실행
![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/03f09ffb-7f42-4e2d-9562-325c362793e1)
![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/42b5f389-ca54-4d8d-9928-b2f80c0ff187)


## 결과
![](https://github.com/GSM-MSG/DevOps-Onboarding/assets/80810278/2771cf8c-1abd-4028-81ab-3a60322fc7fc)
