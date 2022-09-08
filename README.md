# 🥤 쥬스 메이커 프로젝트

## 📑 프로젝트 소개
- 여러가지의 과일 주스를 만들때마다 과일 창고의 재고를 관리하고, 이를 UI로 보여주는 앱입니다.

## 📍 목차
#### 1. [팀원](#🧑🏻‍💻-1-팀원)
#### 2. [순서도](#🔖-2-순서도)
#### 3. [타임라인](#⏱-3-타임라인)
#### 4. [실행 화면(기능 설명)](#💻-4-실행-화면기능-설명)
#### 5. [트러블 슈팅](#🚀-5-트러블-슈팅)
#### 6. [참고 링크](#📎-6-참고-링크)

## 🧑🏻‍💻 1. 팀원
|애쉬|미니|
|:----:|:----:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://user-images.githubusercontent.com/88357373/186843567-7b59d8c6-8f37-4858-8cf7-6c47d58ba9b0.png" alt="Ash" border="0" width="200">|<img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/ikEGO8k.jpg">|
|<a href="https://github.com/ash-youu"> <center>*@ash-youu*</center></a> | <a href="https://github.com/leegyoungmin"> <center>*@leegyoungmin*</center></a>|

## 🔖 2. 순서도
![flowChart-Step1](https://i.imgur.com/279L9Qw.png)

![flowChart-Step2](https://i.imgur.com/XOEMRv9.png)


## ⏱ 3. 타임라인
<!-- : 시간 순으로 프로젝트의 주요 진행 척도를 표시 -->
- **2022.08.29**
	- 공식문서 학습

- **2022.08.30**
  - STEP1 구현
    ![CommitList](https://i.imgur.com/DaHEL9t.png)

- **2022.08.31**
    - PR 발송 및 공식문서 학습

- **2022.09.01**
    - STEP1 `README.md` 작성 및 공식문서 학습

- **2022.09.02**
  - 추가적인 리뷰에 대한 수정
    ![CommitList2](https://i.imgur.com/KWYwkEU.png)
    
- **2022.09.05**
    - iOS UI 앱개발 학습

- **2022.09.06**
    - STEP2 구현
    ![CommitList3](https://i.imgur.com/PGrs2ex.png)

- **2022.09.07**
    - STEP2 `README.md` 작성 및 PR 발송

## 💻 4. 실행 화면(기능 설명)
### 📌 STEP 1
- 쥬스메이커로 `makeJuice(juice:)` 함수 실행
    ```swift
    class ViewController: UIViewController {
        private let maker = JuiceMaker()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            for _ in 1...20 {
                if let juice = Juice.allCases.randomElement() {
                    maker.makeJuice(juice: juice)
                }
            }
        }
    }
    ```
- `makeJuice(juice:)` 및 `haveStock(of:, over:)`,`increaseStock(of:, by:)` 설명
    ```swift
    func makeJuice(juice: Juice) {
        let juiceNeedFruits = juice.needFruits
        let juiceNeedStocks = juice.needStocks
        
        do {
		try fruitStore.haveStock(of: juiceNeedFruits, over: juiceNeedStocks)
		fruitStore.increaseStock(of: juiceNeedFruits, by: juiceNeedStocks)
		print("주문하신 \(juice.description) 나왔습니다.")
        } catch StoreError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류가 발생하였습니다.")
        }
    }
    ```
    - 이 함수는 주스를 만드는 명령을 내리는 함수입니다.
    - 이 함수의 기능은 창고에 재고가 있는지 확인 후 있다고 판단했을 경우에만 창고의 재료를 가져와 음료를 만들 도록 설계하였습니다.
    - 만약, 재고가 없거나 부족한 경우에는 에러를 발생시키도록 하였습니다.
    ```swift
	func haveStock(of fruits: [Fruit], over stocks: [Int]) throws {
		for (fruit, stock) in zip(fruits, stocks)  {
			guard let remainStock = inventory[fruit], remainStock >= -stock else {
                throw StoreError.outOfStock
			}
		}
    }
	```
	
    - `haveStock(of:, over:)`은 주스를 만들기 위해서 필요한 재고가 있는지 확인하는 함수입니다.
    - 이 함수를 활용하여서 재고가 없는 경우에 에러를 발생시키도록 구현하였습니다.
    - 만약, 재고가 있다면 함수는 종료되게 되어, 에러를 발생시키지 않기 때문에 `makeJuice(juice:)`함수의 다음 구문이 실행되게 됩니다.
    
    ```swift
    func increaseStock(of fruits: [Fruit], by amounts: [Int]) {
        for (fruit, stock) in zip(fruits, amounts) {
            if let remainStock = inventory[fruit] {
                inventory.updateValue(remainStock + stock, forKey: fruit)
            }
        }
    }
    ```
    - `increaseStock(of:, by:)`은 재고가 있는 주스를 생성하기 위해서 재료를 꺼내오는 과정을 표현한 함수입니다.
    - 주스에 필요한 재료들과 양을 통해서 현재 창고의 재고를 줄이는 역할을 담당하게 됩니다.
    - 또한, 이는 양수의 값이 들어오게 되면, 재고를 증가시키는 함수로도 활용할 수 있습니다.
    
### 📌 STEP 2
![FirstScreenGif](https://i.imgur.com/PpPOtS8.gif)

- 음료 주문 및 이를 통해서 변경된 재고에 대한 값 반영
- 각 버튼은 각각의 음료를 주문하는 버튼이다.
- 이 버튼을 누르게 되면, 주스를 만들 수 있는 재고를 확인한 후 주스를 만들게 된다.
- 이때, 주스를 만들고 난 후에는 필요한 재고들을 감소시키게 된다.
- 또한, 화면에 보여지는 데이터도 바로 업데이트가 된다.

### 📌 STEP 3

## 🚀 5. 트러블 슈팅
### 📌 STEP 1
- `makeJuice()` 에서 juice별 함수 호출에 대한 문제
  - 가변 매개변수를 활용하는 방법과 리스트를 반환하는 방법
 
    ```swift
    // Before
    func makeJuice(juice: Juice) {
         switch juice {
            ...
         case .strawberrybananaJuice:
             if fruitStore.checkStock(fruit: .strawberry, stock: -10) &&
                 fruitStore.checkStock(fruit: .banana, stock: -1) {
                 fruitStore.changeStock(fruits: .strawberry, .banana, stocks: -10, -1)
             }
         case .mangokiwiJuice:
             if fruitStore.checkStock(fruit: .mango, stock: -2) &&
                 fruitStore.checkStock(fruit: .kiwi, stock: -1) {
                 fruitStore.changeStock(fruits: .mango, .kiwi, stocks: -2, -1)
             }
         }
     }

    // After
    func makeJuice(juice: Juice) {
        let juiceNeedFruits = juice.needFruits
        let juiceNeedStocks = juice.needStocks

        do {
        try fruitStore.haveStock(of: juiceNeedFruits, over: juiceNeedStocks)
        fruitStore.increaseStock(of: juiceNeedFruits, by: juiceNeedStocks)
        } catch StoreError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류가 발생하였습니다.")
        }
    }
    ```
  - Before과 같이 호출 시 `juice`의 케이스 별로 `haveStock()`과 `increaseStock()`을 각각 호출해줘야 하여 코드의 중복도가 높아지는 문제가 있었습니다.
  - `Juice` 타입에서 주스 별로 필요한 과일(`needFruits`)과 수량(`needStocks`)을 선언하여  `needFruitAndStock: [Fruit: Int]`의 Dictionary 타입을 `haveStock()`과 `increaseStock()` 내부에서 활용하는 방향으로 수정하였습니다.

### 📌 STEP 2
- 객체의 싱글톤화에 대한 고민
    - 싱글톤의 장점에는 한 번의 Instance만 생성하여서 메모리 낭비를 방지할 수 있습니다. 또한, 다른 자원들과 공유가 쉽다는 장점이 있습니다.
    - 싱글톤 사용이 절대적으로 장점만 있는 것은 아닙니다. 예를 들어서 메서드의 변경이 이루어 질때 마다 수정을 해야 하는 부분이 많이 생긴다던지, 많은 데이터를 공유할 경우 다른 클래스의 Instance들 간 결합도가 높아지게 됩니다.
    - 다양한 조건과 프로젝트의 방향성에 대한 논의를 하여서 확장성을 생각하였을 때, 추가적인 창고 Instance가 생성되고, 1호점, 2호점 등과 같은 확장에서 결합도가 높아질 것이라고 판단하여서 싱글톤을 사용하는 것보다는 `JuiceMaker` 타입이 `FruitStore` 타입을 소유하고 있도록 하였습니다.

- NotificationCenter 활용 시 프로퍼티 초기값 설정이 불가한 문제
    ```swift
    class FruitStore {
	    private var inventory: [Fruit: Int] = Fruit.beginningStock {
		    didSet {
			    NotificationCenter.default.post(
                            name: Notification.Name.stockChanged,
                            object: nil,
                            userInfo: inventory
                        )
		    }
	      }
    }
    ```
  - `FruitStore`의 `inventory` 값 변화를 프로퍼티 감시자(`didSet`) 내에 NotificationCenter를 사용해 `JuiceMakerViewController`에 전달하는 방식을 사용했습니다.
  - 이와 같이 진행 시 `inventory` 값이 변할 때에만 NotificationCenter에 `post`하게 되어 `맛있는 쥬스를 만들어 드려요!` View에서 초기값의 반영이 어려운 문제가 있었습니다.
  - 앱이 새로 켜질 때마다 과일의 수량은 모두 10으로 초기화되기 때문에 View 내에서 과일별 `StockLabel`을 10으로 설정하고, 이후 `inventory`의 값이 변경될 때마다 `didSet`을 통해 `StockLabel.text`가 수정될 수 있도록 했습니다.

### 📌 STEP 3

## 📎 6. 참고 링크
- [Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [왕초보를 위한 iOS 앱개발](https://yagom.net/courses/ios-starter-uikit/)
