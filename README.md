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
- 쥬스메이커는 원하는 맛의 쥬스를 만들고, 해당하는 쥬스에 필요한 과일을 감소시키는 기능을 가지고 있습니다. (STEP1)

- 주요 개념: `Initialization` ,  `Access Control`, `Nested Types` , `Type Casting` , `Error Handling`

---

## 👨‍💻 팀원

| idinaloq | Hemg |
| --- | --- |
| <Img src = "https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width = "250" height="300"/> | <Img src="https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="250" height="300"> |
| [Github Profile](https://github.com/idinaloq) | [Github Profile](https://github.com/hemg2)|

---

## 👀 시각화된 프로젝트 구조

| 쥬스메이커 |
|:--:|
추후 추가 예정입니다.




## 💻 실행 화면

|쥬스 주문 | | 
|:--:|:--:|
||
아직 실행화면이없어 추후 추가 예정입니다.

---


## ⏰ 타임라인

| 날짜 | 내용 |
| --- | --- |
| 2023.05.08. | 팀 룰, 쥬스메이커 구현 고민 |
| 2023.05.09. | PR진행 및 PR 대한 피드백 반영 추가 피드백 진행 |
| 2023.05.10. | PR 대한 피드백 반영 |
| 2023.05.11. | PR진행 및 PR 대한 피드백 반영 |
| 2023.05.12. | 피드백 코멘트 작성 및 README 작성 |

---

# 트러블 슈팅

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

---

## 📚 참고 링크

- [🍎Apple Docs: Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization//)
- [🍎Apple Docs: Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)
- [🍎Apple Docs: Nested Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [🍎Apple Docs: Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)
- [🍎Apple Docs: Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
- [🍎Apple Docs: API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
---

# 팀 회고
- 프로젝트 종료시에 추가 진행예정 입니다.
## 우리팀이 잘한 점
- 
## 우리팀 개선할 점
- 
## 서로에게 좋았던 점 피드백
- 
## 서로에게 아쉬웠던 점 피드백
- 
