# 온보딩 자유주제 : CI/CD

## 목차
* CI/CD 구축해야 하는 이유 
* AWS CodePipeline
* GitHub Action CI/CD 명령어
* Jenkins등 여러 자동화 툴
* 이 주제를 선택한 이유

되게 저의 언어로 표현을 많이 할 거고 100% 주관적인 저의 견해이니 많은 피드백 부탁드려요 ٩( ᐛ )و 

CI/CD 개념은 공부하시면서 10번은 넘게 보셨을테니 과감히 생략하겠습니다.

---
## CI/CD 구축해야 하는 이유
예를 들면서 시작하겠습니다.

실행할 때마다 환경변수 100개가 필요한 어플리케이션을 구축했을때 개발자가 하나씩 할당하며 띄울 수 있을까요?

중복, 누락 등 많은 에러가 생길 수 있습니다.

스크립트로 한 번에 적어두고 정리하며 관리하면 너무너무 편하지 않을까요?! (By CI)

테스트코드를 작성해서 어플리케이션 띄우기 전에 시간과 리소스도 절약할 수 있어요 (By CI)

*반복적인 일을 자동화 시켜서 코드변경과 배포단계를 원활하게 진행하는 것이에요*

제 자유주제의 메인 내용입니다. 구축해야하는 이유와 더불어 구축 툴, 구축하는 방법을 아래 기술합니다.

---
## 어떻게 CI/CD 구축할까?

### AWS CodePipeline

AWS 의 완전관리형 지속적 전달 서비스 입니다.

소프트웨어를 릴리스하는 데 필요한 단계를 모델링, 시각화 및 자동화할 수 있게 도와줍니다.

CI/CD 서비스로 빠르고 편리하게 어플리케이션을 빌드, 테스트, 배포 서비스를 자동화합니다

![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6vvsHffqvQpFXxWxBwOZ8DwxyZPZAs2po5Q&usqp=CAU)

이런식으로 아키텍처를 짤 수 있고요 만드는 과정은 그렇게 어렵지 않아서 문서 몇개 참고하며 짤 수 있어요

`Code Commit` 
* AWS 클라우드 기반 Git 리파지토리
* 완전 관리형 소스 제어 서비스 : 프로비저닝, H/W구성 및 관리, S/W관리 불필요
* KMS로 자동 암호화 | IAM과 통합된 권한 관리
* Git 기반 리파지토리 -> CodeCommit 마이그레이션 가능
* 저장소 크기 및 파일 형식 제한 없음

`Code Build`
* 완전 관리형 CI(Continuous Integration) 서비스: 소스코드 컴파일, 단위테스트, 빌드 파일 생성
* 빌드서버의 프로비저닝 및 운영/관리 불필요
*  사전 패키지된 빌드 환경(빌드 프로젝트)을 제공
    * Maven, Gradle 등
* 비용은 빌드 시간만큼만 지불

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F2nt0e%2Fbtruk5lUxKI%2F32x7TxhFKxigOVjBD66qDK%2Fimg.png)

### 동작방식 입니다.
*Source Control*
- GitHub, CodeCommit, S3 등에서 소스 불러오기
Build Project
- 소스코드위치, 빌드환경, 빌드명령, 빌드 결과 저장위치 등 빌드 실행 방식 정의
Build Environment
- Build Project 기반으로 빌드 환경 생성 및 buildspec 실행
S3 버킷
- 빌드 결과 S3 업로드
Notification
- SNS로 알림 전송, 빌드과정 Log CodeBuild/CloudWatch Logs 에 전송
Destroy Build Environment 
- Build Environment 삭제 및 Clean Up

`Code Deploy`
* AWS EC2, ECS, Lambda 및 온프레미스 서버에도 배포 가능
* S3, CodeCommit, CodePipeline, Git, ELB, Auto-Scaling 등과 통합
*  CD 도구

