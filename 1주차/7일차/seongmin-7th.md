# 7일차 - MSG

과제량으로 봤을때 이번일차가 가장 역대로 빡세지 않나 라는 생각이 드는 하룹니다. ㅎㅎ

# AWS Lambda@Edge

---

Amazon CloudFront 기능 중 하나로 애플리케이션 사용자에서 가장 가까운 위치에서
코드를 실행하여 지연 시간 단축 및 성능 개선을 할 수 있게 해주는 기능이다.
예를 들자면 한국에서 접속했다면 한국 웹서버에 배정해주고 미국에서 미국 웹서버에 배정해주는 기능이라고 생각하면 될듯하다.
또한 CloudFront에 함수를 등록할 수 있다.
이 함수들은 CloudFront 이벤트가 발생할 때 실행할 수 있다

- 이벤트 종류
    - Viewer Request : CloudFront가 뷰어로부터 요청을 받고 요청한 개체가 Edge Location에
    있는지 확인하기 전에 함수를 실행한다
    - Origin Request : CloudFront가 오리진으로 요청을 전달할때만 실행한다.
    단 요청한 개체가 edge Location에 있으면 함수가 실행되지 않는다.
    - Origin Response : CloudFront가 오리진으로부터 응답을 받은 후에 응답에 객체를
    cache 하기 전에 실행
    - Viewer Response : 요청한 개체를 뷰어에 반환하기 전에 실행
        - Origin : 원본 서버

## AWS CloudFront

---

AWS에서 지원하는 CDN 서비스이다. 캐싱을 통해 사용자에게 좀 더 빠른 전송 속도로
안전하게 콘텐츠를 제공한다. 이때 캐싱된 위치는 CloudFront의 위치(Edge Location)에 위치한다. 이때 저장되는 위치는 client에게 가장 가까운 edge server에 캐싱된다.

- TTL(Time to Live)
캐시된 항목이 TTL 설정값에 따라 일정 시간 후 만료되는 기능이다.
이때 만료된 항목에 대한 추가적인 요청 발생시 Origin으로부터 최신 버전의 항목을 가져와 다시 캐시한다.
- CDN(Content Delivery Network)
지리적으로 분산된 서버들을 연결한 네트워크로서 보통 웹 컨텐츠의 복사본을
사용자에 가까운 곳에 두는등의 역할을 한다.
- 캐싱
cpu의 캐시데이터와 비슷한 개념이다. 저장공간이 서버로 바뀐것 뿐이다

# ELB(Elastic Load Balancing)

---

AWS의 로드 밸런서 서비스이다.
주요 기능은 애플리케이션의 트래픽을 로드 밸런싱 하는것이다.

- ELB의 기본 기능
    - 부하 분산
    트래픽을 여러 대상으로 전달하도록 지정하면 사용자의 접속을 자동으로 분산한다.
    이때 ELB 자체는 부하 상황에 따라 자동으로 스케일 되기 때문에 성능 저하는 신경 쓰지 않아도 된다.
    - Health Check
    말 그대로 상태 검사를 진행하는 것이다.
    ELB가 직접 연결된 인스턴스에 트래픽을 발생시켜 인스턴스가 정상적으로
    작동하는지 확인하고 비정상적으로 작동하는 인스턴스에는 배제하는 기능인것이다.
    - 대상 모니터링
    ELB는 항상 Health Check를 진행하기 때문에 이를 통해 요청 추적이나 CloudWatch 지표를 취득할 수 있고 또 언제든지 확인 할 수 있게 해주는 기능이다.
    - 보안 기능
    보안 그룹을 포함하는 AWS의 기본적인 보안 서비스를 사용 가능하고 추가적으로
    SSL/TLS 서버 인증서를 설정하여 암호화 통신을 수행할 수 있게된다.
- CloudWatch
AWS 리소스와 AWS에서 실시간으로 실행중인 애플리케이션을 모니터링하는 서비스이다.
    - 사용하는 용어
        - NameSpcace: 말 그대로 이름이다.
        - Dimension: 지표를 나누는 기준이라고 생각하면 될것같다.
        - Metric: 지표라고 생각하면 될것같다.
        - Statistic: 통계를 나누는 기준이다.
