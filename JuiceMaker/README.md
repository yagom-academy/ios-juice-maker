# iOS 커리어 스타터 캠프
# 🍹 쥬스 메이커 

> 프로젝트 기간: 2022.12.26 ~ 2023.01.13
> 
> 팀원: 👩🏻‍💻[리지](https://github.com/yijiye?tab=repositories), 👨🏻‍💻[kaki](https://github.com/kak1x) | 리뷰어: 👩🏻‍💻[Judy](https://github.com/Judy-999)
>


## 목차
1. [프로젝트 소개](#프로젝트-소개)
2. [타임라인](#타임라인)
3. [폴더구조](#폴더구조)
4. [순서도](#순서도)
5. [실행 화면](#실행-화면)
6. [트러블 슈팅](#트러블-슈팅)
7. [팀회고](#팀회고)
8. [참고 링크](#참고-링크)


# 프로젝트 소개

**STEP1 : 쥬스메이커의 Model 구현** </br>
과일의 종류와 재고를 담당하는 FruitStore와 정해진 레시피에 따라 필요한 과일과 갯수를 확인하여 쥬스를 만드는 JuiceMaker를 구현하는 프로젝트

<br/>

# 타임라인 
- 23.01.02 (월): Fruit 타입 정의 및 FruitStore 기능 추가
- 23.01.03 (화): 쥬스메이커 기능 구현
- 22.01.04 (수): STEP1 에러 처리 구현, 접근 제어 구현 및 컨벤션 수정
- 22.01.05 (목): STEP1 feedback 사항 수정 (함수 기능 수정, 에러 추가, 파라미터명 수정), 초기 재고 값 화면 표시 구현 및 버튼 액션 추가
- 22.01.06 (금): 쥬스 만들기 성공, 실패에 따른 Alert 실행 구현
- 22.01.09 (월): STEP2 기능 구현 완료
- 22.01.10 (화): STEP2 feedback 사항 수정 (함수명 수정, 접근 제어 수정, 싱글톤 패턴 수정), STEP3 오토레이아웃 설정
- 22.01.11 (수): STEP3 IBAction Collection 설정, 딸기 stepper 기능 구현
- 22.01.12 (목): STEP3 기능 구현 완료
- 22.01.13 (금): 추가학습 - delegate 패턴 구현
<br>

# 폴더구조
```
├── Controller
|   ├── AppDelegate
|   ├── SceneDelegate
|   ├── OrderJuiceViewController
├── └── ManageStockViewController
├── Model
|   ├── JuiceMaker
|   ├── FruitStore
|   ├── Fruit
|   ├── JuiceMenu
├── └── JuiceMakerError

```

# 순서도
<details>
    <summary><big>순서도</big></summary>
<img src = "https://user-images.githubusercontent.com/114971172/212245180-e672632c-a3af-4442-8ebc-f88b84627135.png">
    </details>


# 실행 화면
### 1. JuiceMaker 앱 실행 화면

- JuiceMaker 앱 실행 시 초기 재고 10개가 각 과일 아래에 표시됨.

<img src ="https://i.imgur.com/zK9Ynxn.png" width="600">


### 2. 쥬스 주문 버튼 실행

- 쥬스 주문 시 재고가 있다면 해당 쥬스가 성공적으로 만들어졌다는 alert창 실행. 이후 현재 재고 다시 표시.
- 쥬스 주문 시 재고가 부족하다면 재고가 부족하다는 alert창 실행.
  
<img src = "https://user-images.githubusercontent.com/114971172/210932923-06b5dc53-2833-4327-bdc4-b26fe0684091.gif" width="600">
<br>

### 3. 재고 수정 alert 창 예 / 아니오 버튼 실행
- 예 버튼 클릭시 재고수정 화면으로 이동
- 아니오 버튼 클릭시 화면 변화 없음

<img src = "https://user-images.githubusercontent.com/114971172/212245503-9d688023-8ee5-4bb2-97cb-c568b94fd85a.gif" width="600">

### 4. 화면이동
- 재고수정 버튼을 누르면 재고 추가 화면으로 이동
- 닫기 버튼을 누르면 주문 화면으로 이동

<Img src = "https://user-images.githubusercontent.com/114971172/212246436-fd4eae4d-b25b-45f0-9e12-6e7d9d20cf2d.gif" width="600">


### 5. 재고 추가 화면에서 Stepper를 이용한 재고 변경

- stepper의 + 를 누르면 재고가 +1씩 증가하고 - 를 누르면 -1씩 감소하도록 구현

<img src = "https://user-images.githubusercontent.com/114971172/212245970-cc170377-1b33-42ca-b4eb-8eadabe03031.gif" width ="600">

### 6. 주문 화면으로 돌아오면 주문 화면의 재고 업데이트

- 재고를 업데이트하고 닫기를 누르면 주문 화면에서 변경된 재고가 업데이트 되도록 구현

<img src = "https://user-images.githubusercontent.com/114971172/212245976-8b99d1ea-d6cb-4628-9acf-62919ec2f8e6.gif" width ="600">


# 트러블 슈팅 
## **[STEP1]**
### 1. JuiceMaker 실행 로직
  - Dictionary로 선언 후 재고를 비교하여 재고가 없으면 에러를 발생하게 로직을 구성하였는데, 재료가 2개 들어가는 경우 랜덤하게 바뀌는 Dictonary의 순서에 따라 재고가 부족한 과일 먼저 비교하여 정상적으로 작동이 되거나 혹은 재고가 충분한 과일 먼저 비교하여 해당 과일의 재고를 감소시킨 이후 재고가 부족하다는 에러가 발생하는 오류가 발생하였습니다. 

### ⚒️ 해결방법
```swift
struct JuiceMaker {
    let fruitStore = FruitStore()
    var receipe: [Dictionary<Fruit, Int>.Element] = []
    
    mutating func makeJuice(_ juiceMenu: JuiceMenu) -> Bool {
        do {
            try checkCurrentStock(juiceMenu)
            for (fruit, stock) in receipe {
                try fruitStore.subtractStock(of: fruit, amount: stock)
            }
            return true
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
            return false
        } catch JuiceMakerError.fruitError {
            print("과일 선택 오류입니다.")
            return false
        } catch {
            print("알 수 없는 오류가 발생했습니다.")
            return false
        }
    }
    
    mutating func checkCurrentStock(_ juiceMenu: JuiceMenu) throws {
        for fruit in juiceMenu.receipe.keys {
            if fruitStore.fruitStocks[fruit] == 0 {
                throw JuiceMakerError.outOfStock
            } else {
                receipe = juiceMenu.receipe.sorted { $0.1 > $1.1 }
            }
        }
    }
}
```
- 이를 해결하기 위해 필요한 과일의 종류를 먼저 받아서 해당 과일의 재고를 확인한 뒤 0개인 과일이 있으면 에러를 발생하게 처리해주고, 두 과일 모두 재고가 존재할 시 과일의 소모량이 큰 과일 순서대로 재고를 비교할 수 있게 ```checkCurrentStock``` 함수를 추가해주었습니다.
- 소모량이 큰 과일을 순서대로 비교하기 위해  ```juiceMenu.receipe.sorted { $0.1 > $1.1 }``` 와 같이 딕셔너리에 순서를 주는 sorted()와 고차함수를 사용하였습니다.

### 2. do-catch 구문에서 try 사용
- 1번의 문제를 해결하면서 오류처리를 어떻게 해야할지 고민하였습니다. do-catch 구문을 사용할때, do구문에 try를 한번만 사용하는 코드를 주로사용해왔고 try구문을 두번 처리해도 문제가 없는건지 고민하였습니다.

###  ⚒️ 해결방법
```swift
mutating func makeJuice(_ juiceMenu: JuiceMenu) -> Bool {
    do {
        try checkCurrentStock(juiceMenu)
        for (fruit, stock) in receipe {
            try fruitStore.subtractStock(of: fruit, amount: stock)
        }
        return true
    } catch JuiceMakerError.outOfStock {
        print("재고가 부족합니다.")
        return false
    } catch JuiceMakerError.fruitError {
        print("과일 선택 오류입니다.")
        return false
    } catch {
        print("알 수 없는 오류가 발생했습니다.")
        return false
    }
}
```
- 주디에게 질문을 남겼고 주디의 의견은 do-catch 구문에서 try를 두번 사용해도 문제가 없다는 내용이였습니다. 따라서 1번문제에 대한 트러블 슈팅을 하면서 do-catch 구문에 try 를 두번 넣어주도록 오류를 처리하였습니다.


### 3. 초기재고 설정하는 법
- 미션 항목에 초기재고가 10개로 정해져 있었고 이부분을 코드로 표현할때 어떤식으로 표현하면 좋을지 고민했습니다. 10이란 값을 처음부터 입력할지 아니면 ```initialStock```이란 변수를 생성하여 변수를 넣어줄지 고민하였습니다. 

###  ⚒️ 해결방법

수정전 코드
```swift
class FruitStore {
    var fruitStocks: [Fruit: Int] = [:]
    var initialStock: Int = 10
    init() {
        Fruit.allCases.forEach { fruitStocks[$0] = initialStock }
    }

```
수정후 코드
```swift
class FruitStore {
    var fruitStocks: [Fruit: Int] = [:]
    
    init(initialStock: Int = 10) {
        Fruit.allCases.forEach { fruitStocks[$0] = initialStock }
    }
```
- 저희는 두번째 선택으로 값을 입력해주었는데 리뷰어 주디의 리뷰와 학습활동시간에 한 이니셜라이저에 매개변수로 값 지정해주는 방법을 생각하여 아래와 같이 해결하였습니다. 그로인해 이니셜라이저를 사용할때 초기재고 값을 변경할수있도록 구현했습니다.

<br>

## **[STEP2]**

### 1. 화면 전환 방식 선택
- 화면 전환 방식에 어떤 것을 선택할지 고민하였습니다.
- ViewController에서 직접 ViewController로 연결해주는 경우, Navigation Item이 표시되지 않아 어떤 방식으로 접근해야 하는지 고민하였습니다.

### ⚒️ 해결방법
- 스토리보드로 많은 것들이 구현되어 있는 상태였기에 스토리보드에서 사용이 용이한 Segue 방식을 선택하였습니다.
- Segue를 설정한 뒤 segueIdentifier를 이용한 performSegue와 dismiss 메서드를 활용하여 화면 전환을 구현해주었습니다. 
- Segue를 ViewController가 아닌 NavigationController로 설정해주어 문제를 해결하였습니다.

- ```Navigation controlle``` 가 두개로 나눠져 있는 이유에 대해 생각했고 저희가 내린 결론은 ```Navigation controller```는 화면의 흐름을 관리한다는 관점에서 봤을 때, 주문화면과 재고수정화면은 별개의 흐름으로 생각할 수 있었습니다. 현재는 하나의 화면밖에 없지만 만약 재고 수정화면에서 정보의 depth가 생긴다면 주문화면-재고수정화면-(추가화면) 처럼 하나의 흐름으로 이어지는게 부자연스럽다고 생각이 들어 이 둘을 별개로 나누어 접근하는 것이 적절하다고 생각했습니다.

### 2. 같은 액션을 취하는 버튼들을 하나로 합치기
- 각각의 버튼이 비슷한 액션을 취하는데, 이를 별개의 액션으로 설정해주니 비슷한 액션들을 전부 따로 설정해줘야해서 가독성 및 유지보수 측면에서 좋지 않다고 판단되었습니다.


### ⚒️ 해결방법
```swift
private func setButton(_ sender: UIButton) -> JuiceMenu? {
    guard let buttonTitle = sender.titleLabel?.text else {
        return nil
    }
    
    switch buttonTitle {
    case "딸기쥬스 주문":
        return JuiceMenu.strawberryJuice
    case "딸바쥬스 주문":
        return JuiceMenu.strawberryBananaJuice
    case "바나나쥬스 주문":
        return JuiceMenu.bananaJuice
    case "파인애플쥬스 주문":
        return JuiceMenu.pineappleJuice
    case "키위쥬스 주문":
        return JuiceMenu.kiwiJuice
    case "망고쥬스 주문":
        return JuiceMenu.mangoJuice
    case "망키쥬스 주문":
        return JuiceMenu.mangoKiwiJuice
    default:
        return nil
    }
}

private func completeOrder(of orderedJuice: JuiceMenu) {
    do {
        try juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.name)
    } catch JuiceMakerError.outOfStock {
        print(JuiceMakerError.outOfStock.message)
        failAlert()
    } catch JuiceMakerError.fruitError {
        print(JuiceMakerError.fruitError.message)
    } catch {
        print("알 수 없는 오류가 발생했습니다.")
    }
}

@IBAction private func orderButtonTapped(_ sender: UIButton) {
    guard let orderedJuice = setButton(sender) else {
        return
    }
    completeOrder(of: orderedJuice)
}
```
- 버튼의 타이틀을 이용하여 해당하는 버튼이 눌렸을 경우 쥬스 메뉴를 리턴하는 메서드를 정의해주었고 이를 이용해 한 개의 액션에 모든 버튼들을 연결시켜 처리해주었습니다.

### 3. singleton 사용

- 과일 재고는 여러곳에서 사용되기 때문에 singleton으로 하나만 만들어서 공용으로 사용하도록 구현했습니다. 처음엔 ```fruitStore```를 가지고 있는 ```JuiceMaker```를 singleton으로 구현하였으나 ```struct```타입으로 singleton 사용이 적합하지 않다고 생각하였습니다.

### ⚒️ 해결방법

- ```struct```는 값 타입이라 스택에 저장이 되고, 속성이 변하면 새로운 인스턴스가 복사되는 ```Copy On Write```특징이 있습니다. 따라서 하나를 공유한다는 개념의 singleton과는 맞지 않는다고 판단했고, ```fruitStore```를 singleton으로 정의하였습니다.

```swift
final class FruitStore {
    static let sharedFruitStore = FruitStore()
    
    var fruitStocks: [Fruit: Int] = [:]
    
    private init(initialStock: Int = 10) {
        Fruit.allCases.forEach { fruitStocks[$0] = initialStock }
    }
}
```
- ```FruitStore```는 ```class```로 주소값을 복사하기 때문에 주소를 갖는 새로운 변수가 스택에 생성되어도 본래의 인스턴스 주소로 접근하기 때문에 이런 문제가 발생하지 않기에 ```FruitStore```에 singleton 패턴을 적용하였습니다.

# 팀회고

## 아쉬운 점
**[STEP1]**
- 처음부터 로직을 구성할때 발생할 문제점을 미리 생각했더라면 조금 더 가독성 좋은 코드로 구현이 가능했을 것 같아서 아쉽습니다. 이 부분은 프로젝트 진행 중 시간이 남으면 다시 고민해보고 싶습니다.
- collection type에서 Dictionary를 사용했는데, Dictionary 타입의 특징과 개념을 정확히 이해하지 못한 상황에서 코드에 적용하는 부분이 힘들었습니다. 개념이해에 대한 중요성을 한번더 깨닫게 되었습니다.

**[STEP2]**
- Label에 값을 업데이트 해주는 ```updateStockLabel``` 메서드도 IBOutlet Collection을 이용하여 한 번에 정의해줄 수 있을 것 같습니다. 프로젝트 진행 중 시간이 남으면 다시 고민해볼 예정입니다.


## 잘한 점
- 처음 작성한 그라운드룰을 잘 지켰습니다.
- 서로의 의견을 집중해서 들었습니다.
- 미션수행에 앞서 학습해야하는 내용을 의존모둠과 같이 공부하였습니다.

## 개선할 점
- 거듭된 수정으로 인해 코드가 덜 정리된 느낌이라 전체적으로 코드의 가독성을 높이는 법을 다시 고려해보면 좋을 것 같습니다.


## 팀원 서로 칭찬하기
- kaki가 리지에게<br>
    프로젝트 진행 중 막히는 부분이 생기면 여러가지 방법으로 해결할 방법을 고민하는 부분이 많은 도움이 되었습니다! 거듭된 고민에도 해결할 방법을 찾기 힘들때에는 다른 캠퍼들에게 먼저 다가가서 질문하는 자세도 보기 좋았어요🙂 <br>
- 리지가 kaki에게 <br>
앱을 만들어 본적이 없어서 이번 프로젝트 진행에 많은 어려움이 있었는데 카키가 본인이 알고있는 내용 + 공부한 내용을 저에게 아낌없이 나눠주었습니다. 또한 코드작성할때 이해 안되는 부분도 친절히 이해될때까지 설명해주었습니다. 감사합니다!! 👍

# 참고 링크
* [Swift 공식문서](https://www.swift.org/)
* [Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
* [Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
* [UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)
* [Singleton](https://developer.apple.com/documentation/swift/managing-a-shared-resource-using-a-singleton)
