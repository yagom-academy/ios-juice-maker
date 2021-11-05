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
