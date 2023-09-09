# 6일차 - MSG

# S3란?

---

~~이게 참 묘합니다. 자꾸 다음날 과제를 전날 미리 찍먹하는 기분이랄까요….
그래도 간단하게 배우고 넘어갔던 부분을 더 깊게 공부한다는건 좋은것 같습니다 :)~~

- **S3란?
Simple Storage Service**
말 그대로 스토리지 서비스인데 특정한 사진, 동영상 등의 파일을 저장하기 위해 사용하는
서비스라 할 수 있겠습니다.
- **S3의 기본 용어 및 개념**
    - **객체(Object)**
    S3에 **데이터가 저장되는 기본단위로써 파일과 메타데이터**로 이루어져 있다.
    - **버킷(Bucket)**
    S3에서 생성할 수 있는 **최상위 디렉토리의 개념으로 이름은 S3 리전 중에서 유일해야한다.
    버킷에 저장할 수 있는 객체 수와 용량은 무제한이다.**
    - **표준 스토리지**
    S3에 서비스 수준 계약으로 **객체 에 대해 99.9999%의 내구성을 보장하며 99.99%의 가용성을 제공한다.** 단 비용이 높다.
    - **RRS(Reduced Redundancy Storage)
    표준 스토리지보다 저렴한 비용으로 데이터를 저장**할 수 있다.
    **여러 시설 전반에 다양한 디바이스에 객체를 저장**하며 일반 디스크 드라이브의 400배의 달하는 내구성을 제공한다.
    - **Glacier**
    매우 저렴한 가격으로 데이터를 저장할 수 있는 스토리지 서비스이다.
    - **버전 관리**
    S3에 저장된 객체들의 변화를 저장한다.
    각각의 변화를 모두 기록하기 때문에 실수를 만회할 수 있다.
- **S3의 쓰임새**
    
    데이터 레이크, 웹 사이트, 모바일 애플리케이션, 백업 및 복원, 아카이브, 엔터프라이즈 애플리케이션, IoT 디바이스, 빅 데이터 분석 등 다양한 사용 사례에서 **원하는 양의 데이터를 저장하고 보호**할 수 있습니다.
    
- **S3의 특징**
    - 데이터를 여러 시설에서 중복으로 저장해 데이터 손실이 발생할 경우 자동으로 복원한다.
    - 높은 확장성과 신뢰성을 갖춘 빠르고 경제적인 데이터 스토리지 인프라에 액세스 가능
    - 단독 스토리지로도 사용할 수 있으며 다른 AWS 서비스와도 함께 사용할 수 있다.
    - 버킷은 무한대의 객체를 저장할 수 있으며 이로 인해 확장과 축소를 신경 쓰지 않아도 됨
    - HTTPS 프로토콜을 사용하여 SSL로 암호화된 엔드포인트를 통해 데이터를 안전하게
    업로드/다운로드 할 수 있다.
    - 정보의 중요도에 따라서 보호 수준을 차등할 수 있다.
    - 버전 관리 기능을 통해 사용자에 실수를 복원할 수 있다.

# 실습

---

이번건 상당히 쉽고 재밌었습니다 :)

먼저 S3를 생성 해줍니다.
![14](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/23fcc51d-4c69-49bd-a0ec-1dd925d2859a)
![15](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/83b4f7c3-5459-47b3-a577-2e171ee2dc29)
![19](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/0dc6fc93-b39a-4b8d-b234-de92ac476c70)

단 이때 ACL 권한을 활성화를 시켜주어야 합니다.
비활성화 상태가 되면 엑세스 제어 목록을 편집을 못합미다…
~~이거 땜에 10분 날림~~


그리고 원하는 파일을 업로드 해줍니다.
![16](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/65d0f340-b608-4f90-9718-e67d5a19f1ef)

그렇게 되면 버킷에 객체가 생성되고 객체의 URL이 뜨게 됩니다.
![17](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/8357f435-fdd6-4743-91de-431d5b7de9d1)

단 이때 그냥 링크를 접속하게 되면 아래 사진처럼 오류 메시지가 뜨게 됩니다.
![18](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/81053074-567c-42f2-bc42-d021a2d571a9)

이때 아까 활성화 해둔 ACL에서 퍼블릭 엑세스의 권한을 모두 활성화 시켜줍니다.
![20](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/99991afa-8475-4414-9dc6-dda3637ff9b9)

이러면 이제 실습은 끝나게 됩니다.
![21](https://github.com/GSM-MSG/DevOps-Onboarding/assets/130664740/ce0c9408-791c-4648-a823-0b9ed69c302f)


~~사진은 올릴게 없어서 보고 있던 아이네님 방송 화면을 캡쳐한것입니다 :)~~

