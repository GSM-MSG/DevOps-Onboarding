# Iac란?

---

- **IaC(Infrastructure as Code)**
    
    코드로 인프라를 구축하는 것 이라고 생각하면 될 것 같다.
    
    예를 들어보자면 EC2 인스턴스의 크기를 xlarge에서 micro로 바꿔야 한다고 할 때
    
    우린 콘솔 웹에서 수동으로 설정을 해줘야 합니다. 이런 식으로 간단하게 변경하는 사항에 경우엔 큰 상관이 없을 수 있지만 복잡한 인프라 구성으로 넘어가게 된다면 중간중간 인적 실수가 발생할 수 있게 된다. 하지만 이 모든 걸 코드로 구성할 수 있게 된다면 코드만 정확하면 되기 때문에 빠르고 정확하게 구성할 수 있습니다.
    
    즉, 코드를 사용하여 인프라를 빠르고 정확하게 인프라를 구축하는 것이라고 할 수 있다.
    
- **IaC의 장점**
    - 애플리케이션 개발과 동시에 인프라 구축이 가능하며 원하는때에 효율적으로 인프라를 변경
    - CI/CD 플랫폼과 직접 통합 가능
    - 인프라의 효과적 관리 및 원하는 상태로의 인프라 구성이 가능
    - IaC를 사용한 자동화를 통해 불필요한 수동 작업을 최소화할 수 있습니다.
    - 관리 비용을 크게 늘리지 않고도 인프라 관리를 쉽게 확장할 수 있습니다.
    - 인프라 사용자에게 필요한 리소스 제공으로 인한 섀도우 IT 감소
- **IaC의 단점**
    - 문서와 자료가 부족하다

# Terraform

---

- **테라폼이란?**
    
    HashiCorp사가 개발한 오픈 소스 IaC 툴이다.
    
    개발자가 HCL(HashiCorp Configuration Language)이라고 불리는 상위 레벨 구성 언어를 사용하여 인프라 서버를 운영 및 구축 할 수 있게 해주는 도구입니다.
    
- **기본 개념**
    - 프로비저닝(Provisioning)
        
        프로세스나 서비스를 실행시키기 위해 준비하는 작업
        
        네트워크나 컴퓨터 자원을 준비하는 것이라고 할 수 있다.
        
    - 프로바이더(Provider)
        
        테라폼으로 생성할 인프라의 종류
        
        AWS, GCP, Azure, Github 같은 외부 서비스와 연결할 수 있다.
        
    - 리소스
        
        프로바이더가 제공하고 조작할 수 있는 최소 단위
        
        테라폼으로 생성할 자원
        
    - Plan
        
        테라폼의 프로젝트 디렉토리 아래의 모든.tf 파일의 내용을 실제로 적용 가능한지 확인하는 작업이다.
        
        teerraform plan
        
    - Apply
        
        테라폼 프로젝트 디렉토리 아래의 모든 .tf 파일의 내용대로 리소스를 생성, 수정, 삭제하는일
        
        terraform apply
        
- **사용 툴**
    - **CDKFT**
        
        프로그래밍 언어를 사용하여 클라우드 애플리케이션 리소스 모델링 및 프로비저닝 할 수 있는 오픈 소스 개발 프레임 워크
        
    - **VsCode**
        
        Terraform 언어 서버를 통해 작성 및 편집
        
    - **Language Server**
    - **ConSole**
    - **Module**
- **장점**
    - **자동화**
        
        수동으로 생성하는게 아닌 코드로 생성하므로 서버 운영 및 관리가 모두 자동화가 될 수 있다.
        
    - **속도**
        
        하나하나 딸깍딸깍 눌러가며 서버를 구축하는게 아닌 코드로 구축하다 보니 훨씬 빠르다
        
    - **안정성**
        
        딸깍이 기능을 하다보면 실수를 하기 마련인데 코드로 작성하다 보니 실수들을 방지할 수 있다.
        
    - **기록 및 관리**
        
        코드 형식이다 보니 git을 사용하여 관리할 수 있으며 이로 인해 변경 기록을 쉽게 볼 수 있다.
        
    - **테스트**
        
        수동 서버 작업의 경우 테스트할 때 리뷰하기가 굉장히 힘들었고 그렇다보니 문제를 발견했을 때 이미 다른 곳에 영향을 준 후여서 힘들다면 사전에 미리미리 리뷰 및 테스트를 할 수 있다보니 쉽다.
        
- **테라폼의 진행 순서**
    - **Write**
        
        코드 작성
        
    - **Plan**
        
        코드가 실행 가능한지 확인
        
    - **Apply**
        
        타 서비스와 연결하여 리소스를 생성
        

# 실습

---

- **테라폼을 설치 해보자**
    
    먼저 테라폼 홈페이지에 가서 윈도우 terraform 파일을 받자
    
    그 다음 압축을 풀고 시스템의 환경 변수 설정을 해주어야한다!
    
    ~~처음에 사실 실행프로그램? 인줄알고 계속 켜봤는데 안되길래 당황했었다.~~
    
    그리고 vscode에
    
    ```markdown
    terraform
    ```
    
    명령어를 입력해서 아래와 같이 뜨면 성공한 것                                                                                                                                                                          이다.
    
