# 🤓 협업 규칙

- **Daily SCRUM**
- **시간 약속**
    - 아침: 10시
    - 점심시간: 12시~1시반
    - 저녁 시간: 6시~7시
    - 9시반까지
- **페어 프로그래밍**
    - 커밋 단위로 번갈아 가며 진행
- **커밋**
    - 기능 단위
    - Karma 스타

# 키워드

- Naming
- Struct vs Class
- Nested Type
- 고차함수
- 에러핸들링
- 접근 제어
- 파일 관리
- 화면 전환 방식(Modal, Navigation)
- 뷰 컨트롤러 간의 데이터 공유
- Singleton
- NotificationCenter
- UIAlertController
- UINavigationBar
- UIButton. tag /  UIButton.accessibilityIdentifier
- UIStepper
- ViewController Lifecycle
- Implicitly Unwrapped Optional

# Contributors

@junbangg

@yeahg-dev

# Reviewer

@daheenallwhite

# UML

# 👆 Step 1

## 🤔 고민했던 것 


### 1. `FruitStore`를 **클래스**로 구현할지 **구조체**로 구현할지에 대한 고민을 했다.
- **`JuiceMaker`** 가 하나의 **`FruitStore`** 인스턴스를 소유하고, **`FruitStore`** 의 `inventory` 프로퍼티를 계속해서 수정해야되기 때문에, 값 타입이 아닌 참조 타입을 사용하는 것이 더 적절하다고 생각해서 **`FruitStore`** 는 클래스로 구현했다.
	- 고민을하면서 [Swift에서 제공한 Guideline]([https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes)) 를 참고했는데
        1. **구조체에 저장된 프로퍼티가 값 타입이며 참조되는 것보다 복사되는 것이 합당할 때**
        2. **인스턴스끼리 비교나 복사가 필요 없을때**
        
        위의 두 가지 기준을 근거로 클래스를 선택했다.
        
	- **클래스와 구조체중에서 고민이 될때, 어떤 기준으로 판단을 할지에 대한 팁이 있는지 고민했다.**
<br>

### 2. 딸기, 바나나, 파인애플, 키위, 망고 이외의 추가적인 과일 및 10이 아닌 다른 초기재고 설정에 대한 확장성에 대한 고민을 했다.

- 확정성을 고려 한다면, `FruitStore`를 생성할 때, 과일이름/초기재고에 대한 정보를 `intitailizer` 에 추가하는 방법
	
```swift
init(fruitList: [Fruit], amount: Int) {
	for fruit in fruitList {
    	inventory[fruit] = amount
    }
}
```
- `Fruit`이 담긴 배열과 초기 재고 값 `amount`  `initializer`로 받아서, `inventory` 를 초기화했다.

<br>