### 배포방식

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQbW2P%2FbtrunNL6P4L%2Fkvsb0Qpe6HeOkKz2LtzEM0%2Fimg.jpg)
**In-Place 방식**
* 새로운 인스턴스 생성이 불필요해서 배포가 간단하고 빠른
* 현재 실행 중인 인스턴스 대상으로 배포 수행
* 롤백 시 이전 버전으로 배포 다시 진행해야 함으로 롤백 시간이 오래 걸림

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FDqhxU%2Fbtrul4gfn5C%2FZfoeCKpH1pe7MN0qqzk1U1%2Fimg.jpg)
**Blue-Green 방식**
* 배포 과정에서 요청량을 처리하는 인스턴스 개수가 줄지 않음
* 로드밸런서의 설정(등록/해제) 변경으로 롤백이 빠름
* 배포 과정에서 인스턴스의 수를 2배로 늘려야 함으로 배포준비 시간이 오래 걸림

CI/CD를 한 번이라도 구축해보셨으면 전체적인 플로우는 대충 아실텐데 툴을 무엇을 쓰냐의 차이라서 뭐로 시작하든 상관은 없다고 생각합니다.

웬만하면 무료인 게 좋겠죠! 아래 무료로 CI/CD를 학습할 수 있는 GitHub Action도 준비해봤습니다!!

AWS CODEPIPELINE https://happy-jjang-a.tistory.com/96

---
## GitHub Action 
![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FXVHRQ%2Fbtq5t1899Cg%2FKmSsIX2YCZY6x1KKTtEiIk%2Fimg.png)
> Github 저장소를 기반으로 Workflow를 자동화 할 수 있는 도구. Github가 제공하는 완전관리형 CI/CD 툴이다.

* YAML로 작성
* 개발자는 Workflow를 작성하여 다양한 이벤트를 기반으로 실행시킬 수 있다.
* 원하는 OS 지정할수 있음. 한 번에 여러 OS에서 테스트 가능

### 작성법

최상단에 .github/workflows 디렉터리를 만들고 그 내부에 이름.yml 파일을 만들면 workflow 파일 생성 완료가 된다.

1) `name:` 최상단에 워크플로우의 이름을 정의해준다.

```
on: 
	push:
		branches:
			- master
```
2) workflow를 실행시킬 Event정의

```
jobs: 
	workflow-test-job: 
		runs-on: ubuntu-latest
```
3) Event에 부합했을때 실행 시킨 job정의

```
jobs: 
	workflow-test-job: 
		runs-on: ubuntu-latest
```
4) Step 정의
* 각 스텝마다 name정의 및 uses(마켓에 있는 action 가져오기)
* run은 직접 명령어 실행
```
jobs:
	workflow-test-job:
		runs-on: ubuntu-latest
		steps:
			- name: Checkout repo
				uses: action/checkout@v3

			- name: Use Node.js
				uses: actions/setup-node@v3
        with:
          node-version: '14'

			- name: Install npm
				run: npm install
```

저는 AWS CodeSeries 대신에 이걸로 시작했는데 무료라는 점이 가장 끌렸어요!
자료도 꽤 많고 변경된 사항이 깃허브나 구글링하면 바로바로 나와서 꽤나 빨랐습니다.

*제가 느끼기에 단점은..*

워크플로우가 정상적으로 돌아갔는데!! 어플리케이션 내부 문제가 있었지만 성공이 뜬다는 점이에요. 

워크플로우가 길어질수록 빌드시간이 길어진다

캐시가 자동으로 안 돼서 직접 기입해줘야한다 <- 이거 좀 귀찮

CD가 단일적으로 안 된다!!!!! 이거 워크플로우를 나누면 되지 않냐?? 생각할 수 있는데 나눔에 둘째치고 은근 불편합니다...

사용하면서 이렇게 느꼈네용