- **간단 실습 - 테라폼 어떻게 작성하고 어떻게 연결할까?**
    
    일단 사실 나같은 초보자들에게 .tf 파일을 막 만들고 AWS에 연결하여 작성한다? 절대 쉽지않은 일이다. ~~실제로 작성법은 금방 찾았지만 연결법을 제대로 몰라서 고생 꽤나 했다.~~ 그래서 간단하게 ec2 인스턴스를 제작해보는 과정을 가져보겠다
    
    - **AWS와 terraform 연결!**
        
        진짜 좀 어려웠다 자료들이 대부분 어느정도의 지식과 연결 정돈 하겠지란 마인드로 작성돼있다 보니 저 같은 초보자에겐 너무 어려어려웠다.
      
        ![80](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/af0558b8-c3df-4fb8-9af1-89dac93543cb)

        ![76](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/045d9046-3d91-42a0-a39f-d6310437d71e)

        1. 먼저 .tf 파일을 작성해보자!
            
            우선 간단하게 provider로 연결할 aws 계정의 엑세스 키와 시크릿 키를 작성하자
            
            그 다음 밑에 resource의 유형으로 aws_instance를 지정하고 sample-instance로 식별자 명을 정해주자!
            
        2. 그 다음에 ec2의 이미지중에 무료로 사용할 수 있는 이미지를 골라 ami를 넣어주자
        3. 만들 인스턴스의 용량을 t2.micro 용량으로 지정해주자
        4. tags의 Name 태그로 인스턴스의 이름을 지정해주자!
     
  
    - **vpc, igw, nat을 만들어보자!**
        
        
        - **VPC**
     
          ![75](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/e389e542-1e90-478c-b94f-0eb91268d545)

            1. 리소스에서 aws_vpc로 생성
            2. cidr 블록 설정
            3. Name으로 vpc 이름 설정
            4. 끝
         
      
        - **subnet**
     
            ![77](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/807e7771-478f-415d-9007-8ec75e774bed)

            실습 때 nat을 사용하기 때문에 private까지 만들어 줍시다
            
            1. aws_subnet으로 생성
            2. vpc와 연결시키기 위해 vpc_id로 아까 만든 vpc 넣어주기
            단, 이때 뒤에 .id를 넣지 않으면 계속해서 오류가 뜬다
            3. availablility_zone으로 가용 영역 서울로 설정
            4. tags의 Name으로 이름 설정
         
          
   

        - **igw**
             ![73](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/14c33a40-fe09-4562-bc9e-e5017eecd73b)

            1. 위와 마찬가지로 vpc_id로 vpc 연결
            2. tags의 Name으로 이름 설정
      
        - **nat, eip**
            
            eip = 탄력적 ip이다.
          
            ![74](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/9699eed1-dc97-4e5c-b869-755106a61a51)
            ![71](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/dc143145-34c0-4411-8fb2-17a010a2fa1e)

            1. domain = “vpc”로 어디서 생성할건지 정한다
            ~~처음엔 vpc = true로 쓰다가 도메인 경고가 떠서 바꾸었다~~
            2. lifecycle을 파괴하고 생성으로 지정한다
            3. aws_nat_gateway로 생성
            4. eip 추가를 위해 allocation_id를 사용해 탄력적 ip 지정
            이때도 마찬가지로 .id는 필수다
            5. 연결할 subnet_id를 아까 생성한 프라이빗 id로 교체
            6. tags의 Name으로 이름 지정
         
      
        - **생성하기**
     
          ![72](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/b34966fe-02c3-4850-aaf1-66904270504f)
          ![79](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/0a6a3872-a3bd-4869-b743-25d3eac4df1b)

          ![66](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/d96c9d18-2a55-4ea4-a1da-6e798d1e3185)
          ![67](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/47cfb735-7cb8-4599-a81f-e3e3b498996f)
          ![68](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/e5830bc4-e90b-41ea-9491-7eefa679ee2d)
          ![69](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/2e015c9d-d3ec-4cd7-a851-b3b2f55e8c8e)
          ![70](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/d5b05fa7-8723-40cf-8d2d-0d2395516581)
          ![78](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/2a1e2cfe-7a6e-41a1-9af3-830fcbd5f877)


# 참고한 자료들

---

https://www.redhat.com/ko/topics/automation/what-is-infrastructure-as-code-iac

https://www.hpe.com/kr/ko/what-is/infrastructure-as-code.html

https://learn.microsoft.com/ko-kr/devops/deliver/what-is-infrastructure-as-code

https://www.ibm.com/kr-ko/topics/shadow-it

https://pang-it.tistory.com/30

https://www.servicenow.com/kr/products/devops/what-is-infrastructure-as-code.html

https://m.blog.naver.com/ssdyka/221355367790

[https://www.opsnow.com/코드-기반-인프라iac/](https://www.opsnow.com/%EC%BD%94%EB%93%9C-%EA%B8%B0%EB%B0%98-%EC%9D%B8%ED%94%84%EB%9D%BCiac/)

https://luv-n-interest.tistory.com/1429

https://aws.amazon.com/ko/what-is/iac/

https://bosungtea9416.tistory.com/entry/AWS-Terraform%EC%9C%BC%EB%A1%9C-%EA%B0%84%EB%8B%A8%ED%95%9C-VPC-%EA%B5%AC%EC%84%B1%ED%95%98%EA%B8%B0

https://teichae.tistory.com/entry/Terraform%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-VPC-%EB%B0%8F-Subnet-Routing-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0

 동현 선배의 과제

 https://kimjingo.tistory.com/175

 chatgpt