### 3. 파일 관리에 대한 고민을 했다. 코드 전체에서 사용 되는 사용자 정의 타입은  전부 따로 파일을 만들어줬다.
- [Swift Style Guide]([https://google.github.io/swift/#source-file-structure](https://google.github.io/swift/#source-file-structure)) 를 참고하여 파일 관리를 했다.
    
    ![Screen Shot 2021-10-20 at 3 49 17 PM](https://user-images.githubusercontent.com/33091784/138044433-4078780b-cc47-4daa-9261-eca17711543a.png)
    
- 해당 글에서 관련된 타입들끼리는 하나의 파일에 정리를 하는 경우도 있다고 명시 되어있는데, 우리가 사용하는 타입들은 전부 연관되어 있어서 고민이 됐다.
- **파일 관리에 대한 기준에 대한 궁금증이 생겼다.**
<br>

### 4. `Error` 열거형이 `ViewController`에서도 사용이 되기때문에, `Error.swift` 파일을 따로 생성 후, 여기서 정의해주었다.
- `Model`과 `Controller` 객체에서 공통으로 사용되는 에러형은 보통 어디에 정의하는지 궁금했다. 
- 이것과 관련한 best practice도 있는지도 호기심이 생겼다.
<br>

### 5. 메서드의 매개변수를 타입으로 묶는 기준에 대한 고민을 했다.
- 선언

```swift
func decreaseStock(of fruit: Fruit, by amount: Int) {
    guard let remainingStock = inventory[fruit] else {
        return
    }
    inventory[fruit] = remainingStock - amount
}
```

- 여기서 `decreaseStock(of ingredient: Ingredient)` 로 바꿔야되는지 고민을 했다.
- 호출

```swift
for ingredient in juice.recipe.ingredients {
     fruitStore.decreaseStock(of: ingredient.fruit, by: ingredient.amount)
}
```

- `fruit` 와 `amount` 를 `Ingredient` 라는 타입으로 정의해서 사용하고있었는데
- 메서드 매개변수에서는 `fruit` 와 `amount` 로 분리해서 사용하고 있어서
- 메서드 매개변수에서도 `Ingredient` 로 묶어서 사용해야될지 고민이 되었다.

첫번째로 고민하고있는 메서드는 `func isAvailable(fruit: Fruit, requiredAmount: Int) -> Bool {` 인데, 

매개변수를 `ingredient: Ingredient` 로 묶어서도 사용할 수 있어서

해당 메서드를 선언할때는 아래와 같고

```swift
 func isAvailable(fruit: Fruit, requiredAmount: Int) -> Bool {
     if let remainingStock = inventory[fruit], remainingStock >= requiredAmount {
         return true
     }
     return false
}
```

호출할때는 아래와 같다

```swift
for ingredient in juiceRecipe.ingredients {
    guard fruitStore.isAvailable(fruit: ingredient.fruit, requiredAmount: ingredient.amount) else {
        return false
    }
}
```

`Ingredient` 라는 타입을 만들었으면, 매개변수에서도 그걸 활용해야되는게 맞겠다는 생각을 했는데

`func isAvailable(_ ingredient: Ingredient)` 로 바꾸는게 나을지 고민이 되었다

그런데 여기서 또 고민되는게, 

만약에 `func isAvailable(_ ingredient: Ingredient)` 로 바꾼다면, 같은 기준을 적용해서

`func decreaseStock(of fruit: Fruit, by amount: Int) {` 를 

`func decreaseStock(of ingredient: Ingredient)` 로 바꿔줘야할것 같은데

`func decreaseStock(of fruit: Fruit, by amount: Int) {` 가 가독성이 조금 더 좋아보여서 고민이 되었다.

**가독성에 따라서 타입을 사용하는 기준을 유연하게 적용해도 되는지, 아니면 하나의 기준으로 두 메서드를 같은 방법으로 통일 시켜야되는지 고민됐다.**
<br>

## 트러블슈팅

### 1. 코드에서 과도들여쓰기를 줄이기 위해서, 고차함수를 사용했다.
- `for` 문 대신에 `filter` 를 사용해서 메서드를 만들었는데, 들여쓰기는 피할 수 있었지만, 가독성이 안좋아지는 문제점이 생겼다.
    
```swift
private func getUnavailableIngredients(of juiceRecipe: JuiceRecipe) -> [Ingredient] {
	let unavailableIngredients = juiceRecipe.ingredients.filter( {(ingredient: Ingredient) -> Bool in
		return fruitStore.isUnavailable(fruit: ingredient.fruit, requiredAmount: ingredient.amount)
    })
    return unavailableIngredients
}
```
    
<br>

## 배운 개념

- **Naming**

Argument label이 생략 가능한 경우:  첫번째 인자가 문법구를 형성할 때

- **Struct vs Class**
    - Struct와 Class중에서 고를때 고민해볼만한 기준들을 배웠다.
- **Nested Type**
    - Nested Type를 사용하는 경우와, 코드에서 어떻게 정리 하는게 좋은지에 대해 배웠다.
- **고차함수(High-order functions)**
    - `filter` 고차함수에 대해 배우고 활용해봤다.
- **에러 핸들링**
    - Error Propagation에 대해서 배웠다. `catch` 가 될때까지 여러개의 메서드를 통해 전달이 된다는 점을 배웠다.
- **접근제어**
    - 은닉화를 위해서 `private` 접근제어를 사용하는 방법에 대해서 배웠다.
- **파일관리**
    - 여러개의 타입을 파일로 어떻게 나누는지에 대해 배웠다. 무작정 파일로 분리하는것 보다, 연관된 타입들끼리 묶는게 가독성이 좋다는 것을 배웠다.
- **Initialization**
    
    property에 rawValue를 지정해줄 때, 정의부에서 rawValue를 지정해주는 것과 initializer에서 할당해주는 방법이 있다. 확장성을 고려했을 때 initializer에서 할당해주는 방법이 더 적절하다는 걸 배웠다.
    
<br>

## PR 후 개선 사항

### 1. `FruitStore`의 `stock`을 관리해주는 `Inventory` 구조체를 Nested Type으로 구현했다.

- 은닉화를 통해  `JuiceMaker` , `FruitStore` 와 `Inventory` 세 타입간의 의존성을 떨어뜨릴 수 있었다.
<br>

### 2. 관련된 타입끼리 파일을 나누면서, 파일구조가 깔끔해지고 가독성도 좋아졌다.

<br>

#  ✌️ Step 2

## 🤔 고민했던 것 
<br>

### 1. 화면간의 데이터를 공유하는 방법 비교

1. **Delegate 패턴**
2. **NotificationCenter**
3. **Singleton 패턴**
<br>

### 2. 동일한 메서드를 호출하는 여러개의 @IBAction을 하나의 @IBAction으로 정의하는 방식

각 과일 쥬스 버튼에 대한 @IBAction이 따로 생성해주었다.
그런데 @IBAction내에서 호출하는 `order`는 동일해서  7개의 메서드를 다 따로 만드는 것이 불필요하다고 판단했다. 여러개의 @IBAction을 하나의 @IBAction메서드로 정의하는데 `sender`의 `tag`속성을 활용해보았다.
스토리보드의 각 버튼에 `tag`를 부여해서, 버튼을 식별할 수 있게 해줬다.
<br>

### 3. switch문을 활용해서 `tag`에 해당하는 과일쥬스를 만드는 `order` 호출

```swift
@IBAction func pressOrderButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            order(juice: .strawberryJuice)
        case 1:
            order(juice: .banannaJuice)
        case 2:
            order(juice: .kiwiJuice)
        case 3:
            order(juice: .pineappleJuice)
        case 4:
            order(juice: .strawberryBanannaJuice)
        case 5:
            order(juice: .mangoJuice)
        case 6:
            order(juice: .mangoKiwiJuice)
        default:
            return
        }
    }

```
<br>

### 4. sender의 tag와 `JuiceMenu.allCases`의 index를 맞춰서 코드를 간소화

 tag에 해당하는 index로 JuiceMenu 케이스를 반환한 다음, `order`의 파라미터로 넣어줬다.

```swift
@IBAction func pressOrderButton(_ sender: UIButton) {
        let juice = JuiceMenu.allCases[sender.tag]
        order(juice: juice)
 }

```

코드는 간소화되었지만, 가독성이 떨어져서 고민이 되었다.

<br>

### 5. 화면 전환 방식: Modality vs Navigation

재고수정 화면으로 전환하는 방식으로 하나의 `NavigationController`를 사용할지, `Modality`를 사용할지 고민을 했다.
우리가 생각한 각 방법의 특징은 아래와 같다.

#### Navigation

- 뷰 컨트롤러 간의 계층구조가 생긴다.
- 재고수정 버튼이 오른쪽 위에 있어서, 아래에서 위로 나타나는 Modal 화면보다, 오른쪽으로 넘어갔다가 왼쪽으로 돌아오는게 현 UI에서는 더 자연스러워 보일 것 같다.

#### Modality

- 여러개의 JuiceMaker가 하나의 FruitStore를 소유한다고 가정했을 때, 둘 사이에는 계층구조가 없으므로 Modal로 이동하는 것이 빠르고, 적절하다.
- **JuiceMaker 에서 재고수정을 하고싶을때 임시적으로 StockManager 화면을 띄워서 빠르게 수정만 하는 사용자 경험 흐름이 적절해 보인다.**
➡️ 쥬스 메이커 앱의 사용자 경험에 자연스러울 것이라 판단해서 선택하고 적용했다.

<br>

#### 6. Extension 배치 위치에 대한 고민

Notification.Name에 대한 Extension을 JuiceMakerViewController.swift 파일의 가장 밑에 배치를 했다.

```swift
extension Notification.Name {
    static let stockChanged = Notification.Name(rawValue: "stockChanged")
}

```

Extension을 보통 어디에 배치를 하는지에 대한 궁금증이 생겼다.
<br>

## 트러블슈팅

## 1.  NavigationController가 AlertController를 중복적으로 띄우는 오류 해결

```swift
 private func order(_ juice: JuiceMenu) {
        do {
            try juiceMaker.make(juice)
        } catch FruitStoreError.deficientStock {
            presentFailAlert()
            return
        } catch {
            presentErrorAlert()
            return
        }
        presentSuccessAlert(of: juice)
    }
```

`catch`문에서 `return`을 해주지 않을 경우,
`juiceMaker.make`가 실패해서 `presentFailAlert( )`을 호출해서 failAlert를 먼저 띄어주게 된다. 그리고 `return`을 하지 않았기 때문에 `presentSuccessAlert(of: juice)`도 자동적으로 호출하게된다. (스택에 아직 인스턴스가 남아있으므로) 즉, 화면에 보이진 않지만 `successAlert`도 모달 뒤쪽에서 띄어주고 있는 상태인 것이다.

따라서 아래와 같은 오류가 발생하게 되는 것!

> ⚠️ JuiceMaker[59468:637345] [Presentation] Attempt to present <UIAlertController: 0x7fb423008c00> on <UINavigationController: 0x7fb42482da00> (from <JuiceMaker.JuiceMakerViewController: 0x7fb421e16e80>) which is already presenting <UIAlertController: 0x7fb425011e00>.
> 
> 
> 

catch문에서 `return` 을 해주어 오류를 수정해주었다.
<br>

## 배운 개념

- **NotificationCenter**

인스턴스의 값이 변경되었을 때 `NotificationCenter`와 `UserInfo`를 이용해서 변경된 정보를 전달하고, `addObserver` 에서 레이블을 업데이트하는 메서드를 호출해주었다.

- **Delegate Pattern**
    - 뷰컨트롤러간의 의존성은 낮춘 상태로 1대1 데이터 공유를 할때 적합한 방법으로, 본 프로젝트에서 사용을 고려했었다.
- **UIAlertController**
    
    `UIAlertController` 와 `UIAlertAction` 으로 사용자 정의 alert를 생성해주었다.
    
- **UIButton.tag**
    - 여러개의 `UIButton` 을 하나의 `@IBAction` 과 연결해서 액션을 취하고싶을때 `tag` 를 사용해서 할 수 있는 방법에 대해서 배웠다.
- **UIButton.accessibilityIdentifier**
    
    `UIButton.tag` 속성을 고유한 식별자로 활용하는 것이 좋은 방법은 아니라는 것을 알게되었다. 대신 `accessibilityIdentifier`  속성을 식별자로 활용할 수 있다.
    
- **화면 전환 방식(Modal, Navigation)**
    - 임시적으로 하나의 화면을 띄우는 `Modal` 과
    - depth 및 뷰간의 계층 구조를 형성하는 `Navigation` 방식을 각각 적용해보면서 비교해봤다.
- **ViewController Lifecycle**
    - 뷰컨트롤러의 생명주기에 대해서 학습을 했고, `Modal` 이 `fullscreen` 인지 아닌지에 따라 생명주기 차이점에 대해서 알게 됐다.
- **Singleton**
    - `Singleton` 을 구현하는 방법, 그리고 프로젝트에서 사용했을때의 장단점에 대해서 학습했다.
- **Implicitly Unwrapped Optional**
    - **forced unwrapping** 과의 차이점을 이해했고, 언제 쓰는것이 적합한지 배울 수 있었다.
<br>

## PR 후 개선 사항

### 1. 동일한 메서드를 호출하는 여러개의 @IBAction을 각각 분리

버튼마다 고유한 식별자를 지정해주어, 하나의 @IBAction에서 switch문으로 처리해주면 코드의 길이가  짧아지는 이점이 있다. 

반면, 각 버튼에 대한 @IBAction을 만들어주는 방법이 

- 각 버튼에 대한 역할을 명확하게 하고
- switch문을 타지않는다는 점

을 고려하면 성능 상 차이는 없을 것으로 판단하여 각 버튼에 대한 @IBAction을 각각 만들었다.
<br>

### 2. **Implicitly Unwrapped Optional** 을 적절히 활용해서, 불필요한 옵셔널 unwrapping을 없앨 수 있었다.

- 뷰컨트롤러가 프로퍼티로 특정 타입을 가져야할때, 옵셔널이 아닌 Implicitly Unwrapped Optional을 활용했다.
- `viewDidLoad()` 에서 값이 무조건 할당이 된다는 보장이 있기 때문에, 불필요한 optional unwrapping을 없앨 수 있었다.

### 3. 프로그램 전역에서 화면에 띄워질 `Alert` 를 관리하는 `AlertManager` 타입을 만들었다.

- 앱 전체에서 공통적으로 사용되는 `Alert`를 `static` 으로 정의 해주어 재사용했다.
- 뷰컨트롤러 파일의 크기도 많이 줄어들었고, `Alert` 관련된 일을 관리하는 것이 수월 해진다는 것을 체감할 수 있었다.
<br>

# Step 3

## 🤔 고민했던 것

### 1. 메서드내 매개변수간 줄바꿈에 대한 기준

```swift
private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleStockChanges), name: Notification.Name.stockChanged, object: nil)
    }
```

`addObserver()` 와 같이 메서드내 매개변수의 인자값이 여러 개 일 경우, 
**인자값의 길이에 상관없이** 매개변수간 줄바꿈에 대한 기준을 통일 해주어야할지에 대한 의문이 생겼다.

<br>

### 2. @IBAction 메서드간 줄바꿈에 대한 일정한 기준이 있는지에 대한 고민
    
```swift
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
         order(.strawberryBananaJuice)
    }
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
         order(.strawberryJuice)
    }
    ...
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
         order(.kiwiJuice)
    }
    @IBAction func orderMangoJuice(_ sender: UIButton) {
         order(.mangoJuice)
    }
    // 여기를 띄워야할지?    
    @IBAction func presentStockManagerViewController(_ sender: Any?) {
        if let storyboard = storyboard {
            let stockManagerViewController = storyboard.instantiateViewController(identifier: "StockManagerViewController") as StockManagerViewController
            stockManagerViewController.juiceMaker = juiceMaker
            present(stockManagerViewController, animated: true, completion: nil)
        }
    }
```
- 줄바꿈을 어떠한 기준으로 나눠도 되는지에 대한 궁금증이 생겼다.
- 우리는 지금까지 가독성을 높이는 차원에서 줄바꿈을 활용해왔는데, 그건 어쩌면 다소 주관적인 기준이 될 수도 있겠다는 생각을 했다.
<br>

### 3. `JuiceMakerViewController` 에서 `StockManagerViewController` 으로 화면 전환을 할때, 데이터를 어떻게 전달할지에 대한 고민
- 우리가 고민했던 최종 방법에는 두 가지가 있었다.

 1. `JuiceMakerViewController` 의 `UILabel` 들에 있는 값들을 `Array` 또는 `Dictionary` 에 담아서 전달을 해서 `StockManagerViewController` 에서 바로 `UILabel` 로 표시를 할지
 2. `JuiceMaker` 인스턴스를 전달을 해서, `JuiceMaker.fruitStore.inventory` 에 있는 값들을 꺼내서 `UILabel` 에 표시를 할지
- `JuiceMakerViewController` 에 있는 `UILabel` 값들을 그대로 `StockManagerViewController` 에 적용시키는것 보다, 모델에서 다시 정보를 가져와서 UI에 적용시키는것이 좋을지에 대한 고민을 했다.
<br>

### 4.  `JuiceMaker`에서 `FruitStore`의 `stock`을 어떻게 꺼내서 사용할지에 대한 고민

```swift
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    func retrieveCurrentFruitStock() -> [Fruit:Int] {
        return fruitStore.retrieveCurrentFruitStock()
    }
}
class FruitStore {
    private var inventory: Inventory
    
    init(fruitList: [Fruit], amount: Int) {
        inventory = Inventory(fruitList: fruitList, amount: amount)
    }
    func retrieveCurrentFruitStock() -> [Fruit:Int] {
        return inventory.retrieveCurrentFruitStock()
    }
}
extension FruitStore {
    private struct Inventory {
        private var stock: [Fruit:Int] = [:]
    func retrieveCurrentFruitStock() -> [Fruit:Int] {
            return stock
        }
 }
```

우리가 `JuiceMaker` , `FruitStore` , `Inventory` 를 만들때, 전부 `private` 를 이용해서 은닉화를 시켰다. 그런데 가장 상위 인스턴스인 `JuiceMaker` 에서, `Inventory` 에 있는 재고 정보를 가져와야할때, 단계별로 인스턴스를 거쳐서 접근을 할지, 아니면 `private` 를 전부 풀어서

```swift
return juiceMaker.fruitStore.inventory.stock
```
이런식으로 정보를 가져와야할지 고민을 했다.

<br>

### 5. `return` 생략해도 되는지에 대한 고민

스위프트에서는 다음과 같은 코드에서 `return` 을 생략할 수 있는것으로 알고있는데,
이럴때 생략하는 것이 가독성 또는 컨벤션에 위배되는 부분이 있는지 궁금했다.

```swift
func retrieveCurrentFruitStock() -> [Fruit:Int] {
    return stock
}
// vs
func retrieveCurrentFruitStock() -> [Fruit:Int] {
    stock
}
```
<br>

### 6. `NavigationBar` 를 갖고있는 모달을 표시할때, `NavigationController` 에 embed 하는게 적절한 방법인지에 대한 고민
- 프로젝트 기본 코드를 제공받았을때, 재고 관리를 하는 화면이 `NavigationController` 에 embed 되어있었다.
- 이렇게되면, 굳이 모달에서 추가적인 뷰간의 계층구조를 만들지않아도 `NavigationController` 에서 기본적으로 제공해주는 `NavigationBar` 가 있어서 UI를 구현하는게 훨씬 편하다는 장점이 있는것 같다.
- 우리는 `NavigationController` 를 제거하고 `NavigationBar` 를 따로 코드로 구현해봤는데, 제대로 했는지도 모르겠고 조금 어려웠다.
- 그런데! **HIG** 에 의하면 모달은 임시적으로 띄우는 화면인데, depth를 갖을 수 있는 `NavigationController` 에 embed 하는게 조금은 모순적이지 않나 라는 생각도 들었다.
- **이것에 대한 best practice가 있는지에 대한 궁금증이 생겼다.**
<br>

### 7. `Alert`의 문자열을 관리하는 더 좋은 방법에 대해 고민 
`쥬스메뉴 나왔습니다`를 표시하는 alert를 만들 때, 버튼에 따라 다른 쥬스메뉴를 표시해주어야 했다. `AlertTitle` 열거형에 쥬스메뉴에 따른 문자열을 지정해주려면 케이스가 너무 많아지는 것 같아, 공통적인 부분인 `나왔습니다`만 열거형에 추가하고 `UIAlertController`의 `title`에서 매개변수로 받은 `juice`를 합치는 방식을 사용했다.

```swift
let successAlert = UIAlertController(title: "\(juice) \(AlertTitle.success)", message: "\(AlertMessage.success)", preferredStyle: .alert)
```
<br>

## 트러블슈팅

### 1. 과도한 들여쓰기를 줄이기위해 `zip` 함수 활용

- `Dictionary` 안에 있는 `key` 와 `value` 를 optional unwrapping 없이 꺼내기 위해, `zip` 을 활용해서 `for` 문으로 `(key, value)` 쌍을 하나씩 접근했다.
1. `Fruit`와 `UILabel`을 매칭시키는 `switch`문이 중복적으로 사용되어 `UILabel` 을 리턴하는 메서드로 분리해주었다. 
<br>

## 배운 개념

- **UIStepper**
    - `UIStepper` 에서 일어나는 변경사항을 `Model` 에 적용시키는 방법
- **standalone Navigation bar**

  `UINavigationController` 를 사용하지 않고 `NavigationBar`를 만들 수 있는 방법을 배웠다.

- **ViewController 간의 인스턴스를 전달하는 방법**
    - A 화면에서 B 화면으로 전환을 할때, B 화면에서 필요한 인스턴스를 전달하는 방법에 대해서 배웠다. 화면을 전환해주는 메서드내에서 전환될 뷰 컨트롤러의 프로퍼티에 직접 할당을 해주었다.
- **UML**
<br>

## PR 후 개선사항
