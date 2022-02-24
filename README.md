# ios-juice-maker

> 프로젝트 기간 2022.02.21 ~  </br>
팀원 : [@mmim](https://github.com/JoSH0318) [@marisol](https://github.com/marisol-develop) / 리뷰어 : [@steven](https://github.com/stevenkim18)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
    
## 프로젝트 소개

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
![Class Diagram](https://user-images.githubusercontent.com/88810018/155158003-471cfd4a-393d-4024-a3aa-aa66c5e77d1f.png)

## 키워드

## [STEP 1]
### 고민한점
- 각각 과일의 재고량을 저장하는 fruitInventory 프로퍼티가 존재한다. 그리고 Juice가 요구하는 과일, 수량이 recipe에서 [Fruit: Int]로 선언되어있다. (필요로 하는 과일 종류가 2가지인 경우가 있어서) Juice를 선택하면 선택된 Juice에 따라 recipe가 필요로하는 과일들과 수량을 제공하고 자동으로 fruitInventory을 차감시키려고 했다. 이 때 어떻게 한 메서드만을 이용하여 선택된 다른 Juice마다 fruitInventory에 변화를 줄지에 대한 고민을 정말 오랜시간 했다.
- Dictionary타입의 타입 프로퍼티를 선언했는데, 이때 타입 프로퍼티의 Initialization에 대한 고민
- JuiceMaker 구조체의 makeJuice() 메서드의 for문 내부에서 value를 사용하지 않는데도 인수를 (key, value) 튜플로 받는 이유가 무엇일까?
```swift
    func makeJuice(by recipe: [Fruit: Int]) throws {
        for (fruit, _ ) in FruitStore.fruitInventory {
            guard let fruitStock = FruitStore.fruitInventory[fruit] else {
                throw ErrorHandling.wrongFormat
            }
            guard let requiredQuantity = recipe[fruit] else {
                continue
            }
            guard fruitStock >= requiredQuantity else { throw ErrorHandling.outOfStock }
            FruitStore.fruitInventory[fruit] = fruitStock - requiredQuantity
        }
    }
```
- 에러 핸들링하는 메서드의 경우 네이밍을 true/false를 나타내는 bool타입으로 지어도 될지 궁금하다.
- 에러 핸들링을 위한 enum 타입의 이름을 ErrorHandling으로 지었는데, 너무 범용적으로 사용되는 이름이라는 생각을 했다.
- JuiceMaker가 struct고 FruitStore가 class인 이유에 대한 고민 (+ 어느 때에 struct와 class를 구분해서 사용하는 것일까?)

### 배운개념
- MVC
- Result 타입
- LocalizedError 프로토콜

---

## 📜 팀 그라운드 룰

### ✏️ 스크럼
> 스크럼은 딱딱한 분위기보단 자유롭고 부드러운 분위기로 😋
* 매일 아침 10시, 디스코드에서 진행
* 어제의 활동 리뷰
* 오늘 활동 예정 사항 / 목표
* 자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
* 컨디션 공유 😰
* 공유하고 싶은 이슈, 꿀팁 공유
* 스크럼 진행시간은 최대 30분을 넘기지 않기 ⏱
* 상황에 따라 조정 가능

### 🪧 프로젝트
프로젝트 협업 관련된 규칙 ( 지속적으로 업데이트 예정 ) / 야곰캠프에 있는 규칙을 기본으로 🤓

#### **Commit 규칙**
> 커밋 제목은 최대 50자 입력
> 본문은 한 줄 최대 72자 입력

#### **Commit 제목 규칙**
- [chore] : 코드 수정, 내부 파일 수정
- [feat] : 새로운 기능 구현
- [style] : 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- [add] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- [fix] : 버그, 오류 해결
- [del] : 쓸모없는 코드 삭제
- [docs] : README나 WIKI 등의 문서 개정
- [mod] : storyboard 파일,UI 수정한 경우
- [correct] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- [move] : 프로젝트 내 파일이나 코드의 이동
- [rename] : 파일 이름 변경이 있을 때 사용합니다.
- [improve] : 향상이 있을 때 사용합니다.
- [refactor] : 전면 수정이 있을 때 사용합니다
- [merge]: 다른브렌치를 merge 할 때 사용합니다.

#### **Commit Body 규칙**
- 제목 끝에 마침표(.) 금지
- 한글로 작성

#### **태그 이름 규칙**
ex) STEP-start, STEP-PR 

#### **브랜치 이름 규칙**
ex) 5_mmin90-STEP1, 5_mmin90-STEP1-1, 5_mmin90-STEP1-2, 5_mmin90-STEP2, 5_mmin90-STEP2-1, 5_mmin90-STEP2-2


