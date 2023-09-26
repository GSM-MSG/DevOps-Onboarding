## 데브옵스 온보딩 15일차


1. Iac란?
    iac는 프로그래밍형 인프라라고도 하는데, 인프라 구성을 수동 프로세스가 아닌 소프트웨어 프로그래밍 하는것처럼 코드를 통해 관리하는 방식입니다. 대표적인 툴로는 Terraform, aws cloudformation이 있습니다.

2. Iac가 필요한 이유
    Iac는 Iac를 사용하면 인프라 정보를 담은 구성 파일이 생성되어 매번 동일한 환경을 유지시켜 인프라의 일관성과 배포속도를 높이고, 비용 및 오류를 감소시킬수 있습니다. 

3. Terraform 이란?
    Iac 도구중 하나로, 코드를 통해 인프라 서버를 운영할수 있게 해주는 오픈소스 소프트웨어입니다. terraform은 코드로 실행 되기 때문에 사람이 수동으로 작업하는 것 보다 훨씬 빠르며 실수들을 방지할 수 있다는 장점이 있습니다. 또한 한번 구축해놓으면 재사용할수 있습니다. 하지만 배우는데 시간이 많이 걸리고 기존 인프라를 코드로 바꾸는데에 시간이 많이 걸린다는 단점이 있습니ㅏㄷ.

    Terraform 개념 

    - 프로비저닝
    어떤 프로세스나 서비스를 실행하기 위한 준비 단계
    - Resource
    리소스란 특정 프로바이더가 제공해주는 조작 가능한 대상의 최소 단위
    - Plan
    테라폼 프로젝트 디렉터리 아래의 모든 .tf 파일의 내용을 실제로 적용 가능한지 확인 하는 작업
    - Apply
    테라폼 프로젝트 디렉터리 아래의 모든 .tf 파일의 내용대로 리소스를 생성, 수정, 삭제하는 일을 적용 


4. Terraform 실습해보기
  - Terraform 을 통해 vpc, nat, igw, ec2 등을 만들고 캡처본을 찍어주세요!
  - 작성하신 Terraform 파일도 같이 commit 해주세요.

    terraform 설치후 환경변수 설정해줍니다.

    그 후 provider.tf 파일을 생성해주고 공급자와 리전을 작성해줍니다.

    ec2 서버를 생성하기 위하여 ec2.tf 파일을 만들어주고, 생성할 리소스 타입과 이름을 적고 AMI와 인스턴스 타입을 설정해줍니다.

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/9f6d22bb-fea2-4e03-9129-dbb0bb2915af)

    vpc.tf를 만들어 vpc와 subnet의 cidr 블록을 설정해줍니다.

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/4799e31c-56c1-4ef2-b5bb-d27f9213ffd3)

    igw, eip, nat 코드를 작성해줍니다.

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/5f259034-6572-401f-bbf8-732d22416f5a)]

    라우트 테이블 코드를 작성해 주고,

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/4ff8f073-4560-4b9d-b56e-26c7d5640844)

    다른 리소스들과 라우팅을 해줍니다.

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/a307c8b1-d70e-454c-ab5f-4d99be98f981)

    이렇게 terraform 파일 작성을 마치고, terraform init을 해줍니다.

    init : 테라폼을 수행하기 위한 공급자의 최신 플러그인들을 자동 설정 - provider 구문이 설정된 후에 실행할 수 있습니다

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/aeaf7959-cc40-451a-b122-89557803e2fa)

    그 후 terraform plan명령어를 사용해줍니다.

    plan : 테라폼이 실행했을 시, 실제로 생성되거나 변경되는 내역을 보여줍니다.

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/f89843db-f18f-4f9f-b2fc-8410598c141a)

    마지막으로 apply 명령으로 테라폼을 실제로 실행시키게 되는데, yes로 변경 내역을 한번 확인하고 진행해주면 됩니다.

    ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/c2867a2f-5b68-40ce-99e0-32339620ba58)

    이후 확인해보면 잘 실행되어있습니다.
