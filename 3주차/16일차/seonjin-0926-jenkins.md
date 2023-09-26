## 16일차

 주제는 최근 devops 이슈, 운영툴, 운영툴에 대한 디테일적인 부분 모두 상관없습니다.

 주제 : jenkins

1. 이 주제를 선정하게 된 이유?
    devops를 하면서 꽤 자주 쓰게 되는 툴이기도 하고, 최근에 간편한 지속적 통합 툴에 관심을 가지게 되어 jenkins를 선택하게 되었습니다!

2. 이 주제란 무엇인가?
    jenkins란 지속적 통합을 해주는 가장 유명한 툴입니다. 빌드, 테스트 및 배포를 자동화해주고, 웹 인터페이스를 통해 간편하게 실행할수 있습니다. 편리한 설정과 안정적인 빌드 및 배포, 다양한 활용 등의 장점이 있습니다. 

3. 이 주제에 대해서 자세히 설명해주세요. (다른 온보더 분들이 봤을때 이해가 가고, 이 글을 읽는 것만으로 그 주제에 대해 어느정도 이해도가 생길 정도의 퀄리티를 목표로 잡고 작성해주세요)
    젠킨스와 같은 툴이 등장하기 전에는 일정시간마다 빌드를 실행하는 방법이 일반적이었는데, 젠킨스는 서브버전, Git과 같은 버전 관리 시스템과 연동해서 소스의 커밋을 감지하면 자동적으로 자동화 테스트가 포함된 빌드가 작동하도록 도와주게 되어 편의성이 증가되었습니다. 
    
    - 젠킨스의 기능
    젠킨스의 기능으로는 컴파일 오류 검출, 자동화 테스트 수행, 코딩 규약 준수 여부 체크 및 프로파일링 툴을 이용해 성능 변화 감시, 결합 테스트 환경에 대한 배포 작업 등이 있습니다. 
    
    - 젠킨스를 사용해야 하는 이유
    프로젝트를 하는 개발자들은 순수 개발 시간 이외에 DB 설정, 환경 설정, Deploy 작업과 같은 단순 작업에 시간을 소비하는데, 젠킨스에서 지원하는 웹 인터페이스를 통해 쉽게 수행할수 있습니다.

    - 간단한 젠킨스 사용방법(git pull)
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/9ca0bf46-1eb0-4e9b-b0de-cf06c99ee302)
      New item을 눌러 새 프로젝트를 생성해줍니다.
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/d6b39c27-194e-465d-b350-c028391bfe1d)
      pipeline을 선택해줍니다.
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/2a6518de-76d9-4f83-baab-57b9c74f7890)
      다른 설정은 놔두고 아래로 내려서
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/5e1dab82-c654-4a95-bb42-dcc2b23b84b3)
      Definition 아래에 있는 항목을 'Pipeline script from SCM'으로 바꿔줍니다.
      그리고 SCM아래에 있는 칸을 Git으로 바꿔주고 Repository URL을 입력합니다.
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/4a456990-02af-4d28-86cf-188f6dbd654c)
      branch를 선택해주고 Script Path에 git repository의 Root에 있는 Jenkinsfile을 입력해줍니다
      save로 프로젝트를 생성해주고 build now를 눌러줍니다.
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/0bed7c1f-f2ac-47b4-96ce-c11e00bceed1)
     완료된 화면을 볼수 있습니다.
      ![image](https://github.com/GSM-MSG/DevOps-Onboarding/assets/103885741/0b0154ce-409e-4b38-869a-32fa6f093c2f)


4. 이 주제를 다른 온보더분들도 같이 공부했으면, 알았으면 하는 이유
    jenkins가 많이 사용되기도 하고, 가장 널리 알려져있으며 손쉽게 사용할수 있고, 커밋이 감지되면 자동적으로 빌드가 작동하여 굉장히 편리한 툴이라고 생각이 되어 알았으면 좋겠습니다.
