# 쥬스 메이커 🍓🍌🥝🍍🥭
과일 재고 관리, 선택한 과일쥬스를 만들어주는 앱

> 프로젝트 기간: 2023-05-08 ~ 2023-05-26

## 🕺 팀원
|EtialMoon|비모|
|:-:|:-:|
|<img src="https://i.imgur.com/hSdYobS.jpg" width="200"/>|<img height="200px" src="https://avatars.githubusercontent.com/u/67216784?v=4">
|[Github Profile](https://github.com/hojun-jo)|[Github Profile](https://github.com/bubblecocoa)|

</br>

## 📝 목차
1. [타임라인](#-타임라인)
2. [트러블 슈팅](#-트러블-슈팅)
3. [참고 링크](#-참고-링크)

</br>

# 📆 타임라인
|**날짜**|**진행 사항**|
|:-:|-|
|2023-05-10|- Fruit, Ingredient, JuiceMenu 타입 생성<br>- FruitStore 내에 프로퍼티, 초기화, 메소드 생성<br>- JuiceMenu에 recipe 연산 프로퍼티 추가|
|2023-05-11|- Fruit에 CaseIterable 프로토콜 채택<br>- FruitStore의 초기화 수정<br>- FruitStore 내의 메소드명 변경<br>- JuiceMaker에 쥬스 제작 메소드 생성<br>- JuiceMaker의 make 메소드에서 재료 검사하는 기능 분리<br>- JuiceError 타입 생성<br>- 접근제한자 추가|
  
</br>

# 🚀 트러블 슈팅
## 1️⃣ 하나의 과일만 담당하는 FruitStore

### 🔍 문제점
```swift
class FruitStore {
    private(set) var fruit: Fruit
    private(set) var stock: Int = 10
    ...
}    
```
초기의 `FruitStore`는 하나의 `Fruit`만 담당하게 작성되었다.
그에 따라 `JuiceMaker`의 저장 프로퍼티는 아래와 같이 작성되었다.
```swift
struct JuiceMaker {
    private let fruitStores: [FruitStore] = [
        FruitStore(fruit: .strawberry),
        FruitStore(fruit: .banana),
        FruitStore(fruit: .pineapple),
        FruitStore(fruit: .kiwi),
        FruitStore(fruit: .mango)
    ]
    ...
}
```
`FruitStore`는 단순했지만, `JuiceMaker`가 많은 `FruitStore`를 관리하게 되었다. 
각 타입의 역할을 생각해 보았을 때, 이러한 설계는 좋아보이지 않았다.

### ⚒️ 해결방안
```swift
class FruitStore {
    private(set) var fruits: [Fruit : Int] = [:]
    ...
}
```
```swift
struct JuiceMaker {
    let fruitStore = FruitStore()
    ...
}
```
각각의 코드를 위와 같이 변경했다.
`FruitStore`는 여전히 단순하지만 여러개의 `Fruit`을 다룰 수 있게 되었다.
`JuiceMaker`는 여러개의 `FruitStore`를 관리해야 하는 책임을 내려놓게 되었다.
## 2️⃣ JuiceMenu의 연산 프로퍼티 recipe

### 🔍 문제점
```swift
struct JuiceRecipe {
    let menu: JuiceMenu
    let ingredients: [Ingredient]
}
```
쥬스 제작을 위한 과일 종류와 필요 수량을 저장할 수 있도록 `JuiceRecipe`라는 타입을 생성했다. 하지만 `JuiceMaker`타입 내에 코드량이 방대해지고, 한 번 수정을 위해서는 여러곳의 코드가 변경되어야 한다는 문제가 있었다.
```swift
struct JuiceMaker {
    ...
    
    private let juiceRecipes: [JuiceRecipe] = [
        JuiceRecipe(
            menu: .strawberryJuice,
            ingredients: [
                Ingredient(fruit: .strawberry, amount: 16)
            ]
        ),
        JuiceRecipe(
            menu: .bananaJuice,
            ingredients: [
                Ingredient(fruit: .banana, amount: 2)
            ]
        ),
        ...
    ]
    
    ...
}
```
### ⚒️ 해결방안
```swift
enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    ...
    
    var recipe: [Ingredient] {
        switch self {
        case .strawberryJuice:
            return [
                Ingredient(fruit: .strawberry, amount: 16)
            ]
        case .bananaJuice:
            return [
                Ingredient(fruit: .banana, amount: 2)
            ]
    ...
}
```
`JuiceRecipe` 타입은 제거하고 `JuiceMenu` 타입 내에 연산 프로퍼티로 `recipe`를 추가했다.
```swift
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice menu: JuiceMenu) {
        do {
            let availableIngredients = try validIngredients(by: menu.recipe)
    ...
}
```
결과적으로 JuiceMaker 내의 코드가 간결해졌다.
</br>

# 📚 참고 링크
* [🍎 Apple Docs - Caseiterable](https://developer.apple.com/documentation/swift/caseiterable)
* [🍎 Apple Docs - updateValue(_:forKey:)](https://developer.apple.com/documentation/swift/dictionary/updatevalue(_:forkey:))
