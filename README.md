# iOS 커리어 스타터 캠프

## 프로젝트 저장소
> 프로젝트 기간 
> 팀원: [@Groot-94](https://github.com/Groot-94) [@borysarang](https://github.com/yusw10) 
리뷰어: [@protocorn93]()

---
# 목차
- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](##활동시간)
    - [참고문서](##참고문서)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)
- [핵심경험](#핵심경험)
- [STEP 1](#STEP-1)
    - [기능설명](#기능설명)
    - [고민한점](#고민한점)
    - [배운 개념](#배운개념)
    - [Review](#Review)
    - [Update](#Update)
- [STEP 2](#STEP-2)
    - [기능설명](#기능설명)
    - [고민한점](#고민한점)
    - [배운 개념](#배운개념)
    - [Review](#Review)
    - [Update](#Update)

---

# 프로젝트 소개
과일의 수량을 확인해서 과일쥬스를 만드는 어플리케이션
---
# UML  
![ClassDiagram]
![](https://i.imgur.com/6SLfIZP.png)
![Flowchart]
![](https://i.imgur.com/cJtopsy.jpg)
---

# 키워드  
- Dictionary
- Error handling
- Hiding
- class, enum, struct
---
# 그라운드 룰

## 활동 시간
- 오전 9 : 30 시작
- 오후 10시 까진 끝내기
- 금요일은 6시까지
- 유동적으로 산책, 음악감상

## 참고문서
- [Swift Language Guide - Structures and Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
- [Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
- [Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Swift Language Guide - Error Handlin](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
- [Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
- [Human Interface Guidelines - iOS](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/)
## 의사소통 방법
+ 디스코드 회의실
+ 단톡방


## 코딩 컨벤션

1. Swift 코드 스타일 : [스위프트 API 가이드라인](https://gist.github.com/godrm/d07ae33973bf71c5324058406dfe42dd) 
2. 커밋 
+ 커밋 Title 규칙

    + add: 새로운 파일 추가
    + refactor: 코드 리팩토링
    + style: 코드 내 들여쓰기나 부가적인 수정
    + feat: 새로운 기능 추가
    + fix: 버그 수정
    + docs: 문서 수정
+ 커밋 body 규칙

    + 현제 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장 문장형으로 끝내지 않기
    + commitTitle 과 body 사이는 한 줄 띄워 구분하기
    + commitTitle line의 글자수는 50자 이내로 제한하기
    + commitTitle line의 마지작에 마침표(.) 사용하지 않기
    + commitBody는 72자마다 줄 바꾸기
    + commitBody는 어떻게 보다 무엇을,왜 에 맞춰 작성하기
---
# 핵심경험
- [x] Swift API Design Guide에 따른 이름짓기
- [x] 소스코드에 불필요한 코드 및 코멘트 남기지 않기
- [x] 메서드의 기능단위 분리
- [x] 요구사항에 따른 타입의 정의
- [x] 타입의 캡슐화/은닉화
- [x] 상황에 알맞은 상수/변수의 올바른 
- [x] 내비게이션 바 및 바 버튼 아이템의 활용
- [x] 얼럿 컨트롤러 활용
- [x] Modality의 활용
---
# [STEP 1]

## 기능설명
- getRecipe() : 과일주스의 제작에 필요한 과일과 수량을 반환해주는 함수
- canUseStock() : 과일주스를 제작하기 위한 과일의 수량확인해 가능여부를 알려주는 함수
- make() : 과일주스을 만드는 함수 
- takeOrder() : 과일주스를 주문받는 함수

## 고민한점
- 은닉화 : FruitStore 클래스의 메서드들을 internal로 설정하면 FruitStore 객체를 만들어서 과일의 재고만 변동을 줄 수도 있다는 생각이 들었습니다. 그래서 FruitStore의 메서드를 JuiceMaker 에서만 사용하게 하고 싶었으나 은닉화를 하게 되면 JuiceMaker에서 사용할 수 없어서 `어떻게 해야 하는 게 좋은지`, `이 생각을 하는게 옳은 것인지 궁금합니다`. 
    - 해결방법 : FruitStore에서 은닉화가 필요한 함수를 은닉화 해주고, 그 함수를 다른 함수로 묶어서 쥬스를 만들지 않으면 과일의 재고를 변경 할 수 없도록 해줬다. 그리고 JuiceMaker의 takeOrder 함수에선 쥬스를 만드는 함수 make만 호출하도록 수정했다.

- Dictionary : 처음에 주스레시피를 Dictionary으로 관리를 하다 보니 Dictionary의 값을 옵셔널 바인딩해줘야 했습니다. 그렇게 되면 레시피가 두 가지의 과일을 사용하는 경우에는(딸기 바나나주스) for문을 사용해야 했고, for문 안에서 옵셔널 바인딩을 해야 했기 때문에 이중 들여쓰기를 사용해야 했고 이중들여쓰기 사용은 프로젝트 규칙을 어기는 방법이였습니다. 
    - 해결방법 : FruitJuice 열거형에서 각 레시피에 맞는 과일과 수량을 튜플에 넣고 그 `튜플을 배열에 넣어 리턴하는 방식`으로 사용했습니다.

## 배운개념
- Hiding
- Dictionary
- Error Handling
- Enum

## Review
- 재고 초기화 부분에서 "자주 변경될 수 있는 것과 거의 변경되지 않는 것"을 구분해서 어떻게 초기화 해줄지 고민해보기
- 에러를 언제 던지는게 좋을지에 대해서도 함께 고민해보기
- 프로그램도 마찬가지로 input에 대한 output으로 검증을 할 수 있도록 만드는 것이 좋다.
## Update
- 이니셜라이저로 동일한 수량을 받도록 수정
```swift
let initialAmount: Int

    init(initialAmount: Int) {
        self.initialAmount = initialAmount
        fruitInventory = [
            .strawberry: initialAmount,
            .banana: initialAmount,
```


- "재고가 없는 경우 사용자가 정상적으로 요청을 했지만 이를 수행할 수 없는경우"는 에러가 아니라고 생각했기에 코드의 재고확인하는 부분중 throw를 제거하고 Bool타입으로 수정
```swift
 func takeOrder(_ fruitJuice: FruitJuice) {
        do {
            let finishedFruitJuice = try fruitStore.make(fruitJuice)
            print("\(finishedFruitJuice)가 완성되었습니다.")
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
```


-  input, output을 검증하는 방향으로 코드를 수정
```swift
private func canUseStock(of fruit: Fruit, by amount :Int) throws -> Bool {
        guard let stock = fruitInventory[fruit] else {
            throw JuiceMakerError.invalidOrder
        }
        guard stock >= amount else {
            return false
        }
        fruitInventory[fruit] = stock - amount
        return true
    }
```

# [STEP 2]

## 기능설명

## 고민한점
- Navigation, Modality 
- closure 안에서 self
- notifiction
- Button의 Action을 하나로 묶고 어떤 Button이 눌렸는지 확인하는 방법
- 여러 Label을 하나씩 수정하는 방법이 아닌, 
## 배운개념
- Navigation
- Modality
- Notification
- UIButton
- UILabel
- UIAlert
- Type Casting
- storyboard
## Review

## Update
