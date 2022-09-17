# 🧃 쥬스 메이커 

## 0. 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [핵심 경험](#-프로젝트-수행-중-핵심-경험)
8. [참고 링크](#-참고-링크)

## 1. 소개
사용자의 주문에 따른 🧃과일쥬스 만들기 앱입니다!
실시간 과일 재고를 확인할 수 있고, 과일의 재고 수정도 가능합니다!

<br>
![image]()



## 2. 팀원
| 애종 | zhilly | bella |
| --- | --- | --- |
| <img src= https://user-images.githubusercontent.com/99257965/190572628-7eb7c0b9-7bfd-41b2-93b6-3843f4467491.png width=150>| <img src=https://user-images.githubusercontent.com/99257965/190572502-b7a41ed7-3c1b-44af-8b03-77d7e49d4705.png width=150>| <img src=https://user-images.githubusercontent.com/99257965/190572701-5e51fd28-455f-4c3b-924d-0baade5011a3.png width=150> |
| @jonghancha | @zhilly11 | @hyhy0429 |

<br>

## 3. 타임라인
[STEP-1]
- 220829: Ground Rule 작성, STEP-1 Flow Chart 작성
- 220830: FruitStore, JuiceMaker 모델파일 작성
    - FruitStore: 재고 변수, 재고에 접근, 재고 변경하는 메서드 작성
    - JuiceMaker: Juice Recipe를 NestedType을 통해 구현, 재고 수정 기능, 제약사항에 따른 에러처리 구현
- 220831: 접근수준 지정을 위한 Protocol 파일 생성 및 캡슐화& 은닉화 구현
    - 참조되는 메서드들 따로 extension *ClassName*: *ProtocolName* {} 로 이동


[STEP-2]
- 220906: `NotificationCenter` 이용
    - 알림 전송 시, 쥬스의 이름과 쥬스완성여부를 userInfo에 담아 post하도록 구현
- 220908: juiceMaker 인스턴스 생성 위치
    - FruitJuiceStoreViewController 내부에서 ViewDidLoad 기준 내부와 외부 중 juiceMaker 인스턴스 생성 위치에 대해 토의
- 220913: Model폴더 내부의 JuiceMaker.takeOrder메서드 ViewController.takeOrder로 위치 변경
    - Controller 단위에서 에러처리가 가능해짐에 따라 NotificationCenter기능 삭제
  

[STEP-3]
- 220916: 화면 전환 시, 전달값 방법 결정
    - 재고 추가 화면 전환 시, 재고변경을 위해 `class FruitStore()` vs `fruitStock: [Fruit: Int]` 둘 중 어떤 데이터타입을 공유할 지에 대해 토의
- 220916: 재고 추가 화면으로의 화면전환방법에 대해 토의. `segue 연결` vs `present()`
    - storyboard 상의 segue를 연결해 화면 전환
    - 화면전환 시 prepare 메서드를 이용해 fruitStock값 공유


<br>

## 4. 시각화된 프로젝트 구조
### File Tree

```bash
.
├── Controller
│   ├── AppDelegate.swift
│   ├── FruitJuiceStoreViewController.swift
│   ├── FruitStockEditorViewController.swift
│   ├── JuiceMaker.swift
│   └── SceneDelegate.swift
├── Model
│   ├── Enum
│   │   └── Variation.swift
│   ├── Fruit
│   │   ├── Fruit.swift
│   │   └── FruitStore.swift
│   └── Juice
│       ├── Juice.swift
│       ├── JuiceMaker.swift
│       └── JuiceMakerError.swift
├── Protocol
│   ├── FruitStockDelegate.swift
│   ├── FruitStoreProtocol.swift
│   └── JuiceMakerProtocol.swift
└── View
    └── Base.lproj
        ├── LaunchScreen.storyboard
        └── Main.storyboard

```

### Flow Chart
#### STEP-1
<img src=https://user-images.githubusercontent.com/99257965/190572804-3b432f70-a7df-49e9-827c-32420eba5980.png width=500> 


#### STEP-2

<img src=https://user-images.githubusercontent.com/99257965/190572863-9089de50-f7b4-4909-95ee-c03a23dd7b1d.png width=500>


#### Class Diagram

<img src=https://user-images.githubusercontent.com/99257965/190572938-b6106613-8823-4043-bd9d-823965672f55.png>


<br>

## 5. 실행 화면(기능 설명)
| 주스 주문 성공 | 주스 주문 실패 |
|:--:|:--:|
|![Simulator Screen Recording - iPhone 14 Pro - 2022-09-16 at 14 09 53](https://user-images.githubusercontent.com/99257965/190573730-d60af6bf-4874-4dc5-ac8a-d2d19a64f495.gif)|![Simulator Screen Recording - iPhone 14 Pro - 2022-09-16 at 14 08 45 복사본](https://user-images.githubusercontent.com/99257965/190573313-5d8e69ea-54f3-47d7-9060-4c121ffca61e.gif)|


<br>


## 6. 트러블 슈팅
### fruitStock 타입 결정
- 과일의 재고를 관리해주기 위해 재고를 의미하는 `fruitStore`의 타입을 고민했습니다. 과일의 이름과 해당과일의 재고를 동시에 파악하기 위해 딕셔너리 타입으로 구현했습니다. 
- 재고 확인을 위해 `Value`에 접근할 때 딕셔너리의 특징상 옵셔널을 체크해줘야했습니다. 코드의 재사용성이 높을 것 같아 옵셔널 바인딩 메서드를 추가했습니다.


### Juice 추상화
- Juice 파일내에 `Recipe` 타입을 생성 할 때에, `Netsted Types`을 어떻게 활용하여 사용할지 고민했었습니다. User가 선택한 Juice 중에서 한종류의 과일을 사용하여 제조하는 경우와 두 종류의 과일을 이용하여 제조하는 경우가 있었습니다. 이에 따라, 처음에는 두번째 종류의 과일과 수량을 튜플을 사용하고 옵셔널로 선언을 하여 구현하였으나, 다음과 같은 문제가 발생하게 되었습니다. 
    - **복잡한 후행 처리**
 : 두 번째 종류의 과일값이 옵셔널로 생성되게 된다면 두 번 종류의 과일 값을 사용할 때 마다 옵셔널바인딩을 해야하는 번거로움이 생깁니다.
    - **만약에 세 번째 재료를 사용하는 쥬스가 생긴다면?**
 : 세 번째 프로퍼티를 다시 추가해야 하고, 이는 코드의 유지보수가 복잡해질 수 있습니다.
- 이러한 문제를 해결하고자, 기존의 구현했던 두번째 과일 종류를 옵셔널로 지정하는 방법에서 배열을 이용하여 과일종류와 필요수량을 배열에 담는 방법으로 변경하였습니다. 
```swift
// 기존 Recipe 구조체
struct Recipe {
        let first: (Fruit, Int)
        let second: (Fruit, Int)?
    }

// Recipe 구조체 내부의 프로퍼티 변경
struct Recipe {
        let name: Fruit
        let amount: Int
    }

// 1번 방법: 기존의 옵셔널을 활용하여 레시피를 표현하는 방법
var recipe: Recipe {
    switch self {
    case .strawberryJuice:
        return Recipe(first: (.strawberry, 16), second: nil)
    case .strawberryBananaJuice:
    return Recipe(first: (.strawberry, 10), second: (.banana, 1))
}

// 2번 방법: 고민사항을 반영하여 배열로 레시피를 표현하는 방법
var recipe: [Recipe] {
    switch self {
    case .strawberryJuice:
        return [Recipe(name: .strawberry, amount: 16)]
    case .strawberryBananaJuice:
        return [Recipe(name: .strawberry, amount: 10), Recipe(name: .banana, amount: 1)]
}

``` 
- 배열을 사용하는 방식을 쓰게 되면, 추후 얼음 또는 설탕과 같은 재료의 추가의 경우에도 손쉽게 `Recipe 구조체`만 수정하면 되기 때문에 유지보수의 용이성을 가지고 있습니다.


### Error Handling
- [STEP-1] 소스에서는 단순하게 `isEnoughStock()` 메서드만을 이용해 단순하게 재고가 수정해야할 양보다 적을 경우, 오류 문구를 출력해주는 정도로 `error`를 표현하고 있는데, 추후 ViewController 단위로 작업을 넓혀간다면 `do-try-catch` 또는 `result` 중에 어떤 방법으로 어느 단위에서 구현해야할지 고민중에 있습니다.
- [STEP-2] 기존의 재고가 충분한지 확인하는 메서드 `isEnoughStock()`를 활용 및 수정해 `checkEnoughStock(juiceRecipe: [Juice.Recipe]) throws`로 변경해 에러를 처리했습니다. 또한 쥬스를 만드는 로직을 ViewController단위로 옮김에 따라 `JuiceMaker`에서 에러 결과를 받아 다시 return 해주는 메서드를 작성했습니다.

### 비니지스로직에 대한 이해에 따른 NotificationCenter 사용 취소
- 기존에는 JuiceMaker에 주스를 주문받는 takeOrder메서드를 구현하였습니다. 메서드 내부에는 NotificationCenter가 post한 내용에 따라, 쥬스 주문 시에 필요한 해당 레시피에 따른 과일양을 확인하는 메서드를 호출하고 과일재고 유무에 따른 성공/실패 얼럿을 띄워주게 되었습니다. 
그러나, 비니지스로직의 개념에 대해 살펴보고 takeOrder 메서드의 위치에 대해 고민하게 되면서 takeOrder 메서드의 위치를 FruitJuiceStoreViewController로 옮기게 되면서 NotificationCenter의 알림을 전송받게 될 이유가 사라지게 되어 사용하지 않게되었습니다. 

### 화면 사이 데이터공유 시 공유할 데이터타입에 대한 고민
- 쥬스메이커 화면에서 재고 추가 화면으로 화면전환이 이루어질 때 `FruitStore()`클래스를 공유할지, `fruitStock: [Fruit: Int]`값을 공유할지에 대해 고민했습니다. 팀원들과 토의한 후 다음과 같은 이유로 `fruitStock`값을 공유하기로 결정했습니다.
    - 첫번째 이유: `FruitStore()`의 메서드를 사용하지 않기 때문입니다. `fruitStock`프로퍼티를 제외한 `FruitStore()` 내부요소들을 사용하지 않아 공유하기 적합하지 않다고 판단했습니다.
    - 두번째 이유: 참조 타입인지 값 타입인지 불분명한 타입을 공유하게 된다면 예상하지 못한 오류들이 발생할 수 있기 때문에 `fruitStock`값을 공유하기로 결정했습니다. 


### 재고추가 화면으로의 화면전환방법 선택
```swift
// 1번 방법: Segueway를 통한 전환
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fruitStockEditorViewController = segue.destination as?  FruitStockEditorViewController else { return }

        fruitStockEditorViewController.delegate = self
        fruitStockEditorViewController.editingFruitStock = receiveFruitStock()
}


// 2번 방법: present를 이용한 전환 
@IBAction func touchUpEditButton(_ sender: Any) {
        guard let fruitStockEditorViewController = self.storyboard?.instantiateViewController(identifier: "FruitStockEditorViewController") as? FruitStockEditorViewController else { return }

        fruitStockEditorViewController.delegate = self
        fruitStockEditorViewController.editingFruitStock = receiveFruitStock()
        present(fruitStockEditorViewController, animated: true, completion: nil)
}
```
- 위 코드에 기재된 두가지 방법 중, Segueway 를 통한 전환방법을 선택했습니다. 
    - 첫번째 이유: 현재는 같은 Storyboard에서 존재하는 두개의 ViewController를 연결하는 정도의 프로젝트 이기에 이와같은 방법도 괜찮다고 생각했습니다.
    - 두번째 이유: `FruitStockEditorViewController`로 이동되는 로직이 두 가지라서 한 번만 작성해도 되는 segueway 방식을 선택해 `prepare`를 override하여 사용했습니다.


<br>

## 7. 프로젝트 수행 중 핵심 경험

- 메서드의 기능단위 분리
- 각 타입 내 비지니스 로직에 대한 고민
- Nested Types 사용
- Initalization에 대한 고민
- Class와 Struct 타입 차이에 따른 이용
- 접근제어 단계에 따른 은닉화
- UIkit 컴포넌트에 대한 이해와 활용
    - 화면 전환방식에 대한 이해
    - IBOulet과 IBAction에 대한 이해
    - Alret과 Stepper의 활용
    - 화면 사이의 데이터 공유
  

<br>

## 8. 참고 링크

* [API Design Guidlines](https://swift.org/documentation/api-design-guidelines/)
* [Swift Style Guide](https://google.github.io/swift/)
* [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
* [miro.com - flow chart](https://miro.com/)
* [drawio - UML](https://app.diagrams.net/#G1GfUnm8pqcSgVwBMxitc_-zU6mqlr4KEm)
* The Swift Programming Language (Swift 5.7)
    - [Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
    - [Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
    - [Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
    - [Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
    - [Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
    - [Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
    - [Protocol](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

---
[🔝 맨 위로 이동하기](#🧃-쥬스-메이커)
