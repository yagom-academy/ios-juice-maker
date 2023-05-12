# 🍓🍌🧃 쥬스 메이커

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

</br>

## 🍀 소개
훈맹구(`hoon`, `redmango`) 팀이 만든 쥬스 메이커 프로젝트입니다.

* 주요 개념: `Initialization`, `Access Control`, `Nested Types`, `Type Casting`, `Error Handling`

</br>

## 👨‍💻 팀원
| redmango | hoon |
| :--------: | :--------: |
| <Img src = "https://hackmd.io/_uploads/HJ2D-DoNn.png" width="200"> |<Img src="https://hackmd.io/_uploads/HylLMDsN2.jpg" width="200"> |
|[Github Profile](https://github.com/redmango1447) |[Github Profile](https://github.com/Hoon94) |



</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.08.| - `fruit` 인스턴스 생성을 위한 `Fruit` 클래스 추가 <br> - 쥬스 레시피를 위한 `Recipe` 열거형 추가 |
|2023.05.09.| - 쥬스를 만드는 기능과 쥬스의 재료 부족 시 오류 처리 추가 |
|2023.05.10.| - `Fruit`, `Recipe` 사용자 타입 리팩토링 <br> - `Ingredient` 구조체 추가 | 
|2023.05.11.| - `FruitStore` `struct` 타입으로 변경 <br> - 재료 차감시 발생하는 오류 수정 |
|2023.05.12.| - `decereaseStock` 메서드 수정|

</br>

## 👀 시각화된 프로젝트 구조 - 추후 추가 예정

### Flowchart
<p align="center">
<img width="800" src="">
</p>


### Diagram
<p align="center">
<img width="800" src="">
</p>

</br>

## 💻 실행 화면 - 추후 추가 예정

| 화면 1 | 화면 2 |
|:--------:|:--------:|
|<img src=  width="300">|<img src=  width="300">|

</br>

## 🧨 트러블 슈팅

1️⃣ **`Fruit` 사용자 타입 생성** <br>
-
🔒 **문제점** <br>

- 다양한 종류의 과일 예제들이 미션에서 주어졌습니다. 주어진 과일에 대해 이름과 수량을 저장하고 있어야 했기 때문에 `class` 타입을 활용하여 `Fruit`을 생성하였습니다.

    ```swift
    class Fruit {
        var name: String
        var quantity: Int

        init(name: String, quantity: Int) {
            self.name = name
            self.quantity = quantity
        }
    }
    ```

🔑 **해결방법** <br>

- 처음 생성한 `Fruit`은 수량을 의미하는 `quantity` 프로퍼티를 가지고 있었습니다. 하지만 과일이라는 네이밍의 클래스 안에 과일의 이름, 색, 당도 등의 프로퍼티는 가능하지만 과일 객체 자체가 자신의 수량을 가지고 있다는 점이 객체지향적 관점에서는 어색하다는 말씀을 듣고 이번 과제를 하며 다시 객체에 대해 생각해 보는 시간이 되었습니다.
    ```swift
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    ```
    `Fruit`에서 어색한 `quantity`를 빼고 위와 같이 `enum`으로 재정의 하였습니다.


<br>

2️⃣ **과일 종류에 따른 초기화 방법** <br>
-
🔒 **문제점** <br>

- `FruitStore`에 생성한 `stockList` 프로퍼티에 각각의 과일 초기 수량을 저장하기 위해 `dictionary` 타입을 사용하였습니다. 과일 초기 값이 10이라는 요구사항을 지키기 위해 프로퍼티에 기본 값을 할당하려 했지만 만약 초기 값이 변경 된다면 `dictionary`의 특성과 `Fruit`의 갯수에 따라 수정하기가 힘들수도 있다고 판단 되었습니다. 그에따라 처음엔 메서드를 만들어 사용하려 했습니다.


🔑 **해결방법** <br>

- 
    ```swift
    init(stockQuantity: Int = 10) {
        for fruit in Fruit.allCases {
            stockList[fruit] = stockQuantity
        }
    }
    ```
    하지만 메서드를 만들고 호출하여 `stockList`를 채우기보다는 `init` 함수를 사용하여 `FruitStore`의 인스턴스(객체)를 생성할 때 각각 과일에 대한 값들을 추가하도록 하였습니다. `init` 함수에서 `for`문을 활용하여 `Fruit`에 들어있는 과일들을 꺼내오기 위해 `CaseIterable` 프로토콜을 채택하였습니다.

<br>

3️⃣ **`enum Juice` 활용 방법** <br>
-
🔒 **문제점** <br>
- 처음엔 `Raw Values`를 사용하려 했으나 사용 시 정확히 무엇을 뜻하는지 모른다는 조언을 듣고 `Associated Values`를 사용하기로 했습니다.
하지만 그 결과 `JuiceMaker`내부에 스위치 문을 사용하게 되었고 반복되는 코드의 양이 너무 많아 가독성을 떨어뜨리게 되었습니다.

    ```swift
    func makeJuice(with recipe: Recipe) {
        let fruitStore: FruitStore = FruitStore()

        switch recipe {
        case .strawberryJuice(strawberry: let quantity):
            fruitStore.changeStock(of: fruitStore.strawberry, by: quantity)
        case .bananaJuice(banana: let quantity):
            fruitStore.changeStock(of: fruitStore.banana, by: quantity)
        case .kiwiJuice(kiwi: let quantity):
            fruitStore.changeStock(of: fruitStore.kiwi, by: quantity)
        case ...
        }
    }
    ```

🔑 **해결방법** <br>

 - 열거형 안에서 연산 프로퍼티 사용이 가능하다는 것을 알게 되었습니다. 초기엔 스위치문에 튜플,배열 등의 자료형을 사용하여 결과를 리턴 받아 사용했으나 `Ingredient`라는 타입을 만들어 보라는 조언에 따라 아래와 같이 코드를 생성 및 수정하여 활용했습니다.
    
    ```swift
    struct Ingredient {
        let name: Fruit
        let quantity: Int
    }
    ```

    ```swift
    enum Juice {
        case...

        var recipe: [Ingredient] {
            switch self {
            case .strawberryJuice:
                return [Ingredient(name: .strawberry, quantity: 16)]
            case...
            }
        }
    }
    ```
    
    ```swift
    mutating func makeOrder(juice: Juice) {
        do {
            for ingredient in juice.recipe {
                try fruitStore.checkStock(witch: ingredient.name, by: ingredient.quantity)
            }
            
            try juice.recipe.forEach { fruitStore.decreaseStock(witch: $0.name, by: $0.quantity) }
        } catch FruitStoreError.outOfStock(let fruit) {
            print("\(fruit)의 재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
    ```
    
    또한 `Ingredient`타입을 `FruitStore`내 메서드에 매개변수로 받아옴으로써 `JuiceMaker`는 물론이고 `FruitStore`내부 메서드들의 코드가 간소화되고 가독성이 높아졌습니다.

<br>

4️⃣ **`Ingredient` 타입 선언 위치** <br>
-
🔒 **문제점** <br>
 
- `Ingredient` 타입을 처음에는 `Juice` 타입 안에 `Nested Type`으로 생성하였습니다. 생성을 하고 사용을 하다 보니 저희의 코드에서는 `FruitStore`에 있는 메서드인 `decreaseIngredient`에서 다음과 같이 사용하게 되었습니다.
    ```swift
    func decreaseIngredient(with recipe: [Juice.Ingredient] ) throws { ... }
    ```
    여기서 든 의문점이 `FruitStore`에서 어떤 쥬스를 만드는지에 대해 알 필요가 있을까라는 의문이었습니다. 예를 들면 `FruitStore`에서는 **딸기 쥬스를 만들기** 위한 딸기 10개를 감소한다가 아닌 단순하게 **무엇을 만들지는 모르겠지만** 딸기 10개를 감소한다가 더 올바른 표현이지 않을까라는 생각을 가졌습니다. 이러한 생각 때문에 `Ingredient` 타입이 `Juice` 타입 내부에 있는 것이 아닌 외부에 존재해야 한다고 생각하였습니다. 이를 수정하여 다음과 같이 메서드를 선언하였습니다.
    ```swift
    func decreaseIngredient(with recipe: [Ingredient] ) throws { ... }
    ```

🔑 **해결방법** <br>

- `Ingredient` 타입은 `name`과 `quantity`를 프로퍼티로 가지고 있습니다. `FruitStore` 타입 안에 재고를 감소시키는 메서드에서 `Ingredient`라는 네이밍의 매개변수가 필요한지에 대해서 다시 한번 생각해 보게 되었습니다. 재료가 무엇인지를 알 필요 또한 없다고 생각이 들었고 처음 받아오는 파라미터에서 `name`과 `quantity`로 나누어서 전달 인자를 받는 방법으로 수정을 하였습니다.

    ```swift
    mutating func decreaseStock(witch fruit: Fruit, by quantity: Int) { ... }
    ```
    
    위와 같이 코드를 수정하고 나서 보면 `Ingredient`는 더 이상 사용하지 않는 타입이 되었습니다. 이를 통해 `Juice` 타입 안에 다시 `Nested Type`으로 `Ingredient`을 선언하였습니다.

