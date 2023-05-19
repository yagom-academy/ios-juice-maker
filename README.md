# 🥤🧃쥬스 메이커

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

---

## 🍀 소개

`idinaloq`와 `Hemg` 팀이 만든 쥬스 메이커 프로젝트 입니다.
- 쥬스메이커는 원하는 맛의 쥬스를 만들고, 해당하는 쥬스에 필요한 과일을 감소시키는 기능을 가지고 있습니다.

- 주요 개념: `Initialization` ,  `Access Control`, `Nested Types` , `Type Casting` , `Error Handling`

---

## 👨‍💻 팀원

| idinaloq | Hemg |
| :---: | :---: |
| <Img src = "https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width = "250" height="300"/> | <Img src="https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="250" height="300"> |
| [Github Profile](https://github.com/idinaloq) | [Github Profile](https://github.com/hemg2)|

---

## 👀 시각화된 프로젝트 구조

| 쥬스메이커 |
|:--:|
추후 추가 예정입니다.








## 💻 실행 화면

| 쥬스 주문 |
|:--:|
|<img src="https://hackmd.io/_uploads/ryV05YVr2.gif" height="300" width="500">|

| 쥬스 주문시 재고 부족 |
| :--: |
|<img src="https://hackmd.io/_uploads/HycBcF4rh.gif" height="300" width="500">|






---


## ⏰ 타임라인

| 날짜 | 내용 |
| :---: | --- |
| 2023.05.08. | 팀 룰, 쥬스메이커 구현 고민 |
| 2023.05.09. | FruitStore 객체, JuiceMaker 객체 생성|
| 2023.05.10. | FruitStore 개방폐쇄원칙 피드백 진행 |
| 2023.05.11. | 전반적인 코드 리팩토링 |
| 2023.05.12. | PR, 피드백 코멘트 작성 및 README 작성 |
| 2023.05.15. | 두 번째 화면 생성기능, 화면 전환기능, 알럿컨트롤 추가|
| 2023.05.16. | 쥬스 주문 시 재고에 수량 반영, 주문완료 또는 재고 부족 시 알럿추가 |
| 2023.05.16. | FruitStore의 stock 은닉화 후 재고수량 받아오는 메서드 추가|
| 2023.05.18. | 피드백 반영하여 코드 리팩토링 진행|
| 2023.05.19. | 코드 리팩토링 완료, README 작성|




---

## ✍️ 트러블 슈팅

## 저장 프로퍼티의 활용성
- 기존 과일 재고에 대해 저장 하기 위해 저장 프로퍼티를 사용하여 하나의 저장 프로퍼티에 하나의 값을 저장 하여 진행 했었는데 이부분에 있어 조금더 효율적으로 진행하고자 하여 Int -> Dictionary로 변경하여 재고를 저장 하게 되었습니다.
```swift 
class FruitStore {
var strawBerry = 10
var banana = 10
var pineApple = 10
var kiwi = 10
var mango = 10
}
```

```swift
 var stock: [Fruit: Int] = [
        .strawBerry: 10,
        .banana: 10,
        .pineApple: 10,
        .kiwi: 10,
        .mango: 10
    ]
```


## 타입변경
- 기존 Juice 타입에서 Juice 주문시에 주문에 맞게 재고를 깍는 개념으로 decreaseStock() 를 실행 시키는 함수였습니다. 하지만 이렇게하게 되면 FruitStore에서 Juice까지 알아야 하기에 문제점이 발생 할 수있기에 타입을 변경 했어야 했습니다.
- 결합도를 낮추기 위해 하나의 객체가 여러개의 일을 하면 문제가 될 수있다고 생각을 했으며 1,2,3,4,5 에서 1=2, 2=3, 3=4, 4=5 이런식으로 단일 책임을 갖게 되면 좋을꺼 같아 타입을 변경하여 진행 하게 되었습니다.
```swift
func decreaseStock(with juice: Juice) {
        let recipe: [Fruit: Int] = juice.recipe
        for (fruit, quantity) in recipe {
            if let stock = self.stock[fruit] {
                self.stock[fruit] = stock - quantity
            }
        }
    }
```
- 기존 Juice 타입에서 -> Fruit 타입으로 변경 하여 decreaseStock() 함수를 재구현 했습니다.

```swift
 func decreaseStock(with fruits: [Fruit: Int]) {
        for (fruit, quantity) in fruits {
            if let stock = self.stock[fruit] {
                self.stock[fruit] = stock - quantity
            }
        }
    }
```

## 코드 가독성, 중복되는 코드
- 기존에 각각의 쥬스제조 버튼에 모든 액션함수들을 따로 선언했었습니다.
- 이렇게 할 경우, 가독성의 문제와 같은 코드들이 반복적으로 사용되는 문제가 있었고 결국 코드의 유지보수성도 떨어뜨리는 문제가 있었습니다.

```swift
   @IBAction func strawBerryBananaJuiceButton(_ sender: UIButton) {
        if juiceMaker.order(.strawBerryBananaJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock(sender)
        } else {
            notEnoughFruitStock()
        }
    }
@IBAction func bananaJuiceButton(_ sender: UIButton) { ... }
@IBAction func pineappleJuiceButton(_ sender: UIButton) { ... }
@IBAction func kiwiJuiceButton(_ sender: UIButton) { ... }
@IBAction func mangoKiwiJuiceButton(_ sender: UIButton) { ... }
@IBAction func mangoJuiceButton(_ sender: UIButton) { ... }
```
- 기존의 액션함수들을 하나로 합치고 sender로 들어오는 UIButton타입의 Label을 읽어서 구분하도록 했습니다. 따라서 중복되는 기능을 제거하는 한편 코드의 유지보수성도 높아질 수 있도록 수정할 수 있었습니다.
```swift
@IBAction func orderJuice(_ sender: UIButton) {
        guard let senderTitle = sender.titleLabel?.text else { return }
        let juiceNameFromSendTitle = senderTitle.components(separatedBy: "쥬스").first
        
        switch juiceNameFromSendTitle {
        case "딸기":
            showOrderedAlert(sender, by:.strawBerryJuice)
        case "딸바":
            showOrderedAlert(sender, by:.strawBerryBananaJuice)
        case "바나나":
            showOrderedAlert(sender, by:.bananaJuice)
        case "파인애플":
            showOrderedAlert(sender, by:.pineAppleJuice)
        case "키위":
            showOrderedAlert(sender, by:.kiwiJuice)
        case "망키":
            showOrderedAlert(sender, by:.mangoKiwiJuice)
        case "망고":
            showOrderedAlert(sender, by:.mangoJuice)
        default:
            print("없는 메뉴입니다.")
        }
        modifyFruitStockOnLabel()
    }
```





---

## 📚 참고 링크

- [🍎Apple Docs: Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization//)
- [🍎Apple Docs: Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)
- [🍎Apple Docs: Nested Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [🍎Apple Docs: Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)
- [🍎Apple Docs: Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
- [🍎Apple Docs: API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
---

## 👬 팀 회고
- 프로젝트 종료시에 추가 진행예정 입니다.
## 우리팀이 잘한 점
- 
## 우리팀 개선할 점
- 
## 서로에게 좋았던 점 피드백
- 
## 서로에게 아쉬웠던 점 피드백
- 
