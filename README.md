# 🍭🧋🍹JuiceMaker🧃🥛🍬

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

    사용자가 쥬스를 선택하면 과일 재고를 확인하고 쥬스 레시피에 따라 과일 재고를 소진하여 쥬스를 만든다.

<br>

<a id="2."></a>

## 2. 🦊 팀원 🐷

| [Minsup 🦊](https://github.com/agilestarskim) | [Serena 🐷](https://github.com/serena0720) |
| :--------: | :--------: |
| <Img src = "https://avatars.githubusercontent.com/u/79740398?v=4" width="150"/>| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="150"/>|

<br>

<a id="3."></a>

## 3. ⏱️ 타임라인


### ▪️ 2023.05.09
- `FruiteStore` 재고 설정
- `JuiceMaker` 케이스 정의
- `Error` 케이스 정의 및 별도 파일 분리
- `updateStock` 함수 정의
- `checkStock` 함수 정의
- `useValidStock` 함수 정의
- `useValidStock` 함수 속 재고 확인 후 재고 업데이트 가능하게 수정
- `useValidStock` 함수에 반복문 `foreach` 활용하여 반복 코드 제거
- `enum` case `rawValue` 가독성을 위해 계산프로퍼티로 이름 수정

### ▪️ 2023.05.10
- 기본 주석제거
- `JuiceRecipe alias` 명명 
- `Errors` 폴더 생성 및 이름 변경
- enum rawValue대신 계산 프로퍼티를 이용해 name으로 접근

### ▪️ 2023.05.11
- `Error` 접근 지정자 수정
- `Recipe` 타입 별명 수정
- `stock` 관련 `updateStock`, `spendStock` 으로 함수 분리
- `FruitStock` 주입 및 기본값 설정
- 컨벤션 통일


<br>

<a id="4."></a>
## 4. 📊 다이어그램

<br>

<a id="5."></a>
## 5. 📲 실행 화면

<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

### 🔥 다중 역할의 함수 역할 분리

#### 문제상황
- `checkStock` 한가지 함수 안에서 재고 확인과 재고 업데이트 역할 2가지를 역할을 수행하였습니다. 한 함수 안에는 한가지의 역할을 수행해야 한다고 배웠기에 이를 분리해야겠다 생각했습니다.

#### 해경방법
- 재고 확인 함수 `checkStock`과 재고 업데이트 함수 `updateStock`으로 각각의 역할을 분배하였습니다.

    <details>
    <summary>⚠️ 수정 전</summary>
    
    ```swift
    private func updateStock(usedFruit: (fruit: Fruit, amount: Int)) {
    guard let currentAmount = fruitStock[usedFruit.fruit],
                currentAmount < amount else { return }

        fruitStock[usedFruit.fruit] = currentAmount - usedFruit.amount   
    }
    ```
                                      
    </details>
    

    <details>
    <summary>✅ 수정 후</summary>
        
    ```swift
    private func checkStock(usedFruit: (fruit: Fruit, amount: Int)) throws {
        guard let currentAmount = fruitStock[usedFruit.fruit] else {
        throw FruitStoreError.notFoundKey(usedFruit.fruit)
        }

        if currentAmount < usedFruit.amount {
            throw FruitStoreError.notEnoughStock(usedFruit.fruit)
        }
    }

    private func updateStock(usedFruit: (fruit: Fruit, amount: Int)) {
        if let currentAmount = fruitStock[usedFruit.fruit] {
            fruitStock[usedFruit.fruit] = currentAmount - usedFruit.amount
        }
    }
    ```
                                           
    </details>

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
        
    <details>
    <summary>⚠️ 수정 전</summary>
        
    ```swift
    func makeJuice(juice: Juice) {
        switch juice {
        ...
        case .mangoKiwiJuice:
            try fruitStore.checkStock(fruit: .mango, by: 2)
            try fruitStore.checkStock(fruit: .kiwi, by: 1)
            fruitStore.updateStock(fruit: .mango, amount: 2)
            fruitStore.updateStock(fruit: .kiwi, amount: 1)
        }
        ...
    }    
    ```
    </details>
        
        
    <details>
    <summary>✅ 수정 후</summary>
        
    ```swift
    func makeJuice(juice: Juice) {
        do {
            try fruitStore.useValidStock(recipe: juice.recipe)
        } catch {
        
        }
    }    
    ```
        
    </details>

<br>

### 🔥 여러 과일이 필요한 쥬스에서 에러 시 되돌리는 방법

#### 문제상황
- 딸바쥬스의 경우 딸기의 재고와 바나나의 재고를 둘다 확인한 다음, 재고가 있다면 필요한 만큼 재고를 빼는 방식의 로직을 사용하고 있습니다.
- 하지만 딸기는 재고가 충분한데 바나나의 재고가 없다면 딸기는 이미 재고가 업데이트 되었기 때문에 다시 되돌리는 과정이 필요했습니다.

#### 해결방법


- 따라서 `for`문 안에서 두 함수를 동시에 부르는 것이 아닌 첫번째 `for`문에서 검증을 다 마친 뒤, 두 번째 `for`문에서 재고를 업데이트 하는 것으로 해결했습니다.

    <details>
    <summary>⚠️ 수정 전</summary>
    
    ```swift
    func useValidStock(usedFruits: (fruit: Fruit, amount: Int)...) throws {
        for usedFruit in usedFruits {
            try checkStock(usedFruit: usedFruit)
            updateStock(usedFruit: usedFruit)
        }    
    }
    ```
    
    </details>


    <details>
    <summary>✅ 수정 후</summary>
    
    ```swift
    func useValidStock(usedFruits: (fruit: Fruit, amount: Int)...) throws {
        for usedFruit in usedFruits {
            try checkStock(usedFruit: usedFruit)
        }
        for usedFruit in usedFruits {
            updateStock(usedFruit: usedFruit)
        }
    }
    ```
    
    </details>
        
        
### 🔥 enum case 가독성 올리기

#### 문제상황
- `enum`을 활용하여 값을 불러올 때 `enumcase.rawvalue` 와 같이 사용하여 가독성이 떨어진다고 피드백을 받았습니다. 가독성을 올릴 수 있는 방안을 고민하였습니다.

#### 해결방법
- 각 `enum` 별로 계산 프로퍼티를 활용하여 `rawValue`의 이름을 명명하였습니다. `Fruit`에는 `name`, `Juice`에는 `name`과 `recipe`를 정의하였습니다.

    <details>
    <summary>⚠️ 수정 전-Fruit.swift</summary>
    
    ```swift
    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
    }
    ```
    
    </details>
        
    
    <details>
    <summary>✅ 수정 후-Fruit.swift</summary>

    ```swift
    enum Fruit: String {
        case strawberry = "딸기"
        case banana = "바나나"
        case pineapple = "파인애플"
        case kiwi = "키위"
        case mango = "망고"

        var name: String {
            self.rawValue
        }
    }
    
    ```
    </details>
        
        
    <details>
    <summary>⚠️ 수정 전-Juice.swift</summary>
    
    ```swift
    enum Juice {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
    }
    ```
    
    </details>
        
    
    <details>
    <summary>✅ 수정 후-Juice.swift</summary>

    ```swift
    enum Juice: String {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case strawberryBananaJuice = "딸바쥬스"
        case mangoJuice = "망고쥬스"
        case mangoKiwiJuice = "망고키위쥬스"

    var name: String {
        self.rawValue
    }
    
    var recipe: Recipe {
        switch self {
        case .strawberryJuice:
            return [(fruit: .strawberry, amount: 16)]
        case .bananaJuice:
            return [(fruit: .banana, amount: 2)]
        case .kiwiJuice:
            return [(fruit: .kiwi, amount: 3)]
        case .pineappleJuice:
            return [(fruit: .pineapple, amount: 2)]
        case .strawberryBananaJuice:
            return  [(fruit: .strawberry, amount: 10), (fruit: .banana, amount: 1)]
        case .mangoJuice:
            return [(fruit: .mango, amount: 3)]
        case .mangoKiwiJuice:
            return [(fruit: .mango, amount: 2), (fruit: .kiwi, amount: 1)]
            }
        }
    }
    
    ```
    </details>

<br>



<a id="7."></a> 
## 7. 🔗 참고 링크
- [Apple Developer-forEach](https://developer.apple.com/documentation/swiftui/foreach)
- [Apple Developer-struct&class](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
- [Apple Developer-property](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/)
- [Apple Developer-Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)

<br>

<a id="8."></a>
## 8. 👥 팀 회고
### 👏🏻 우리팀이 잘한 점
- 코드에 대한 열정으로 배열, 딕셔너리, 튜플을 활용하여 효율적이고 가독성 높은 코드를 짰습니다.
- 서로 코드에 대해 질문하고 대답하면서 같이 성장해 나가는 것이 눈에 보였습니다.
- 코드를 짜는 것에만 집중하는 것이 아니라 팀원 간에 성향을 먼저 맞추고 배려를 먼저 생각하였습니다.
        
### 👊🏻 우리팀 개선할 점
- 처음엔 생각을 설명하는 방법이 미숙해 오해를 했지만 점점 의사소통하는 법에 익숙해지고 있습니다.

### 💜 서로에게 좋았던 점 피드백
- Dear. Minsup 🦊
    - 코드에 대한 이해가 높아 모르는 부분에 설명을 잘 해 줬습니다.
    - 코드 공부에 대한 열정이 높습니다!
    - 시간 조율이 원활했습니다
    
- Dear. Serena 🐷
    - 시간 약속을 잘 지킵니다.
    - 배움의 의욕이 높고 깨달았을 때 응용력이 좋습니다.
    - 배려와 양보를 잘 해주었습니다.