---
## Jenkins
![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbEciCe%2Fbtq5uTQkuSK%2F3GOmVGSHa4JIrxaMMhjXu1%2Fimg.png)
소개하기 전에!

젠킨스와 같은 CI툴이 등장하기 전에는 일정시간마다 빌드를 실행하는 방법이 일반적이었는데, 젠킨스는 소스의 커밋을 감지하면 자동적으로 자동화 테스트가 포함된 빌드가 작동하도록 도와주게 되어 편의성이 증가되었어요

![](https://spacelift.io/_next/image?url=https%3A%2F%2Fspaceliftio.wpcomstaging.com%2Fwp-content%2Fuploads%2F2023%2F03%2FTFJenkinsDemo.png&w=3840&q=75)
스크립트는 툴들끼리 다 비슷한 것 같아요.

### 작성법
```
stages
   ㄴ stage
        ㄴ steps
             ㄴ script
```
이런 구조입니다.
```
pipeline {
    agent none
    stages
    {
        stage(‘send cash’)
        {
            steps
            {
                echo(‘Not implemented’)
            }
        }
        stage(‘Legacy’)
        {
            steps
            {
                script
                {
                    try
                    {
                        build job: ‘LEGACY_BACK_END_TEST_AUTOMATION’, parameters: [ string(name: ‘SelectServer’, value: “${SelectServer}“)]
                    } catch (e)
                    {
                        echo ‘LEGACY TEST Fail!! But Im Running!’
                    }
                }

            }
        }
        stage(‘V1’)
        {
            steps
            {
                 script
                {
                    try
                    {
                        build job: ‘V1_BACK_END_TEST_AUTOMATION’ , parameters: [ string(name: ‘SelectServer’, value: “${SelectServer}“)]
                    } catch (e)
                    {
                        echo ‘V1 TEST Fail!! But Im Running!’
                    }
                }

            }
        }
        stage(‘V2’)
        {
            steps
            {
                 script
                {
                    try
                    {
                        build job: ‘V2_BACK_END_TEST_AUTOMATION’ , parameters: [ string(name: ‘SelectServer’, value: “${SelectServer}“)]
                    } catch (e)
                    {
                        echo ‘V2 TEST Fail!! But Im Running!’
                    }
                }
            }
        }
    }
}
 
```

이런식으로 깃허브액션과 비슷하게 적어주시면 되고 `echo` 명령어 등 비슷한 게 참 많아요!!

코드블럭으로 감싼 것보다 이게 더 좋아보이네용
![](https://cdn.discordapp.com/attachments/954177766604030013/1154672022169866280/2023-09-22_15.54.15.png)


![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fr14gs%2FbtrlUOqEsew%2F1gMVkTeODVTtm8kYqyV0gk%2Fimg.png)

`agent`
Jenkins Master Node가 작업을 시켰을 때 일을 하는 Node
* 젠킨스를 소개하는 페이지는 아니니 무겁게 다루지는 않고 대충 이런거구나 알고 넘어가셨음 해요

`stage`
- pipeline 블록 안에서 한번만 실행 될 수 있습니다.

- stages 내부에서는 여러 stage를 포함할 수 있습니다.

`try - catch`
* 개발하시면서 봤었을거예요 여기서는 실패한 job 무시할 수 있는 명령어!

` build job: ` 여기에 실제 만들어지는 job의 이름을 적으면 됩니다.

문법 : https://waspro.tistory.com/554

---
## 주제 선정 이유
Devops의 역할 중에 하나라고 생각했어요.

기본이라고 생각하기도 하고, 개발자가 수동적으로 처리하는 일을 자동화 해주기만해도 1인분은 하지 않을까 싶어서 이건 알려야겠다!! 이런저런 방법들이 있다 소개하고 싶어지더라고요.

어떤식으로 적어야할지 잘은 모르겠어서 조금 장황하게 적었고 두서없을수도 있는데!! 답변 달아주시면 대댓글 성실히 달겠습니다.
