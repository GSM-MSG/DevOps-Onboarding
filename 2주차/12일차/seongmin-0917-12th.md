# Docker compose

---

단일 서버에서 여러개의 컨테이너를 하나의 서비스로 정의해 컨테이너 묶음으로

관리할 수 있게 작업 환경을 제공하는 관리 도구이다.

- **왜 사용할까?**
    
    사실 우리가 하나의 어플리케이션을 배포하기 위해 한 가지의 컨테이너(서비스)를
    
    사용하는건 아닙니다. 대충 시뮬레이션을 돌려보자면 mysql 서버와 워드프레스를 이용하여
    
    도커 컨테이너로 웹 페이지를 배포한다고 칩시다. 그러면 어떻게 해야할까요?
    
    하나하나 컨테이너를 만들어서 배포해야할까요? 그러면 상당히 비효율적이고 관리측면에서도
    
    별로입니다. 그래서 이때 여러 컨테이너를 묶어서 하나의 서비스로 만들어주기 위해 사용하는것입니다.
    
- **docker-compose.yml**
    
    검색하면 다 yaml 파일이라고 나오는데 왜 확장자 명은 yml일까?
    
    이유는 예전 확장자 명의 길이 제한이 3글자였기 때문에 yml로 뜨는것이다
    

# Compose 실습

---

~~유튜브 실습 파일이라 분석만 하지 직접 짜긴 아직 어려운것같습니다 ㅠ~~

```markdown
version: "3.7"

services:
  db:
    image: mysql:5.7
    volumes:
      - ./db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress_user
      MYSQL_PASSWORD: 123456
  
  app:
    depends_on: 
      - db
    image: wordpress:latest
    volumes:
      - ./app_data:/var/www/html
    ports:
      - "8080:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_DB_USER: wordpress_user
      WORDPRESS_DB_PASSWORD: 123456
```

1. **version: “3.7”**
    
    작성하는 컴포즈 파일의 버전
    
2. **services:** 
    
    만들고자 하는 컨테이너의 설정
    
3. **image: mysql:5.7**
    
    사용할 이미지 지정 명령어(여기선 mysql을 지정)
    
4. **db:**
    
    컨테이너 이름
    
5. **volumes:**
      - ./db_data:/var/lib/mysql
    
    볼륨 지정
    
6. **restart: always**
    
    컨테이너가 종료될때 자동 실행(옵션으로 항상 다시 시작 지정)
    
7. **environment:**
    
    환경 변수 설정(도커 데몬에선 -e)
    
    MYSQL_ROOT_PASSWORD: 123456
    
    - mysql 루트 비밀번호를 설정
    
    MYSQL_DATABASE: wordpress
    
    - 사용할 데이터 베이스의 이름을 설정(wordpress)
    
    MYSQL_USER: wordpress_user
    
    - mysql 사용자 이름 지정(wordpress_user)
    
    MYSQL_PASSWORD: 123456
    
    - mysql 데이터 베이스 사용자 비밀번호 설정
8. **app:**
    
    마찬가지로 컨테이너 이름 설정
    
9. **depends_on:**
    
    앞에 있는 컨테이너가 실행중인지 확인 후 실행 중이라면 실행
    
10. **image: wordpress:latest**
    
    이미지 설정
    
11. **volumes:**
      - ./app_data:/var/www/html
    
    마찬가지로 볼륨 설정
    
12. **ports:
      - "8080:80"**
    
    그냥 포트 포워딩 설정이라고 보면 된다.(단 컨테이너 포트가 60이하라면 오류가 발생한다)
    
13. **environment:**
    
    WORDPRESS_DB_HOST: db:3306
    
    - WORDPRESS의 데이터 베이스 호스트를 mysql 서버의 db 포트인 3306번으로 지정
    
    WORDPRESS_DB_NAME: wordpress
    
    - 워드 프레스 db의 이름을 wordpress로 지정
    
    WORDPRESS_DB_USER: wordpress_user
    
    - db 사용자의 이름을 wordpress_user로 지정
    
    WORDPRESS_DB_PASSWORD: 123456
    
    - 사용자 db 패스워드를 지정

이런식으로 작성한 docker-compose.yml 파일을 실행하면
docker-compose up 로 실행 (이때 -f 옵션으로 compose파일 경로 지정 해주자!)
![56](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/6695e212-7ebb-4c74-af66-75a05c936d2a)

docker-compose down 으로 종료 (얘도!)
![57](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/cfff4215-7448-4aac-865b-13701eb726b9)

그럼 아까 지정한 로컬 호스트 8080포트로 접속해보자!
![58](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/381f7925-2f9a-40cb-a0d4-174e857460da)
