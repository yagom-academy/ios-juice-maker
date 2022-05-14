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
- [기능설명](#기능설명)
- [STEP 1](#STEP-1)
    - [고민한점](#STEP-1-고민한점)
    - [배운 개념](#STEP-1-배운개념)
    - [Review](#STEP-1-Review)
    - [Update](#STEP-1-Update)
- [STEP 2](#STEP-2)
    - [고민한점](#STEP-2-고민한점)
    - [배운 개념](#STEP-2-배운개념)
    - [Review](#STEP-2-Review)
    - [Update](#STEP-2-Update)
- [STEP 3](#STEP-3)
    - [고민한점](#STEP-3-고민한점)
    - [배운 개념](#STEP-3-배운개념)
    - [Review](#STEP-3-Review)
    - [Update](#STEP-3-Update)
---

# 프로젝트 소개
과일의 수량을 확인해서 과일쥬스를 만드는 어플리케이션
---
# UML  
**[ClassDiagram]**
![](https://i.imgur.com/qqBHjOb.png)
</br>
**[Seauqence Diagram]**
![](https://i.imgur.com/RlUTFyy.jpg)
</br>
[Flowchart]
![](https://i.imgur.com/YggRejI.jpg)


---

# 키워드
- Dictionary
- Error handling
- Hiding
- class, enum, struct
- Notification
- StoryBoard
- Alert
- Modality
- UIButton
- UILabel
- UIStepper
- AutoLayout
- delegate
- Human Interface GuideLine
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
-  [Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
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
- [x] 고차함수(foreach, filter, map)
- [x] 상황에 알맞은 상수/변수의 올바른 
- [x] 내비게이션 바 및 바 버튼 아이템의 활용
- [x] 얼럿 컨트롤러 활용
- [x] Modality의 활용
- [x] Auto Layout
- [x] Notification 활용
- [x] delegate Pattern
---
# 기능설명
## **JuiceMakerViewController**
- updateFruitsStock(): FruitStoreViewController로부터 위임받아 과일재고를 수정하는 메서드
- postFruitsStockDelivered(): 과일재고를 Notification 방식으로 수정하는 메서드
- addObserverFruitsStockDidChanged(): 과일재고가 수정되면 라벨을 업데이트하는 메서드
- respondOrder(): 주문받은 쥬스의 레시피대로 재고를 차감하고 결과를 호출하는 메서드
- orderFruitJuice(): UIButton이 어떤 과일 버튼을 눌럿는지 확인하는 메서드
### *label modify*
- modifyFruitStockLabel(): 파라미터로 받은 과일에 해당하는 UILabel을 변경하는 메서드
- updateFruitsStockLabels: 각 과일에 해당하는 UILabel을 변경시키는 메서드
### *alert*
- alertSuccess(): 쥬스 제조에 성공시 나오는 alert를 띄우는 메서드
- alertfailureOfFruitJuice(): 쥬스 제조에 실패시 나오는 alert를 띄우는 메서드
- alertInvalidAccess(): 오류 발생시 나오는 alert를 띄우는 메서드
### *화면 전환*
- prepare(): segue로 화면 전환 시 현재 delegate지정해주는 메서드
- presentModalViewController(): FruitStoreView Controller로 present해주는 메서드
### *UIComponents attribute*
- adjustButtonTitleAlignment(): 각 UIButton의 text alignment를 재정의 하는 메서드
---
## **FruitStoreViewController**
- pressStepper(): Stepper의 입력을 받아 과일의 재고르 변경하는 메서드
### *View Exchange*
- pressBackBarButton(): modal 창을 dismiss 해주는 메서드
### *UI Components data setting*
- updateStepperValue(): 과일재고와 stepper의 값을동일하게 변경해주는 메서드
---
## **FruitsStockDelegate**
- updateFruitsStock(): Delegate Pattern 사용을 위한 초기 메서드
---
## **FruitJuice**
- getRecipe(): 각각의 주스를 만들기 위해 필요한 과일과 양을 튜플의 배열로 반환하는 메서드
---
## **FruitStore**
- bindingStock(): Dictionary 타입의 과일재고 프로퍼티에 대해 옵셔널 바인딩 된 값을 반환하는 메서드
- canUseStock(): 과일의 양을 확인해 과일주스에 사용될 만큼 수량이 있는지에 대해 Bool타입을 반환하는 메서드
- useOfStock(): 과일의 재고를 사용해 과일주스를 반환하는 메서드
- make(): 과일주스를 만들어 반환하는 메서드
- postFruitsStockDidChanged(): 과일재고의 변화를 Notification 으로 post 해주는 메서드
- addObserverFruitsStockDidModified(): 외부에서 과일재고의 변경을 전달받기 위해 addObserver 해주는 메서드
---
## **JuiceMaker**
- takeOrder(): 과일주스 주문의 결과를 Result타입으로 반환해주는 메서드
- requestCurrentStock(): 현재 과일재고를 반환하는 메서드
---
# [STEP 1]
## STEP 1 고민한점
- 은닉화 : FruitStore 클래스의 메서드들을 internal로 설정하면 FruitStore 객체를 만들어서 과일의 재고만 변동을 줄 수도 있다는 생각이 들었습니다. 그래서 FruitStore의 메서드를 JuiceMaker 에서만 사용하게 하고 싶었으나 은닉화를 하게 되면 JuiceMaker에서 사용할 수 없어서 `어떻게 해야 하는 게 좋은지`, `이 생각을 하는게 옳은 것인지 궁금합니다`. 
    - 해결방법 : FruitStore에서 은닉화가 필요한 함수를 은닉화 해주고, 그 함수를 다른 함수로 묶어서 쥬스를 만들지 않으면 과일의 재고를 변경 할 수 없도록 해줬다. 그리고 JuiceMaker의 takeOrder 함수에선 쥬스를 만드는 함수 make만 호출하도록 수정했다.
- Dictionary : 처음에 주스레시피를 Dictionary으로 관리를 하다 보니 Dictionary의 값을 옵셔널 바인딩해줘야 했습니다. 그렇게 되면 레시피가 두 가지의 과일을 사용하는 경우에는(딸기 바나나주스) for문을 사용해야 했고, for문 안에서 옵셔널 바인딩을 해야 했기 때문에 이중 들여쓰기를 사용해야 했고 이중들여쓰기 사용은 프로젝트 규칙을 어기는 방법이였습니다. 
    - 해결방법 : FruitJuice 열거형에서 각 레시피에 맞는 과일과 수량을 튜플에 넣고 그 `튜플을 배열에 넣어 리턴하는 방식`으로 사용했습니다.
## STEP 1 배운개념
- Hiding
- Dictionary
- Error Handling
- Enum
## STEP 1 Review
- 재고 초기화 부분에서 "자주 변경될 수 있는 것과 거의 변경되지 않는 것"을 구분해서 어떻게 초기화 해줄지 고민해보기
- 에러를 언제 던지는게 좋을지에 대해서도 함께 고민해보기
- 프로그램도 마찬가지로 input에 대한 output으로 검증을 할 수 있도록 만드는 것이 좋다.
## STEP 1 Update
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

---

# [STEP 2]

## STEP 2 고민한점
- **Navigation, Modality**
  - 재고를 수정하는 뷰로 넘어갈 때 Navigation방식으로 넘어갈지, Modal을 활용하여 present해줄 지 고민하였습니다. 화면이 단 두개뿐이라 흐름을 끊고 넘어간다는 점과, 음료를 주문하다가 재고를 변경해야해서 자연스럽게 넘어간다는 점 모두 해석에 따라 자연스럽다고 생각했습니다. 결론적으로 저희는 alert를 활용해서도 재고확인으로 넘어갈 수 있어야 해서 modal을 활용해서 화면전환을 구현했습니다.

- **closure 안에서 self를 써줘야 하는 이유**
  - NotificationCenter를 활용해서 UILabel을 업데이트해주는 함수를 호출하도록 구현했습니다. 다만 Observer를 등록하는 과정에서 클로저 내부에서 JuiceMakerViewController에 등록된 함수를 사용하려고 하니 self를 사용해야 했습니다. 왜 self를 사용해야 하는지에 대해 찾아보았는데 closure, 순환참조 등 가볍게 든 의문점인데 내용이 생각보다 많았습니다. 이 부분에 대해서 어떤 방향으로 공부를 해야하는지 고민을 했습니다.

- **Notifiction**
  - 과일의 재고를 나타내는 UILabel을 업데이트 해주는 과정에서 Notification을 사용했습니다. 이를 위해 과일 재고를 저장하는 FruitStore 인스턴스의 fruitStocks프로퍼티에 didset을 활용하여 NotificationCenter로 post해주도록 하였습니다. 하지만 didset에서 post해주는 방식은 최초에 NotificationCenter에 옵저버를 등록하기 전에(JuiceMakerViewController의 viewdidload 메서드에서 옵저버를 등록) post해주기 때문에 어플리케이션을 처음 실행하면 초기의 상태를 불러올 수 없었습니다. 그래서 저희는 초기에 FruitStock을 가져오는 함수를 구현하여 해결했지만, Notification을 활용하여 이를 해결 할 수 있는지 확인중에 있습니다. 

- **Button의 Action을 하나로 묶고 어떤 Button이 눌렸는지 확인하는 방법**
  - 이번에 기본적으로 제공된 UI에는 총 7개의 쥬스를 생성하는 버튼이 있습니다. 저희는 이 7개의 버튼이 모두 JuiceMaker의 takeOrder함수를 호출하기 때문에 모든 버튼이 하나의 IBAction을 공유하여 사용하고 어떤 버튼이 눌렸는지만 구분해주면 코드가 깔끔해질 것이라고 생각했씁니다. 다만 이 버튼을 구분하는 과정에서 어떤게 맞는지 고민을 했습니다. 
  - 처음에는 `RestorationID`라는 속성이 버튼에 있길래 ID라고 표현한 것이 Identifier처럼 사용해도 되는것이라 생각하여 이를 활용해볼까 했지만, 이 속성은 다른 목적을 위해(어플리케이션이 임의의 종료를 당했을 때 이를 복구하기 위해 사용되는 것이라고 이해했습니다) 사용되는것 같았습니다. 두번째로 AccessibilityIdentifier속성을 활용하는 것이었는데 이 속성은 목적에는 맞았지만 String타입이어서 switch 조건절에서 String으로 너무 많이 비교하는것 같아서 보류하였습니다.
  - 최종적으로 그냥 IBAction의 매개변수인 sender자체를 비교하였는데, 이렇게 여러 버튼들을 하나의 IBAction에서 처리할 때 어떻게 다루는지 궁금했습니다. 

- **StoryBoard에 등록된 여러 UILabel을 가져오는 방법**
  - 재고가 변경되면 FruitStore인스턴스의 fruitStock 프로퍼티를 가져와서 label을 업데이트 해주도록 구현하였습니다. 재고가 변경되면 storyboard에 등록된 stock들을 가져와서 각 과일의 재고를 업데이트 해주도록 했는데 5개나 되는 Label들을 일일이 `bananaStockLabel.text = stock`과 같이 업데이트 해주는게 맞는가 고민하였습니다. 

## STEP 2 배운개념
- Navigation
- Modality
- Notification
- UIButton
- UILabel
- UIAlert
- Type Casting
- Storyboard
- higher-order functions
- stepper
- Auto Layout
## STEP 2 Review
### Navigation, Modality
- 이 부분은 확실히 앱의 기능과 사용성에 따라 달라질 수 있을 것 같아요. 기능의 흐름에도 많은 영향을 미칠 수 있는 부분인데요. 이것에 대해선 HIG 문서를 한번 읽어보시면 조금은 감을 잡으실 수 있을거라 생각해요.
    
    - Modality 문서
    - Navigation 문서

### closure 안에서 self를 써줘야 하는 이유
- 네 클로저! 이 개념 역시 상당히 어려운 개념이고 정말 iOS 개발자라면 늘 마주치는 녀석이죠! 방향성의 시작은 기본 문서라고 생각해요. 먼저 Swift 공식 문서부터 천천히 읽어보시는걸 추천해드려요.

### Button의 Action을 하나로 묶고 어떤 Button이 눌렸는지 확인하는 방법
- 하나의 IBAction 메서드로 소화하려면 현재 sender로 버튼을 비교하는 방법도 하나의 방법이에요! 그게 아니라면 버튼별 IBAction 메서드를 만들어주는 방법도 있겠죠!

### StoryBoard에 등록된 여러 UILabel을 가져오는 방법
- 이 문제는 현재 구현 방법과 관련이 있는데요. 재고가 변경될 때마다 모든 과일재고를 넘겨주기보단 변경이 필요한 재료에 대해서 남은 재료만을 userInfo를 통해 전달해주면 변경이 필요한 label을 명확하게 알 수 있기에 이에 대한 고민은 해결 할 수 있을 것으로 보여져요!

- 예를 들어 딸기 10, 바나나 10개가 있는 상태에서 딸기, 바나나 각각 2개가 사용됐다면 딸기:8, 바나나:8 이렇게 건내줄거고 그렇다면 명확히 딸기레이블, 바나나레이블에 접근해서 값을 변경해주는거죠!

## STEP 2 Update
- Result Type 사용
```swift 
private func orderResult(customerRequest request: FruitJuice) {
        do {
            let result = try juiceMaker.takeOrder(request)
            switch result {
            case .failure(JuiceMakerError.productionImpossibleError):
                alertfailureOfFruitJuice()
            case .success(let fruitJuice):
                alertResult(fruitJuice)
            }
        } catch {
            alertInvalidAccess()
        }

    }

    private func alertResult(_ fruitJuice: FruitJuice?) {
        guard let fruitJuice = fruitJuice else {
            alertfailureOfFruitJuice()
            return
        }
        alertSuccess(of: fruitJuice)
    }
```

---

- 고차함수 사용
 
>1. 과일의 재고가 변경되면 변경 후 값과 변경 전 값을 비교해서 변경이 이루어진 과일의 재고만 저장하는 filtering
```swift
    func postFruitsStockDidChanged(from oldValue: [Fruit: Int]) {
        let changedFruitsStock = fruitsStock.filter {
            fruitsStock[$0.key] != oldValue[$0.key]
        }
        
```     
>2. 옵셔널로 입력받은 과일재고를 언랩핑하고 키값과 value를 사용하는 함수를 과일의 종류 만큼 여러번 호출해주는 함수
```swift  
// 변경 전
    
       private func updateFruitsStockLabels(_ stock: [Fruit:Int]?) {
        guard let unwrappedStock = stock else {
            return
        }
        for (fruit, value) in unwrappedStock {
            modifyFruitStockLabel(fruit.rawValue, value)
        }
    } 
        
//변경 후 
        
        private func updateFruitsStockLabels(_ stock: [Fruit:Int]?) {
        _ = stock?.compactMap { (key: Fruit, value: Int) in
            modifyFruitStockLabel(key.rawValue, value)
        }
    }
```

>3. 입력받은 과일의 재고들을 현재 라벨명과 비교해서 같으면 라벨에 나타나는 과일의 재고를 변경해주는 함수
```swift      
// 변경 전
        
        private func modifyFruitStockLabel(_ fruit: String, _ stock: Int?) {
        let allStockLabels: [UILabel] = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        guard let stock = stock else {
            return
        }
        for uiLabel in allStockLabels where uiLabel.accessibilityIdentifier == fruit {
            uiLabel.text = String(stock)
        }
    }
        
// 변경 후
        
        private func modifyFruitStockLabel(_ fruit: String, _ stock: Int) {
        let allStockLabels: [UILabel] = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        for uiLabel in allStockLabels.filter({ $0.accessibilityIdentifier == fruit }) {
            uiLabel.text = String(stock)
        }
    }
```


# [STEP 3]

## STEP 3 고민한점
- **View간 데이터 전달 방법**
  - JuiceMakerViewController와 FruitStoreViewController간 데이터를 전송하는 방법에 대해서 어떻게 구현할지 고민했었습니다. 저희는 활동학습때 공부했던 NotificationCenter를 활용하여 데이터의 변경점을 전파하도록 했습니다. 
  - 이렇게 했을 때 장점은 stepper로 증감 및 쥬스를 제조하여 수량이 차감되는 즉시 객체에 전파되어 추가로 변경해주는 함수가 필요없이 수정이 가능하다는 점이라고 생각합니다. 다만 Notification을 응용해보려고 사용했기에 1:N의 이벤트를 발생시키는 Notification의 특성을 살리지 못했다고 생각했습니다. 저희의 코드는 JuiceMakerViewController와 FruitStoreViewController간에 FruitsStock 딕셔너리 한개만을 주고 받기 때문에 이런경우 추가적인 뷰가 생겨 전파를 동시에 두곳에서 진행하거나, KVO방식으로 데이터 변경을 알리는게 좀 더 낫지 않을까 생각했습니다. 

- **Stepper와 label 동기화**
  - 이번에 Stepper 컴포넌트를 처음 사용해보았습니다. Stepper가 내부에 value 프로퍼티가 있었기에 이 value가 +값인지 -값인지를 나타내는 프로퍼티로 알았고 Label에 value값을 그대로 더해주는 방식으로 구현했었습니다. 하지만 의도한대로 동작하지 않아서 다시 문서를 읽어본 결과 Stepper도 내부에 자체value를 가지고 있음을 알게 되었습니다. 따라서 stepper의 value와 fruitsStock의 내부 저장 값을 일치시켜주니 의도한 대로 코드가 실행되었었습니다. 

- **iphone 4s 시뮬레이터**
  - Auto Layout을 적용하면서 가장 낮은 버전인 iPhone 4S 기기에서 테스트해보니 stepper의 크기가 비정상적으로 보이는 문제가 있었습니다. 이 부분에 대해 서포터와 이야기를 나눈 결과로, 너무 이전 버전의 기기에 대해선 고려하지 않아도 된다는 피드백을 받았습니다. 이 과정에서 실제로 현업에서는 어떤 기준을 가지고 지원대상(버전)을 정하고 관리하는지 궁금증이 생겼습니다!

- **Stepper로 데이터 변경시 로직**
  - Stepper로 재고수정 시 Stepper가 눌리는 순간 재고 변경을 post 해줄지, 아니면 modal이 닫히는 순간에 재고 변경을 post 할지 고민했습니다. 
  - 고민 1: Stepper가 눌리는 순간 재고 변경을 post 하는 방식 
    - 만약 Stepper가 10000번 눌리면 10000 번을 모두 post 하기 때문에 비효율적인 동작이라고 판단했습니다. 
  - 고민 2: modal이 닫히는 순간에 재고 변경을 post 하는 방식 
    - 재고가 변경되지 않아도 post를 하게 되고 FruitStore에서 기존과 같은 재고를 다시 덮어쓰는 무의미한 동작이라고 판단했습니다. 
  - 해결방법: modal이 닫히는 순간에 재고 변경을 post 하되, FruitStore에서 기존 재고와 변경된 부분에 대해서만 재고를 수정하는 방식으로 구현

## STEP 3 배운개념
- Stepper
- Notification 
- Auto Layout
- delegate
- property injection
## STEP 3 Review
### View간 데이터 전달 방법
NotificationCenter는 아시다시피 1:N을 위해 사용될 수 있어요. 물론 좋은 도구이지만 그만큼 어디서나 쉽게 post하고 observe할 수 있어요. 의도하지 않은 post로 다른 화면에 영향을 미칠 수 있어요. 그렇기 때문에 사용하는데 주의하셔야 해요.

저는 이렇게 이전 화면으로 데이터를 전달해주어야 할 경우에는 closure 혹은 delegate로 구현하곤 해요. 1:1 관계일 수 있고 그렇기에 두 객체간의 관계가 명확하기 때문이에요. 이번에는 delegate를 통해 구현해보시는건 어떨까요?

### 앱 개발 시 지원대상(버전)을 정하는 기준
보통 사내에선 지표를 보고 판단하곤해요. 버전별 사용자의 비율을 보고 올릴지말지 결정해요! 또한 보통 -2 버전까지 지원하더라구요. 현재 공식 iOS 버전이 15라면 13까지 지원하는 형식이에요.

### Stepper로 데이터 변경시 로직
충분히 여기서 post 해줄 수 있다고 생각해요. 사용자 액션에 따른 행위로 단순히 화면이 닫힐 때보단 닫기 버튼이나 완료 버튼을 눌렀을 때 post 해주는게 보다 코드의 맥락을 파악하는데 도움이 될 것 같아요

## STEP 3 Update

### delegate
FruitStoreViewController에서 JuiceMakerViewController 로 dismiss 될 때 delegate패턴을 사용하여 데이터를 전달하도록 구현했습니다. 
1. delegate pattern을 위해 사용할 프로토콜을 정의합니다. 저희는 과일 재고를 저장할 딕셔너리 타입을 파라미터로 사용합니다.
```swift
protocol FruitsStockDelegate: AnyObject{
    func updateFruitsStock(_ fruitStocks: [Fruit: Int])
}
```
2. JuiceMakerViewController에서 FruitStoreViewController로 present될 때 delegate를 연결해주기 위해 modalViewController의 delegate를 지정해줬습니다. 
```swift
// JuiceMakerViewController.swift
private func presentModalViewController(withId: String) {
        guard let modalViewController = storyboard?.instantiateViewController(withIdentifier: withId) as? FruitStoreViewController else {
            return
        }
        modalViewController.modalPresentationStyle = .fullScreen
        modalViewController.fruitsStock = juiceMaker.requestCurrentStock() ?? [:]
        modalViewController.delegate = self
        self.present(modalViewController, animated: true)
    }
```
3. FruitStoreViewController에서는 다시 과일 재고를 나타내는 `fruitsStock`딕셔너리를 이전 뷰인 JuiceMakerViewController에게 **위임**합니다. 아울러 FruitStoreViewController는 FruitStockDelegate를 상속받습니다. 
```swift
@IBAction private func pressBackBarButton(_ sender: UIButton) {
        delegate?.updateFruitsStock(fruitsStock)
        dismiss(animated: true)
}
```
4. 위임받은 JuiceMakerViewController는 최종적으로 FruitStoreViewController로부터 과일 재고를 받아 수정하는 함수를 호출해줍니다.  
```swift 
// JuiceMakerViewController.swift
extension JuiceMakerViewController: FruitsStockDelegate {
    func updateFruitsStock(_ fruitStocks: [Fruit : Int]) {
        postFruitsStockDelivered(fruitStocks)
    }
}
```