- SSL/TLS
    - SSL(TLS) 보안 프로토콜
    Secure Socket Layer의 약자
    네트워크 통신 보안을 제공하기 위해 설계된 암호 규약이다.
    인터넷과 같이 TCP/IP 네트워크를 사용하는 통신에 적용된다.
    연결 지향 통신으로써 TCP/IP의 4계층과 같이 3 way handshake를 진행한다.
    - 인증서
    시스템에서 ID를 확인하고 이후에 SSL/TLS 보안프로토콜을 사용하여
    다른 시스템에 대한 암호화된 네트워크 연결을 설정할 수 있도록하는 디지털 객체이다.
        - 인증서의 특징
            - 웹 브라우저의 자물쇠 아이콘 및 녹색 주소 표시줄
            - 브라우저의 웹 사이트 주소에 https 접두사 포함
            - 유효한 TLS 인증서 URL 주소 표시줄의 자물쇠 아이콘을 클릭하여 펼치면 SSL/TLS 인증서가 유효한지 확인할 수 있습니다.
            - 암호화된 연결이 설정되면 클라이언트와 웹 서버만 전송된 데이터를 볼 수 있습니다.
- ELB의 구성
    - 프로토콜과 포트를 기반으로 외부 요청을 검사하고 받아들이는 Listner
    - 받은 요청을 분산/전달할 리소스의 집합인 Target group
    - 트래픽을 분배할 라우팅 규칙인 Rule
    조건이 만족되었을 때 지정된 액션을 수행하는 방식으로 작동한다.
- ELB의 사용 및 특이점
    - 보통 오토 스케일링과 조합하여 같이 사용한다.
    **오토 스케일링**은 트래픽을 몰릴때 **인스턴스(컴퓨터) 수를 자동으로 늘림**으로서 서버 사이즈를 조절해 서비스가 원할히 유지되게 하며, 또한 트래픽이 적을경우 인스턴스를 감소시켜 비용 낭비를 막아주는 서비스이며, **ELB(Elastic 로드 밸런서)**는 트래픽을 오토 스케일링을 통해 늘린 **수만개의 인스턴스**들에게 **부하(트래픽)를 분산**하는 서비스 이다.
    - 도메인 주소 접속
    ELB는 자동으로 스케일 함에 따라 IP 주소가 고정적이지 않다
    그리하여 ELB를 처음 생성할때 만든 도메인 주소로 접근할 수 밖에 없기에
    구성할 때 주의하여야 한다.

# Lambda

---

AWS가 자동으로 컴퓨팅 리소스를 관리 해주는 서버리스 컴퓨팅 시스템이다.

- 람다의 함수 호출
람다는 함수를 호출할 때마다 새로운 컨테이너를 만들어 띄우는 형식으로 진행한다.
- 람다의 장점
    - 인프라에 대한 걱정 없이 코드 실행이 가능해진다
    즉 내 코드만 신경쓰면 나머진 람다가 알아서 해준다는 소리다.
    - 100ms 단위로 코드가 실행되는 시간 과 코드가 트리거 되는 횟수를 측정하여 요금을 부과한다 이로 인해 요금 절감 가능
    - 빠른 개발 및 배포
    신경 쓸것이 함수로 제한되기 때문에 아무래도 빨라질 수 밖에 없는것같다.
- 람다의 단점
    - 리소스 제한
    메모리와 처리시간이 10GB, 15분으로 제한되어 있다.
    이렇다 보니 서버로 굴리기엔 부족하다 보니 EC2와 같이 사용하는듯 하다.
    - Stateless
    람다는 함수 호출 방식으로 인해 상태를 저장하지 않는다.
    그래서 이전에 실행한 이벤트에대한 엑세스 권한이 없다.
    - ColdStart
    리소스를 효율적으로 사용하기 위해 오랜 시간 사용하지 않으면
    잠시 컴퓨팅 파워를 꺼둔다. 이로 인해 다시 실행하는데 딜레이가 발생한다.
    즉, 오랜만에 실행하면 리퀘스트에 대한 딜레이가 발생할 수 있다는 말이다.
        - 해결법
        컨테이너에 지속적될 수 있도록 람다 함수를 지속적으로
        호출해주는 것이다. 단 이 방식의 경우 람다 함수를 계속 호출 하는 것이니 만큼
        비용이 추가적으로 들수밖에 없다.
    - 동시성의 제한
        - 동시성 : 람다가 한번에 처리할 수 있는 요청의 수
        - 동시성 계산: 평균 함수 처리 시간(초) * 평균요청/초
        
        단 이 동시성이 리전당 최대 1000개로 제한되기 때문에 이 이상의 요청이 들어오면
        람다가 수행되지 않는 문제가 발생할 수 있다.
        추가로 이 동시성은 늘릴 수 있다.
        
