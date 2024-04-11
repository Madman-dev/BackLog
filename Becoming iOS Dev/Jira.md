# Jira
- Jira는 팀 / 개인 서비스 및 프로젝트 진행 작업들을 한눈에 볼 수 있도록 정리해 주는 플랫폼
- Commit, Pull Request, Merge 등 모든 상황을 Jira에서 바로 확인할 수 있다.
- 참여하는 팀원들이 작업하는 feature, bugfix 등 - 동시에 진행되는 코드 상황들을 확인할 수 있다는 점

- Jira는 ticket number을 제공하여 '어떤 feature 작업, 어떤 코드인지' 일종의 '티켓(role)'을 붙인다.
해당 티켓을 커밋 기록, 브랜치 앞에 붙이면 Jira가 트래킹하여 업데이트한다.

- 이런 방식의 커밋을 smart commit이라 부른다.


## 연결하며 마주한 문제점
1. Github와 연동해도 프로젝트가 보이지 않는 이슈 - code에서 edit repository > add container > select repository를 하면 쉽게 연결할 수 있다.
**개인 프로젝트(repo)도 연결이 가능하나, admin 권한 설정이 필요하다. 다른 팀원 / 계정이 admin으로 되어 있는지 확인 필수*

### 참고
- https://www.youtube.com/watch?v=N-RZjp4og28
- sujinnaljin.medium.com/jira-jira%ec%99%80-github-%ec%97%b0%eb%8f%99%ed%95%98%ea%b8%b0-6e649180dfae
- https://www.toptal.com/software/trunk-based-development-git-flow