# public 접근 허용 문제에 관하여

---

먼저 S3에 퍼블릭 접근을 허용하게 된다면 본인의 보물창고를 밖에 내놓고 있는것이라고
생각합니다. 즉, 어제와 같이 대놓고 노출하면 데이터의 유과 해킹을 당할 위험이 굉장히 늘어나는 것이지요.

**그렇다면 어떻게 해야될까?**

바로 **Pre-Signed-URL을 이용하는 것**입니다.
**Pre-Signed-URL로 S3에 직접적으로 객체를 업로드하고 다운로드 하는 방법**이 있게됩니다.

- **Pre-Signed-URL**
정해진 시간동안 S3 객체에 접근 권한을 가질 수 있게됩니다.
단 정해진 시간이 초과되면 더 이상 접근을 할 수 없습니다.

# 감사의 말

---

사실 아직 이 말을 하기엔 굉장히 이를 수 있지만 정말 하고 싶어서 좀 적어볼까 합니다.
진짜 요즘 너무 행복합니다. 내가 발전한다는게 피부로 느껴지니 그 행복이 더 배가 되는듯 합니다.

어제는 물론 애플리케이션에 대한 이해가 부족하여 살짝? 멘탈이 흔들렸지만 그때도 내가 무얼
공부해야 할지 알게되는 시간이었어서 화남과 짜증같은 감정들은 하나도 들지 않았습니다.

“아 내가 백엔드에 대한 이해가 너무 없구나 공부를 좀 해야겠는걸?”
이렇게 말입니다. 오늘도 사실 어제 약간 공부했던 과제를 수행에 필요한 이해를 위해
잠깐 공부했던 내용을 찐하게 다시 공부할 수 있으니 더 좋았던것 같습니다.

아무튼 이러한 기회를 만들어주신 가성 선배님께 정말 진심으로 감사하다는 말씀을
드리고 싶어서 이 글을 적게 되었습니다. 급하게 적은 글이다 보니 두서가 없을 수 있지만
진짜 너무 감사합니다. 21일간 온보딩을 진행할 수 있어서 너무 행복한것 같습니다.
오죽하면 추가 과제를 더 받고 싶을정도로 행복합니다. **정말 다시 한번 감사드립니다.**

# 참고한 자료들

---

[https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html?icmpid=docs_amazons3_console](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html?icmpid=docs_amazons3_console)

[https://docs.aws.amazon.com/AmazonS3/latest/userguide/troubleshoot-403-errors.html?icmpid=docs_amazons3_console](https://docs.aws.amazon.com/AmazonS3/latest/userguide/troubleshoot-403-errors.html?icmpid=docs_amazons3_console)

[https://dev.classmethod.jp/articles/for-beginner-s3-explanation/](https://dev.classmethod.jp/articles/for-beginner-s3-explanation/)

[https://docs.aws.amazon.com/ko_kr/AmazonS3/latest/userguide/Welcome.html](https://docs.aws.amazon.com/ko_kr/AmazonS3/latest/userguide/Welcome.html)

[https://velog.io/@ghldjfldj/AWS-S3란-무엇인가](https://velog.io/@ghldjfldj/AWS-S3%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80)

[https://usefultoknow.tistory.com/entry/Amazon-S3란-무엇일까](https://usefultoknow.tistory.com/entry/Amazon-S3%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%BC%EA%B9%8C)

[https://somaz.tistory.com/179](https://somaz.tistory.com/179)

[https://datalibrary.tistory.com/185](https://datalibrary.tistory.com/185)

[https://inpa.tistory.com/entry/AWS-📚-S3-버킷-생성-사용법-실전-구축](https://inpa.tistory.com/entry/AWS-%F0%9F%93%9A-S3-%EB%B2%84%ED%82%B7-%EC%83%9D%EC%84%B1-%EC%82%AC%EC%9A%A9%EB%B2%95-%EC%8B%A4%EC%A0%84-%EA%B5%AC%EC%B6%95)

[https://kingofbackend.tistory.com/232#article-1-2--pre-signed-url-을-사용하므로-얻을-수-있는-이점](https://kingofbackend.tistory.com/232#article-1-2--pre-signed-url-%EC%9D%84-%EC%82%AC%EC%9A%A9%ED%95%98%EB%AF%80%EB%A1%9C-%EC%96%BB%EC%9D%84-%EC%88%98-%EC%9E%88%EB%8A%94-%EC%9D%B4%EC%A0%90)

[https://mygumi.tistory.com/380](https://mygumi.tistory.com/380)

[https://repost.aws/ko/knowledge-center/s3-block-public-access-setting](https://repost.aws/ko/knowledge-center/s3-block-public-access-setting)