- 람다의 핵심 구성 요소
    - 람다 함수
    이벤트를 처리하도록 사용자가 작성하는 지정 코드
    - 이벤트 소스
    이벤트를 게시
- 예약된 동시성
설정한 람다 함수에대한 항상 일정한 처리 용량을 보장하는 기술
만약 함수 하나 많은 양의 트래픽을 받아 리전의 용량을 초과했다고 치자
그렇게 된다면 다른 람다 함수는 요청 처리가 불가능하게 된다.
즉, 이런 상황에 다른 함수의 영향을 덜 받으면서 사용하는 동시성인것이다.
얘도 근데 설정해둔고 다른데서 넘치면 걔가 요청 대기상태 되서 결국엔 처리 동시성을
늘릴 수 밖에 없지 않나 라는 생각이 든다.
- 프로비저닝된 동시성
위에서 우린 ColdStrat에 대해 알아 봤었습니다.
이때 ColdeStart로 인해 오랜만에 람다 함수를 실행하면 딜레이가 발생하는데
이런 상황을 발생 시키지 않게 하는 기술이다.
핫 스타트 상태(초기화 시간 없이 바로 실행 가능한) 실행 환경을 사전에 준비하여
콜드 스타트를 해결하는 것이라고 보면 될것같다.
단, 설정해두면 비용이 증가한다. 요금이 부과되는건 어쩔 수 없다.
- 쓰로틀링
람다에선 일정 이상의 동시성을 제한하는 쓰로틀링 기능이 있는데 이로 인해
클라이언트의 과도한 리퀘스트를 막고 함수와 리소스에 과부하를 막기 위해
실행하는것이다. 단 이로 인해 403 에러가 발생한다. 즉 이를 막기 위해
최적화는 꼭 시켜야할것같다

# API

---

Application Programming Interface
두 어플리케이션이 통신할 수 있게 해주는 규칙들? 이라고 생각하면 될것같다
그러니까 예를 들면 약간 프로그래밍 언어로 따지면 메소드 정도로 생각하면 되지 않을까
라는 생각이 든다.

- API Server
클라이언트에서 보낸 API 요청을 받아 처리하고 결과를 반환하는 역할을 한다.

# MongoDB

---

~~이거 공부하면서 멘탈이 갈렸습니다….~~

~~이번주 내로 더 공부하여 못한 부분들 채우겠습니다…
아직 모르는게 너무 많은것같습니다 :)~~

# drow.io
![7th drawio](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/430b065f-0edf-4641-aea9-7a6cfd1bb90c)
이거 해석한것도 나머지 더 공부하면서 적어보도록 하겠습니다
---


# 참고한 자료들

---

