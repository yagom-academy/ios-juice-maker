# ios-juice-maker

# 목차
- Description
- 구현 기능 및 코드
- Trouble Shooting
- 고민한 부분
- 아쉬운 부분

---

# Description

1. 프로젝트 기간: 2021.10.18 ~ 2021.11.5 (3주)
2. 커밋규칙
    1. 브랜치: main → step-1 → 4-Kim-EunsooSilver
    2. 카르마스타일

---

# 구현 기능 및 코드
1. [Encapsulation and Information Hiding](#1.-encapsulation-and-information-hiding)
2. [Alert](#2.-alert)
3. [Modality](#3.-modality)
4. [Stepper](#4.-stepper)
5. [Pass Data Between Scenes Using Segues](#5.-pass-data-between-scenes-using-segues)
6. [Auto Layout](#6.-auto-layout)

<details>
<summary>세부</summary>
<div markdown="0">
    
## 1. Encapsulation and Information Hiding
    
객체의 속성(data fields)과 행위(메서드, methods)를 하나로 묶고, 실제 구현 내용 일부를 외부에 감추어 은닉한다.
    
```swift
    class FruitStore {
		private let storedStrawberry: Fruit = Fruit(name: .strawberry, quantity: 10)
		private let storedBanana: Fruit = Fruit(name: .banana, quantity: 10)
		private let storedKiwi: Fruit = Fruit(name: .kiwi, quantity: 10)
		private let storedPineapple: Fruit = Fruit(name: .pineapple, quantity: 10)
		private let storedMango: Fruit = Fruit(name: .mango, quantity: 10)
    
		private var stock: [Fruit]

		private func fetchStoredFruit(of fruitName: Fruit.Name) -> Fruit {
        stock.filter{$0.name == fruitName}[0]
    }
    
    func checkStock(for requiredIngredient: Fruit) -> Bool {
        fetchStoredFruit(of: requiredIngredient.name).quantity >= requiredIngredient.quantity
    }
}
```
      
## 2. Alert
    
사용자가 앱 또는 시스템의 상태에 응답하도록 하려면 Alert을 사용한다.
      
```swift
func showFailureAlert() {
		let alert: UIAlertController = UIAlertController(title: nil,
                                                     message: AlertMessage.makeFailMessage.description,
                                                     preferredStyle: .alert)
		let okAction: UIAlertAction = UIAlertAction(title: "수정하기",
                                                style: .default,
                                                handler: { (action) in
                                                               self.changeSceneOfManageStockViewController()
                                                })
		let cancelAction: UIAlertAction = UIAlertAction(title: "나중에 하기",
		                                                style: .default,
		                                                handler: { (action) in
		                                                               self.setFruitQuantityLabel()
                                                    })
    alert.addAction(okAction)
    alert.addAction(cancelAction)
        
    present(alert,
            animated: true,
            completion: nil)
    }    
```
      
## 3. Modality
      
Modality는 종료를 전제로 명시적 작업이 필요한 임시 모드에서 콘텐츠를 표시하는 디자인 기술이다.
        
![1Simulator_Screen_Recording_-_iPhone_12_-_2021-11-05_at_13 45 44](https://user-images.githubusercontent.com/83689084/140464881-97949888-e411-43e1-b875-fd51e5a238ad.gif)
      
## 4. Stepper
      
증가 및 감소 작업을 수행하는 컨트롤이다.
        
![2Simulator_Screen_Recording_-_iPhone_12_-_2021-11-05_at_13 46 08](https://user-images.githubusercontent.com/83689084/140464899-8a508849-27a7-42bf-bbc8-92b4a62e7cc3.gif)
      
## 5. Pass Data Between Scenes Using Segues
      
스토리보드를 사용하는 경우, *segues* 를 사용하여 뷰 컨트롤러 간에 데이터를 전달할 수 있다.
    
`prepare(for:sender:)`
      
![3Simulator_Screen_Recording_-_iPhone_12_-_2021-11-05_at_13 46 38](https://user-images.githubusercontent.com/83689084/140464923-693742c6-1a5e-4b6a-ac2d-94a6d3475c31.gif)
      
```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.children.first is ManageStockViewController {
            let manageStockViewController = segue.destination.children.first as? ManageStockViewController
            manageStockViewController?.deliverdAllStock = currentAllStocks()
            manageStockViewController?.juiceMaker = self.juiceMaker
        }
}    
```
      
## 6. Auto Layout
      
Auto Layout은 뷰 계층 구조에 있는 모든 뷰의 크기와 위치를 해당 뷰에 적용된 제약 조건 기반의 동적인 계산을 하는 것을 말한다.
  
![2021-11-05_1 57 57](https://user-images.githubusercontent.com/83689084/140465220-f47cc766-b6fd-4b26-931f-21ac9fb6e947.png).

</div>
</details>
        

---

# Troouble Shooting

### 상황 1. 두 가지의 과일을 사용하는 쥬스를 주문할 경우, 한 가지의 과일만 충족함에도 다른 하나의 과일이 소모되었다.
  * 해결: 기존의 `한 가지씩 과일의 갯수 충족 여부를 확인`하는 로직에서 `두 가지 과일의 갯수 충족 여부를 한 번에 확인`하는 로직으로 변경
  * 리팩토링 전의 소스코드

```swift
func make(juice: Menu) -> String {
	var isSuccess: Bool = false

	for juice in juice.ingredients {
		isSuccess = fruitStore.bring(requiredIngredients: juice)
	}

	if isSuccess == true {
		return Message.makeSuccessMessage.description
	} else {
		return Message.makeFailMessage.description
	}
}
```

  * 리팩토링 후의 소스코드

```swift
func make(_ juice: JuiceMenu) -> Bool {
	var validStockToMake = 0

	for juice in juice.ingredients {
		validStockToMake = fruitStore.checkStock(for: juice) ? validStockToMake + 1 : validStockToMake + 0
	}

	if validStockToMake != juice.ingredients.count {
		return false
	}

	for juice in juice.ingredients {
		fruitStore.consumeStock(of: juice)
	}

	return true
}
```

  * 리팩토링 전후의 시퀀스 다이어그램

|리팩토링 전|리팩토링 후|
|--------|--------|
| ![](https://user-images.githubusercontent.com/83689084/138224644-26afba14-d976-451d-8c0b-8d17b14df1d0.jpg)| ![](https://user-images.githubusercontent.com/83689084/138989953-c08acc2a-1cfe-4b36-a7c5-5bab5cde6fc8.png)|

### 상황 2. 루트 씬의 `재고수정` 버튼이 아닌, 재고수정 alert `수정하기`로 이동할 시, 네비게이션 바가 사라졋다.
  * 해결: 알럿의 이동 경로를 재고수정 씬이 아닌, `재고수정 씬의 navigation controller`로 수정하였다.
    * navigation controller에게 `identifier`를 제공하였다.

### 상황 3. `append` 메서드 반복 수정 이후, 재고수정 씬의 라벨이 현재 재고 수량을 가져오지 못하는 문제가 발생했다.
  * 해결: 변경 과정 중 누락된 코드를 발견하였다.

---

# 고민한 부분

### 1. 에러처리에 대한 기준
  * 제어할 수 없는  에러가 발생하지 않는 프로젝트이기  때문에 에러처리를 진행하지 않았다.
  * 이유: 에러처리는 개발자가 예상치 못하는 경우(네트워크 오류, 파일 읽어오기 등)를 위해 존재하기 때문에, 해당 프로젝트와는 무관하다고 판단하였다.
    * 참고링크: [Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

### 2. 사이드 이펙트를 피하는 방법
  * 리터럴로 값을 관리할 경우, 값 변경시 발생하는 사이드 이펙트를 고려해야 한다.
  * 해당 사이드 이펙트를 피하기 위해 값을 보관하는 열거형을 정의하였다.

```swift
enum IngredientsQuantity {
	static let strawberryOfStrawberryJuice = 16
	static let bananaOfBananaJuice = 2
	static let kiwiOfKiwiJuice = 3
	static let pineappleOfPineappleJuice = 2
	static let mangoOfMangoJuice = 3
	static let strawberryOfDdalbaJuice = 10
	static let bananaOfDdalbaJuice = 1
	static let mangoOfMangKiJuice = 2
	static let kiwiOfMangKiJuice = 1
}
    
static let recipe = [JuiceMenu.strawberryJuice: [Fruit(name: .strawberry, quantity: JuiceMenu.IngredientsQuantity.strawberryOfStrawberryJuice)],
                     JuiceMenu.bananaJuice: [Fruit(name: .banana, quantity: JuiceMenu.IngredientsQuantity.bananaOfBananaJuice)],
                     JuiceMenu.kiwiJuice: [Fruit(name: .kiwi, quantity: JuiceMenu.IngredientsQuantity.kiwiOfKiwiJuice)],
                     JuiceMenu.pineappleJuice: [Fruit(name: .pineapple, quantity: JuiceMenu.IngredientsQuantity.pineappleOfPineappleJuice)],
                     JuiceMenu.mangoJuice: [Fruit(name: .mango, quantity: JuiceMenu.IngredientsQuantity.mangoOfMangoJuice)],
                     JuiceMenu.ddalbaJuice: [Fruit(name: .strawberry, quantity: JuiceMenu.IngredientsQuantity.strawberryOfDdalbaJuice),
					     Fruit(name: .banana, quantity: JuiceMenu.IngredientsQuantity.bananaOfDdalbaJuice)],
                     JuiceMenu.mangKiJuice: [Fruit(name: .mango, quantity: JuiceMenu.IngredientsQuantity.mangoOfMangKiJuice),
					     Fruit(name: .kiwi, quantity: JuiceMenu.IngredientsQuantity.kiwiOfMangKiJuice)]]
```

### 3. Switch 문을 지양해야 하는 이유

### 4. 네이밍
* 케이스 4-1. 명사형 함수명
* 케이스 4-2. 함수명으로 return, fetch, get 등의 단어 사용
* 케이스 4-3. 단일동사로 이루어진 함수명

### 5. return 생략 (Implicit returns)
