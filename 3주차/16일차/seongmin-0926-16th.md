위 과제는 총 3번을 갈아 엎어서 특히 늦어진것같습니다.

# Architecture

---

- **주제 선정의 이유**
1. 데브옵스 엔지니어가 거의 항상 짜는 것이 아키텍쳐이므로 이번에 공부해보자
2. 다음 과제 역시 아키텍쳐를 짜는 것이므로 어떤걸 유의하며 짜야하는지 알아보자
- **아키텍처란?**
    
    시스텀의 동작 원리와 구성을 나타내는 것과 
    
    구성 요소 간의 관계 및 시스템 외부 환경과의 관계를 묘사하는 것이라 할 수 있습니다.
    
    데브옵스 엔지니어가 짜야하는 것은 각종 기술 구성 요소를 결합하여 최종적으로 클라우드 서비스를 통해 서비스를 배포하는 것이므로 클라우드 아키텍처라고 할 수 있겠습니다.
    
    - **클라우드 아키텍처란?**
        
        서비스 기술 구성 요소를 결합하여 클라우드 환경에 구축하는 것이라고 정의할 수 있겠습니다.
        
    - **클라우드 아키텍처 구성 요소**
        - 프론트 엔드
        - 백엔드
        - 네트워크
    - **클라우드 아키텍처의 종류**
        - **퍼블릭 클라우드 아키텍처**
            
            클라우드 서비스 제공 업체에게 컴퓨팅 리소스를 제공 받고 인터넷을 통해
            
            배포하는 것을 의미합니다. 이로 인해 운영 비용 감소, 손쉬운 확장, 유지 보수 감소등이 있습니다
            
        - **프라이빗 클라우드 아키텍처**
            
            자회사의 온프레미스 데이터 센터를 통해 서비스를 배포하는 클라우드 아키텍처 입니다.
            
            이로 인해 퍼블릭에 비해 비용이 많이 들지만 강력한 보안성과 자유로운 수정이 가능합니다.
            
        - **하이브리드 클라우드 아키텍처**
            
            퍼블릭의 효율성과 프라이빗이 보안성을 결합하는 것입니다.
            
            퍼블릭 아키텍처와 프라이빗 아키텍처를 둘 다 사용하는 것이 특징입니다.
            
        - **멀티 클라우드 아키텍처**
            
            여러 개의 클라우드 서비스를 사용하는 것을 의미하며 이로 인하여 유연하게 서비스를 배포할 수 있게 됩니다.
            
            일반적으로 2개 이상의 퍼블릭, 2개 이상의 프라이빗 혹은 퍼블릭과 프라이빗을 조합하여 사용합니다.
            
    - **아키텍처 설계 원칙**
        - 운영 우수성
            - Perform operations as code
                
                코드를 통해 쉬운 서비스 테스트 및 빠른 배포 환경 구축 그리고 빠른 수정
                
            - Make frequent, small, reversible change
                
                이게 좀 애매한게 aws-wellArchitectured 문서에서 나온 내용인데 개인적으로 이해하기론 버전 배포형식의 릴리즈 같은게 아닐까 싶다 그리고 업데이트 오류? 및 실패시 다시 롤백 할 수 있게 설계하는 듯 하다.
                
            - Anticipate failure
                
                서비스 실패를 미리 테스트를 통해 예측하는 것 그리고 그 실패를 정리하고 학습하기까지 해야한다
                
        - 보안성
            - Implement a strong identity foundation
                
                최소 권한의 원칙으로 가성 선배님이 하듯이 할 수 있는 가장 최소한의 권한을 IAM으로 부여하는 것
                
            - Enable traceability
                
                서비스의 모든 동작이 모니터링 될 수 있겠끔 하는것이다. 로그 시스템을 설정해 두는 것이라고도 생각할 수 있을 것 같다.
                
                AWS CloudWatch 서비스라고 생각하면 더 편할듯?
                
            - Apply security at all layers
                
                모든 계층에 보안 요소를 포함 시키는 것을 의미한다.
                
                edge network, VPC, subnet, loadbalancer 등 여러가지가 있다.
                
        - 신뢰성
            - 자동 확장
                
                서비스의 부하에 따라 자동으로 서버를 확장 및 축소하는 것이다
                
                Auto scaling을 통해 서버리스 클라우드 환경을 구축하는 것이지 않을까 싶다.
                
            - 장애 감지 및 자동 회복
                
                장애를 자동으로 검사하고 회복하는 아키텍처를 짜는 것이다
                
                도커의 스웜과 AWS의 ELB로 구축하면 될듯하다.
                
            - 데이터 백업 및 복원
                
                말 그대로 데이터를 백업하고 오류가 생겼을 때 복구하는 형식이다
                
            - 장애 시나리오 테스트
                
                장애가 생겼을 때를 가정하여 테스트를 실행하고 그에 대한 해결책을 마련한다
                
            - 요청 분산
                
                ELB의 역할이라고 생각하면 될 것같다. 트래픽이 들어오면 자동으로 서버에 분배해주는 방식으로 보면 될듯 하다.
                
        - 성능 효율성
            
            IT 및 컴퓨팅 리소스를 효율적으로 사용하는데 중점을 둔다.
            
            요구사항에 적합한 리소스 유형 및 크기, 성능 모니터링 정보를 바탕으로 한 효율성 유지와 같은 항목들이 고려되어야 한다.
            
            솔직히 방식 자체는 전체적으로 비슷한데 이런 부분까지 더 신경써야한다 정도인것같다.
            
            - 빠르게 전 세계에 배포
            - 서버리스 아키텍처 설계
            - 빠른 테스트
            - 신기술 빠른 적용
        - 비용 최적화
            
            불필요한 비용의 발생을 방지하고 지출 내용을 파악하여 가장 적합한 수의 적절한 리소스 사용에 초점을 둔다.
            
            AWS Cost Explorer나 AWS Budget을 사용하여 비용 사용량 측정 및 예측을 하여 비용을 효율적으로 사용해보는 것인듯 하다
            
            Lambda의 콜드 스타트가 약간 이런 방식이 아닐까 싶다.
            