- 람다 엣지
[https://aws.amazon.com/ko/lambda/edge/](https://aws.amazon.com/ko/lambda/edge/)
[https://docs.aws.amazon.com/ko_kr/AmazonCloudFront/latest/DeveloperGuide/lambda-edge-how-it-works.html](https://docs.aws.amazon.com/ko_kr/AmazonCloudFront/latest/DeveloperGuide/lambda-edge-how-it-works.html)
[https://aws.amazon.com/ko/blogs/korea/lambdaedge-design-best-practices/](https://aws.amazon.com/ko/blogs/korea/lambdaedge-design-best-practices/)
[https://velog.io/@usreon/LambdaEdge의-이해-On-The-Fly-이미지-리사이징](https://velog.io/@usreon/LambdaEdge%EC%9D%98-%EC%9D%B4%ED%95%B4-On-The-Fly-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EB%A6%AC%EC%82%AC%EC%9D%B4%EC%A7%95)
[https://asparait.tistory.com/11](https://asparait.tistory.com/11)
[https://www.cloudflare.com/ko-kr/learning/serverless/glossary/what-is-edge-computing/](https://www.cloudflare.com/ko-kr/learning/serverless/glossary/what-is-edge-computing/)
- CloudFront
[https://www.ibm.com/kr-ko/topics/content-delivery-networks](https://www.ibm.com/kr-ko/topics/content-delivery-networks)
[https://aws.amazon.com/ko/what-is/cdn/](https://aws.amazon.com/ko/what-is/cdn/)
[https://inpa.tistory.com/entry/AWS-📚-CloudFront-개념-원리-사용-세팅-💯-정리#lambdaedge](https://inpa.tistory.com/entry/AWS-%F0%9F%93%9A-CloudFront-%EA%B0%9C%EB%85%90-%EC%9B%90%EB%A6%AC-%EC%82%AC%EC%9A%A9-%EC%84%B8%ED%8C%85-%F0%9F%92%AF-%EC%A0%95%EB%A6%AC#lambdaedge)
- ELB
[https://aws.amazon.com/ko/elasticloadbalancing/](https://aws.amazon.com/ko/elasticloadbalancing/)
[https://aws-hyoh.tistory.com/128](https://aws-hyoh.tistory.com/128)
[https://inpa.tistory.com/entry/AWS-📚-ELB-Elastic-Load-Balancer-개념-원리-구축-세팅-CLB-ALB-NLB-GLB#오토_스케일링과_조합](https://inpa.tistory.com/entry/AWS-%F0%9F%93%9A-ELB-Elastic-Load-Balancer-%EA%B0%9C%EB%85%90-%EC%9B%90%EB%A6%AC-%EA%B5%AC%EC%B6%95-%EC%84%B8%ED%8C%85-CLB-ALB-NLB-GLB#%EC%98%A4%ED%86%A0_%EC%8A%A4%EC%BC%80%EC%9D%BC%EB%A7%81%EA%B3%BC_%EC%A1%B0%ED%95%A9)
[https://www.cloudflare.com/ko-kr/learning/security/glossary/what-is-endpoint/](https://www.cloudflare.com/ko-kr/learning/security/glossary/what-is-endpoint/)
[https://nearhome.tistory.com/134](https://nearhome.tistory.com/134)
[https://docs.aws.amazon.com/ko_kr/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html](https://docs.aws.amazon.com/ko_kr/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
[https://aws.amazon.com/ko/what-is/ssl-certificate/](https://aws.amazon.com/ko/what-is/ssl-certificate/)
[https://www.digicert.com/kr/tls-ssl/tls-ssl-certificates](https://www.digicert.com/kr/tls-ssl/tls-ssl-certificates)
[https://raonctf.com/essential/study/web/ssl_tls](https://raonctf.com/essential/study/web/ssl_tls)
- lambda
[https://aws.amazon.com/ko/lambda/features/](https://aws.amazon.com/ko/lambda/features/)
[https://docs.aws.amazon.com/ko_kr/lambda/latest/dg/welcome.html](https://docs.aws.amazon.com/ko_kr/lambda/latest/dg/welcome.html)
[https://aws.amazon.com/ko/lambda/](https://aws.amazon.com/ko/lambda/)
[https://cumulus.tistory.com/11](https://cumulus.tistory.com/11)
[https://brownbears.tistory.com/428](https://brownbears.tistory.com/428)
[https://inpa.tistory.com/entry/AWS-📚-람다Lambda-개념-원리#lambda_함수_구성](https://inpa.tistory.com/entry/AWS-%F0%9F%93%9A-%EB%9E%8C%EB%8B%A4Lambda-%EA%B0%9C%EB%85%90-%EC%9B%90%EB%A6%AC#lambda_%ED%95%A8%EC%88%98_%EA%B5%AC%EC%84%B1)
[https://velog.io/@ragnarok_code/Lambda-함수-동시성이란](https://velog.io/@ragnarok_code/Lambda-%ED%95%A8%EC%88%98-%EB%8F%99%EC%8B%9C%EC%84%B1%EC%9D%B4%EB%9E%80)
[https://pearlluck.tistory.com/637](https://pearlluck.tistory.com/637)
[https://systemengineerblog.tistory.com/entry/Serverless-AWS-Lambda-내부-방식과-스로틀링](https://systemengineerblog.tistory.com/entry/Serverless-AWS-Lambda-%EB%82%B4%EB%B6%80-%EB%B0%A9%EC%8B%9D%EA%B3%BC-%EC%8A%A4%EB%A1%9C%ED%8B%80%EB%A7%81)
- AI
뤼튼을 사용하였고 이해가 안되는 부분을 추가로 더 참고하였습니다.

ELB의 역할중 엔드포인트에 관련된 역할에 대해 자세히 알려줘
스케일 아웃에 대한 엔드포인트 제공이 무슨 말일까?
AWS에서 트리거한다는 용어가 어떻게 쓰여?
CloudFront의 캐싱의 개념에 대해 알려줘
람다 자체로 애플리케이션을 배포할 수 있어?
AWS의 컨테이너 개념에 대해 알려줘
람다의 실행 방식에 대해 알려줘
람다의 동시성에 대해 알려줘
예약된 동시성에 대해 더 알려줄래
만약 예약된 동시성으로 1000개의 동시성중 200개를 특정 함수에 배당하고 있는데
다른 함수에서 900개의 요청이 들어오면 100개는 람다 함수가 실행되지 않는거야?
