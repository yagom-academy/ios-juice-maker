# 🍭🧋🍹JuiceMaker🧃🥛🍬


<Img src = "https://hackmd.io/_uploads/H12Bxv4Sn.png" width="700"/>


## 📖 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [다이어그램](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [참고 링크](#7.)
8. [팀 회고](#8.)

<br>

<a id="1."></a>

## 1. 📢 소개

    사용자가 쥬스를 선택하면 과일 재고를 확인하고 
    쥬스 레시피에 따라 과일 재고를 소진하여 쥬스를 만들 수 있습니다.

<br>

<a id="2."></a>

## 2. 🦊 팀원 🐷

| [Minsup 🦊](https://github.com/agilestarskim) | [Serena 🐷](https://github.com/serena0720) |
| :--------: | :--------: |
| <Img src = "https://avatars.githubusercontent.com/u/79740398?v=4" width="300"/>| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="300"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

|날짜|내용|
|:---:|---|
| **2023.05.09** |▫️ `FruiteStore` 재고 클래스 및 `JuiceMaker` 과일쥬스 클래스 정의 <br> ▫️ `Error` 케이스 정의 및 별도 파일 분리 <br> ▫️ `updateStock`, `checkStock` 함수 정의 <br> ▫️ `useValidStock` 함수 정의, 재고 확인 후 재고 업데이트 가능하게 수정 <br> ▫️ `useValidStock` 함수에 반복문 `foreach` 활용하여 반복 코드 제거 |
| **2023.05.10** | ▫️ `JuiceRecipe alias` 명명  <br> ▫️ `Errors` 폴더 생성 및 이름 변경 <br> ▫️ `enum rawValue`대신 계산 프로퍼티를 이용해 `name`으로 접근 | 
| **2023.05.11** | ▫️ `stock` 관련 `updateStock`, `spendStock` 으로 함수 분리 <br> ▫️ `FruitStock` 주입 및 기본값 설정 | 
| **2023.05.16** | ▫️ `Main`, `Stock ViewController` 생성, `error` 메세지 `alert` 구현 <br> ▫️ 네비게이션 `push`로 변경 <br> ▫️ 주문 버튼, 알럿 버튼 추가, 재고레이블 연결 <br> ▫️ 알럿 아니오 클릭 시 화면이동 <br> ▫️ `NotificationCenter`로 `Stock Label` 업데이트 구현 <br> ▫️ `error description` 구현 <br> ▫️ `onTouchOrderButton` 함수분리 <br> ▫️ `notification` 알람 시 `configurelabel` 재활용 | 
| **2023.05.17** | ▫️ `typecasting`제거, 스토리보드 ID변경 <br> ▫️ `StoryBoardable` 추가, `NavigationController` 한개 삭제 <br> ▫️ `NotificationCenter`에서 `Delegate`패턴으로 신호 전달 방법 변경 <br> ▫️ `onTouchorderButton`내부`switch`문 제거 <br> ▫️ 중복된 에러 처리 리팩토링 | 
| **2023.05.18** | ▫️ `delegate pattern`을 메소드로 수정 <br> ▫️ 타겟워드 삭제 메소드 변경 <br> ▫️ `Namespace` 생성, 터치메소드 이름 변경| 

<br>

<a id="4."></a>
## 4. 📊 다이어그램

<Img src = "https://hackmd.io/_uploads/ryi5MtESh.jpg" width="670"/>|

<br>

<a id="5."></a>
## 5. 📲 실행 화면

![](https://postfiles.pstatic.net/MjAyMzA1MTlfNzYg/MDAxNjg0NDczMzI2Njcz.LxxTOCPDh9sxd4QAy54pPSvyeT7YWFKDG_Rl2zxuTaQg.Nkf42WjKutzqYlGW55LM4zmOdnKsugttxvK2UUU7EPAg.GIF.sha0720/Simulator_Screen_Recording_-_iPhone_14_Pro_-_2023-05-19_at_14.13.13.gif?type=w773)


<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

### 🔥 다중 역할의 함수 역할 분리

#### 문제상황
- `checkStock` 한가지 함수 안에서 재고 확인과 재고 업데이트 역할 2가지를 역할을 수행하였습니다. 한 함수 안에는 한가지의 역할을 수행해야 한다고 배웠기에 이를 분리해야겠다 생각했습니다.

#### 해경방법
- 재고 확인 함수 `checkStock`과 재고 업데이트 함수 `updateStock`으로 각각의 역할을 분배하였습니다.
- 두 함수를 호출하는 `useValidStock` 함수를 만들었습니다.
⚠️ 수정 전

```swift
private func updateStock(usedFruit: (fruit: Fruit, amount: Int)) { 
    guard let currentAmount = fruitStock[usedFruit.fruit],
        currentAmount < amount else { return }

    fruitStock[usedFruit.fruit] = currentAmount - usedFruit.amount   
}
```

✅ 수정 후

```swift
private func validateStock(ingredient: Ingredient) throws {
    let currentStock = getStock(fruit: ingredient.fruit)

    guard currentStock >= ingredient.amount else {
        throw FruitStoreError.notEnoughStock(ingredient.fruit)
    }
}

private func spendStock(of fruit: Fruit, by amount: Int) {
    self.fruitStock[fruit] = getStock(fruit: fruit) - amount
}
```
                                   


<br>

### 🔥 중복 코드 삭제 방법
    
#### 문제상황

```swift
switch juice {
...
case .mangoKiwiJuice:
    try fruitStore.checkStock(fruit: .mango, by: 2)
    try fruitStore.checkStock(fruit: .kiwi, by: 1)
    fruitStore.updateStock(fruit: .mango, amount: 2)
    fruitStore.updateStock(fruit: .kiwi, amount: 1)
...
```
    
- `JuiceMaker`에서 쥬스를 만들 때, 재고 확인 및 재고 업데이트 함수(위 코드 참조)를 케이스별로 호출해야했습니다.
- 특히 망고키위쥬스와 같이 과일의 종류가 2가지인 경우 각 과일별로 함수들을 호출해야했기 때문에 중복 함수가 많다고 생각했습니다.
    
#### 해결방법

- `Juice` 타입에서 `recipe` 계산 프로퍼티를 사용해 레시피를 반환해줍니다.
- `FruitStore`에서 유효성검증과 재고소모 함수를 묶어 `useValidStock`을 생성했습니다.
- `makeJuice`에서 `useValidStock`을 호출해 `recipe`를 받아 코드를 획기적으로 줄였습니다.

⚠️ 수정 전
        
```swift
func makeJuice(juice: Juice) {
    do {
        switch juice {
        ...
        case .mangoKiwiJuice:
            try fruitStore.checkStock(fruit: .mango, by: 2)
            try fruitStore.checkStock(fruit: .kiwi, by: 1)
            fruitStore.updateStock(fruit: .mango, amount: 2)
            fruitStore.updateStock(fruit: .kiwi, amount: 1)
        }
        ...    
    } catch {
        
    }
}    
```
    
 ✅ 수정 후
        
```swift
func makeJuice(juice: Juice) {
    do {
        try fruitStore.useValidStock(recipe: juice.recipe)
    } catch {
        ...
    }
}    
```
 
<br>

### 🔥 여러 과일이 필요한 쥬스에서 에러 시 되돌리는 방법

#### 문제상황
- 딸바쥬스의 경우 딸기의 재고와 바나나의 재고를 둘다 확인한 다음, 재고가 있다면 필요한 만큼 재고를 빼는 방식의 로직을 사용하고 있습니다.
- 하지만 딸기는 재고가 충분한데 바나나의 재고가 없다면 딸기는 이미 재고가 업데이트 되었기 때문에 다시 되돌리는 과정이 필요했습니다.

#### 해결방법
- 따라서 `for`문 안에서 두 함수를 동시에 부르는 것이 아닌 첫번째 `for`문에서 검증을 다 마친 뒤, 두 번째 `for`문에서 재고를 업데이트 하는 것으로 해결했습니다.
- 또한 `for`에서 `forEach`로 수정하여 축약 표현($)을 사용했습니다.

⚠️ 수정 전
    
```swift
func useValidStock(juiceRecipe: Recipe) throws {  
    try juiceRecipe.forEach { 
        try validateStock(ingredient: $0) 
        spendStock(of: $0.fruit, by: $0.amount)
    }
}
```

✅ 수정 후
    
```swift
func useValidStock(juiceRecipe: Recipe) throws {
    try juiceRecipe.forEach { try validateStock(ingredient: $0) }
    juiceRecipe.forEach { spendStock(of: $0.fruit, by: $0.amount)}
}
```
        
### 🔥 instantiateViewController 재사용

#### 문제상황
- 스토리보드에서 viewController를 가져오기 위해 instantiateViewController(withIdentifier:) 메소드를 호출합니다.
- 하지만 다운캐스팅과 옵셔널 언래핑을 해줘야하고 여러 곳에서 호출되기 때문에 재사용성에 대해 고민하였습니다.

#### 해결방법
- 프로토콜과 extension을 사용한 기본구현을 통해 "Main" 스토리보드에서 id를 통해 viewController를 가져오는 static function을 구현했습니다.
- 참고자료: 하단 참조

⚠️ 수정 전
    
```swift
@IBAction func tapStockButton(_ sender: UIBarButtonItem) {
    if let StockViewController = self.storyboard?.instantiateViewController(identifier: "StockViewController") {
        self.navigationController?.present(StockViewController, animated: true)
    }
}
```

✅ 수정 후
    
```swift
@IBAction func tapStockButton(_ sender: UIBarButtonItem) {
    let stockViewController = StockViewController.instantiate()
    self.navigationController?.present(stockViewController, animated: true)
}
```

### 🔥 fruitStock 변경 시 MainViewController에서 신호 전달 받는 법

#### 문제상황
- 처음엔 fruitStock이 didSet 될 때 마다 Notification.post하고 MainViewController에서 수신하는 방식을 사용해 view를 업데이트 하였습니다.
- 좋은 방식이긴 하였으나 Delegate 패턴을 적용해보고 싶어 리팩토링을 하였습니다. 당시 Delegate를 사용해야하는 명확한 이유는 없었다는게 오점이였습니다.

#### 해결방법
- JuiceMaker에 FruitStore의 재고를 가져오는 함수가 있고 MainViewController에서 언제 레이블을 업데이트 해야하는지도 명확히 알고 있기 때문에 Delegate, Notification 을 사용하는 것보다 그냥 JuiceMaker의 getStock을 호출하여 view를 업데이트 하였습니다.

### 🔥 매직넘버 리터럴

#### 문제상황
- "맛있게 드세요" 등 문자열을 코드에서 그대로 사용하고 있어 유지보수에 어려움을 느꼈습니다.

#### 해결방법
- Namespace를 사용하여 문자열 추적 관리가 용이해졌습니다.

<br>



<a id="7."></a> 
## 7. 🔗 참고 링크
- [🍎Apple Docs: UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)
- [🍎Apple Docs: Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/#Required-Initializers)
- [📘Blog: Delegate, Notification, KVO 비교 및 장단점 정리](https://you9010.tistory.com/275#:~:text=key%20값으로%20Notification의,정보를%20받을%20수%20없음.)
- [📘Blog: Instantiating View Controllers From a Storyboard](https://cocoacasts.com/mastering-navigation-with-coordinators-instantiating-view-controllers-from-a-storyboard)
- [📘Blog: Instantiate and Present a viewController in Swift](https://stackoverflow.com/questions/24035984/instantiate-and-present-a-viewcontroller-in-swift)

<br>

<a id="8."></a>
## 8. 👥 팀 회고
### 👏🏻 우리팀이 잘한 점
- 코드에 대한 열정으로 배열, 딕셔너리, 튜플을 활용하여 효율적이고 가독성 높은 코드를 짰습니다.
- 서로 코드에 대해 질문하고 대답하면서 같이 성장해 나가는 것이 눈에 보였습니다.
- 코드를 짜는 것에만 집중하는 것이 아니라 팀원 간에 성향을 먼저 맞추고 배려를 먼저 생각하였습니다.
        
### 👊🏻 우리팀 개선할 점
- 처음엔 생각을 설명하는 방법이 미숙해 오해를 했지만 점점 의사소통하는 법에 익숙해지고 있습니다.
- 컨디션 관리에 좀 더 신경을 써야겠다고 생각했습니다🥲

### 💜 서로에게 좋았던 점 피드백
- Dear. Minsup 🦊 
    - 시간 약속을 잘 지킵니다.
    - 코드에 대한 이해가 높아 모르는 부분에 설명을 잘 해 줬습니다.
    - 코드 공부에 대한 열정이 높습니다!
    - 시간 조율이 원활했습니다
    
- Dear. Serena 🐷
    - 시간 약속을 잘 지킵니다.
    - 배움의 의욕이 높고 깨달았을 때 응용력이 좋습니다.
    - 배려와 양보를 잘 해주었습니다.
