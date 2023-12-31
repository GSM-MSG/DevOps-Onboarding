![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/6baa7abc-69c8-426e-8494-f81aff120e94)


s3 웹사이트를 기반으로한 serverless 아키텍처

aws 공식사이트의 여러글을 참고해서 구축하였습니다.

설명

web browser는 cloudfront를 통해 s3에 static website content를 전송합니다. S3는 따로 서버를 설정할 필요없이 정적 웹 페이지를 호스팅 할 수 있습니다.

그리고 dynamic website content를 API Gateway통해 vpc안의 lambda를 거친후 lambda에서 관계형 데이터베이스인 rds과 ElastiCache, 비관계형 데이터베이스 dynamodb에 전송합니다.


사용한 서비스

- Cloudfront
  CloudFront는 AWS에서 제공하는 고속 콘텐츠 전송 네트워크 서비스입니다. 캐싱을 통해 사용자에게 더 빠른 전송 속도를 제공하기 위해 사용합니다.

  CloudFront는 전세계에 Edge Server를 두고 Client에 가장 가까운 Edge Server를 찾아 빠른 데이터를 제공합니다.

  CloudFront는 CDN 서비스와 이외에도 기본 보안 기능을 제공합니다.

  - CloudFront 동작방식
  
  콘텐츠가 엣지 로케이션에 없는 경우

  CloudFront는 콘텐츠의 최종 버전에 대한 소스로 지정된 오리진에서 콘텐츠를 검색
  컨텐츠를 제공하는 근원에서 제공받아 전달
  
  콘텐츠가 엣지 로케이션에 있는 경우

  바로 전달
  
- S3
  S3는 확장성과 데이터 가용성 및 보안과 성능을 제공하는 온라인 객체 스토리지 서비스입니다. 

  데이터를 온라인으로 오브젝트 형식으로 저장하는 서비스라고 생각하면 됩니다. 데이터 조작에 HTTP/HTTPS를 통한 API가 사용됩니다.

  S3는 저장하는 데이터 양에 대한 비용도 저렴하고, 저장할 수 있는 데이터 양이 무한에 가깝고, elastic이라 별도의 스토리지 확장, 축소에 신경쓰지 않아도 됩니다.

  - S3 버킷, 객체 개념

  S3에는 Bucket과 Object라는 단위가 있습니다. 

  객체는 데이터와 메타데이터를 구성하고 있는 저장 단위이며 버킷은 이러한 객체를 저장하고 관리하는 역할을 한다.

- API gateway
  API Gateway란 규모에 상관없이 API 생성및 유지 관리, 모니터링과 보호를 할 수 있게 해주는 API가 지나가는 통로입니다.

  API Gateway 서비스는 단순히 api 경유지 역할 뿐만 아니라, 엔드포인트 서버에서 공통으로 필요한 인증, 사용량 제어, 요청/응답 변조 등의 다양한 기능을 플러그인 형태로 제공하고 있습니다.

  API Gateway를 통해 Lambda와 연동하여 Serverless 서비스를 구축하는데 많이 사용됩니다.

  - API 유형
    
  HTTP API : API 프록시 기능정도만 필요할 때 적합합니다. 단순, 저렴하고 빠릅니다.

  REST API : API 관리 기능, 요청/응답에 대한 제어가 필요할 경우 적합합니다. 복잡, 비싸고 느립니다.

  WebSocket API : 웹소켓 용도. 실시간 애플리케이션에서 주로 사용한다.

- Lambda
  lambda는 개발자가 서버를 관리할 필요 없이 애플리케이션을 빌드하고 실행할 수 있는 serverless 서비스입니다.

  lambda에 원하는 함수를 작성하면 필요할 때 그 함수를 사용할 수 있고, 다른 AWS 서비스들과 연동이 용이하다는 특징이 있습니다.

  lambda는 필요할때만 함수를 호출해 비용을 절감할수 있고 서버를 관리할 필요가 없어 운영관리에 대한 부담이 줄어든다는 장점이 있습니다.

  하지만 리소스의 제한이 있고, 상태를 저장하지 않고 함수가 매번 새로운 환경에서 호출된다는 단점이 있습니다.

