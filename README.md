# 쥬스메이커 README
> 프로젝트 기간 2022/08/29 ~  
> 팀원: [rhovin](https://github.com/yuvinrho), [Mangdi](https://github.com/MangDi-L) / 리뷰어: [엘림](https://github.com/lina0322)

# 목차
- [프로젝트 소개](#소개)
- [개발환경 및 라이브러리](#개발환경-및-라이브러리)
- [타임라인](#타임라인)
- [키워드](#키워드)
- [그라운드 룰](#그라운드-룰)
- [실행 화면](#실행-화면)
- [트러블 슈팅](#트러블-슈팅)

## 소개
> 쥬스메이커 구현에 필요한 타입 정의


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

## 타임라인
[Commit History](https://github.com/yuvinrho/ios-juice-maker/commits/step1)

## 키워드
- `private`, `dictionary`, `CaseIterable`, `tuple` 
- `do-catch`, `try`, `throw`, `guard let`
- `nested type`, `LocalizedError`

## 그라운드 룰
### - 연락 가능시간(회의 가능시간)

연락 가능시간(회의 가능시간)
평일
로빈 : 오전 10 ~ 오후 언제든 가능 (* 30일 화요일 7PM까지)
Mangdi : 오전 9 ~ 오후 6,7시

스크럼
시간 : 오전 10시 (10분~ 15분 정도)
내용 : 어제 공부한 부분, 오늘의 공부 목표(프로젝트 관련 포함) 회의하고 오전 시작

### - 목표
- 주중안에 끝내기! 
- 커밋단위 준수하기
- Step1 PR 빨리 보내기

## 순서도

## 실행 화면

## 트러블 슈팅

### 🤔겪었던 문제점, 고민했던 부분 → 😎해결책
> 1) 과일과 재고를 하나의 타입에 설정해주려고 Dictionary로 [String:Int] 이렇게 정의해줬었는데 하나하나 String값으로 넣어주는부분이 불편해서 어떤 방법이 있을까 고민하다 enum타입을 넣어주는방법이 떠올랐습니다.
> 2) `FruitJuice`열거형 내부에 `fruitJuiceIngredients` 구조체를 생성하여, 각 쥬스 케이스에 따라 재료를 리턴하도록 하였습니다.(Nested Type)   
> 3) 재료가 2개 필요한 음료를 switch문에서 처리할때 fallthrough키워드를 이용해서 구현했었는데 해당 case에서 2번째재료가 소비되고 아래 case문에서 1번째 재료가 부족해서 에러를 반환하면 2번째 재료만 소비되는 오류가 발생해서 fallthrough키워드를 제거하고 같은이름을 가진 처리함수를 인자만 다르게 오버로딩해서 해결했습니다
> 4) 테스트 코드를 작성하면서 콘솔 출력을 위해 print()명령어를 사용했습니다. print()는 디버그 모드 뿐만 아니라 릴리스 모드에서도 콘솔로 출력됩니다. 테스트 용도로 디버그 모드에서만 콘솔 출력을 하기위해 debugPrint()를 사용했습니다. 
> 5) 처음 에러처리를 할때 catch에서 에러에 대한 메시지를 출력하게했었는데 이부분을 리뷰어에게 개선해야할부분으로 조언받아서 무슨 방법이 있을까 찾아봤습니다. catch 블록에서 각 에러에 대한 에러메시지를 출력했는데 에러case가 에러 메시지를 갖고 있어야한다. -> Error 열거형에서 각 에러 케이스가 String으로 rawValue로 갖는거 보다 LocalizedError 프로토콜을 채택하여 errorDescription 설정.


### 😮알게 된 점
- 코드를 시험용으로 콘솔로만 출력되게 하려면 debugPrint()를 사용하라
- 중첩 타입(Nested Type)을 이용해서 원하는 기능을 쉽게 구현가능하다. 
- catch블록에서 각 에러에 대해 print()하는 것 보다, 에러 자체적으로 메시지를 갖고 있어야 한다 

### 😭해결하지 못한 점