# 참고한 자료들

---

https://www.osckorea.com/post/bigaebaljado-swibge-ihaehaneun-akitegceoyi-gaenyeom

https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=skytk123&logNo=120156946307

[https://www.google.com/search?q=클라우드+아키텍쳐&sca_esv=568129103&sxsrf=AM9HkKmefc2Cpx-d-pZbIclFxDwQxjFA1w%3A1695628828762&ei=HD4RZeaULo7_wAOou7XACQ&ved=0ahUKEwjmkonQpcWBAxWOP3AKHahdDZgQ4dUDCBA&uact=5&oq=클라우드+아키텍쳐&gs_lp=Egxnd3Mtd2l6LXNlcnAiGe2BtOudvOyasOuTnCDslYTtgqTthY3ss5AyBxAAGIAEGAoyBxAAGIAEGAoyBxAAGIAEGAoyBxAAGIAEGAoyBxAAGIAEGAoyCBAAGAcYHhgKMggQABgHGB4YCjIHEAAYgAQYCjIHEAAYgAQYCjIHEAAYgAQYCkisLFC_HFiyKnABeAKQAQKYAaoBoAH8DqoBBDEuMTO4AQPIAQD4AQHCAgQQABhHwgIEECMYJ8ICChAAGIAEGLEDGArCAgcQLhiABBgKwgIJEAAYigUYChhDwgIGEAAYBxgewgIIEAAYCBgHGB7CAgoQABgIGAcYHhgPwgIHEC4YDRiABMICBxAAGA0YgATCAgsQABgHGB4Y8QQYCsICFhAuGA0YgAQYlwUY3AQY3gQY4ATYAQHiAwQYACBBiAYBkAYKugYGCAEQARgU&sclient=gws-wiz-serp](https://www.google.com/search?q=%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C+%EC%95%84%ED%82%A4%ED%85%8D%EC%B3%90&sca_esv=568129103&sxsrf=AM9HkKmefc2Cpx-d-pZbIclFxDwQxjFA1w%3A1695628828762&ei=HD4RZeaULo7_wAOou7XACQ&ved=0ahUKEwjmkonQpcWBAxWOP3AKHahdDZgQ4dUDCBA&uact=5&oq=%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C+%EC%95%84%ED%82%A4%ED%85%8D%EC%B3%90&gs_lp=Egxnd3Mtd2l6LXNlcnAiGe2BtOudvOyasOuTnCDslYTtgqTthY3ss5AyBxAAGIAEGAoyBxAAGIAEGAoyBxAAGIAEGAoyBxAAGIAEGAoyBxAAGIAEGAoyCBAAGAcYHhgKMggQABgHGB4YCjIHEAAYgAQYCjIHEAAYgAQYCjIHEAAYgAQYCkisLFC_HFiyKnABeAKQAQKYAaoBoAH8DqoBBDEuMTO4AQPIAQD4AQHCAgQQABhHwgIEECMYJ8ICChAAGIAEGLEDGArCAgcQLhiABBgKwgIJEAAYigUYChhDwgIGEAAYBxgewgIIEAAYCBgHGB7CAgoQABgIGAcYHhgPwgIHEC4YDRiABMICBxAAGA0YgATCAgsQABgHGB4Y8QQYCsICFhAuGA0YgAQYlwUY3AQY3gQY4ATYAQHiAwQYACBBiAYBkAYKugYGCAEQARgU&sclient=gws-wiz-serp)

https://www.redhat.com/ko/topics/cloud-computing/what-is-cloud-architecture

[https://velog.io/@ryucherry/Cloud-클라우드-아키텍처-Cloud-Architecture-란](https://velog.io/@ryucherry/Cloud-%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98-Cloud-Architecture-%EB%9E%80)

https://www.akamai.com/ko/blog/cloud/what-is-cloud-architecture

https://cloud.google.com/learn/what-is-cloud-architecture?hl=ko

[https://blog.bespinglobal.com/post/클라우드-아키텍처-설계-원칙-및-설계-기준/](https://blog.bespinglobal.com/post/%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98-%EC%84%A4%EA%B3%84-%EC%9B%90%EC%B9%99-%EB%B0%8F-%EC%84%A4%EA%B3%84-%EA%B8%B0%EC%A4%80/)

https://cloud.google.com/learn/what-is-multicloud?hl=ko

https://docs.aws.amazon.com/ko_kr/wellarchitected/latest/framework/sus-design-principles.html

https://docs.aws.amazon.com/ko_kr/wellarchitected/latest/framework/general-design-principles.html

[https://jins-dev.tistory.com/entry/클라우드-아키텍처Cloud-Architecture-를-설계할-때-고려할-5가지-5-Pillars](https://jins-dev.tistory.com/entry/%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98Cloud-Architecture-%EB%A5%BC-%EC%84%A4%EA%B3%84%ED%95%A0-%EB%95%8C-%EA%B3%A0%EB%A0%A4%ED%95%A0-5%EA%B0%80%EC%A7%80-5-Pillars)

[https://velog.io/@kurikuri/클라우드-설계원칙수정중](https://velog.io/@kurikuri/%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C-%EC%84%A4%EA%B3%84%EC%9B%90%EC%B9%99%EC%88%98%EC%A0%95%EC%A4%91)