- RDS
  관계형 데이터베이스를 간편하게 클라우드에서 설정, 운영 및 확장이 가능하도록 지원하는 웹 서비스입니다.

  RDS는 MySQL이나 오라클 같은 데이터베이스의 설치, 모니터링, 백업, 알람 등 관리를 대신해주며, 운영 작업을 자동화하여 효율적인 DB 서비스를 제공합니다.

  RDS를 사용하면 DB 인프라를 구성하는데 시간을 많이 소비하지 않고, 개발에 집중할 수 있는 장점이 있습니다.

  RDS에서는 Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle, MS SQLServer 총 6개의 데이터베이스 엔진 중에서 원하는 데이터베이스를 선택할 수 있다.

- DynamoDB
  DynamoDB는 AWS에서 제공하는 서버리스 기반 NoSQL 데이터베이스입니다.

  쿼리 속도가 매우빠르고 Auto-Scaling 기능을 탑재해 데이터 크기 초과/축소될 때 테이블이 알아서 늘어나고 줄어들어 비용면에서 효율적입니다.

  데이터는 자동으로 복제됩니다. 데이터의 손실을 방지하기 위해서 데이터 베이스를 자동으로 백업해서 복사본을 두고 손실율을 낮추고 있습니다.

  - DynamoDB 특징
  NoSQL 데이터베이스입니다

  HTTP로 통신합니다.

  서버리스입니다.

  Key-Value 데이터베이스입니다.

- ElastiCache(새로 알게 된 서비스)
  공식 홈페이지에 따르면

  Amazon ElastiCache는 클라우드에서 분산된 인 메모리 데이터 스토어 또는 캐시 환경을 손쉽게 설정, 관리 및 확장할 수 있는 웹 서비스입니다.

  확장 가능하고 비용 효율적인 고성능 캐싱 솔루션을 제공합니다. 또한 분산된 캐시 환경의 배포 및 관리와 관련된 복잡성을 해소할 수 있습니다.

  라고 나와있습니다.

  정리하면 인메모리 데이터베이스 캐싱 시스템을 제공하여 애플리케이션이 데이터를 검색할수있는 성능, 속도 및 중복성을 향상시키는 클라우드 캐싱 서비스입니다.

  - 기능

    애플리케이션 성능 가속화
    
    초고속 애플리케이션 성능을 위해 마이크로초 단위의 대기 시간과 높은 처리량을 기반으로 데이터에 액세스합니다.
    
    간편한 백엔드 데이터베이스 로드
    
    데이터를 캐싱하여 백엔드 데이터베이스에서 부담을 줄이면 애플리케이션 확장성을 개선하고 운영 부담을 줄일 수 있습니다.
    
    낮은 대기 시간 데이터 스토어 구축
    
    ElastiCache를 사용하여 메모리에 내구성이 없는 데이터 집합을 저장하고 마이크로초 대기 시간으로 실시간 애플리케이션을 지원합니다.

  ElastiCache는 성능과 편의성, 분산 캐시 환경 구축에 필요한 비용 절감에 효과적입니다.

  읽기 중심의 서비스(소셜 네트워크, 게임, 추천 엔진 등)를 제공해야 하는 환경, 고속으로 데이터를 분석해야 하는 환경에 적합합니다.

- VPC

  간단히 설명하면 사용자가 정의하는 IP 주소 범위 선택, 서브넷 생성, 라우팅 테이블 및 네트워크 게이트웨이 구성 등 가상 네트워킹 환경을 VPC라고 합니다.

  VPC는 네트워크 환경을 가상으로 구성하여, 리소스 배치, 연결 및 보안을 포함해서 완벽하게 제어할 수 있도록 도와주는 역할을 하고 있습니다.

  VPC를 이용해 사용자가 정의한 가상 네트워크로 AWS 리소스를 사용할 수 있습니다.
