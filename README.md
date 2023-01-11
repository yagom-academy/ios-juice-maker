

# Juice Maker🧃

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)
8. [아쉬운점](#8-아쉬운-점)

<br/>

## 1. 소개
가지고 있는 과일들을 사용하여 과일 쥬스를 만드는 어플리케이션입니다. 만들 수 있는 쥬스는 딸기쥬스, 바나나쥬스, 키위쥬스, 파인애플 쥬스, 망고 쥬스, 망고 키위 쥬스입니다. 딸기쥬스는 딸기 16개, 바나나쥬스는 바나나 2개, 키위쥬스는 키위 3개, 파인애플 쥬스는 파인애플 2개, 딸바쥬스는 딸기 10개와 바나나 1개, 망고쥬스는 망고 3개, 망고키위 쥬스는 망고 2개와 키위 1개를 소모합니다. 가지고 있는 과일은 딸기, 바나나, 키위, 파인애플, 망고이며 각 과일들의 재고는 10개입니다. 

<추후 나머지 step에서 수정할 예정>

<br/>

## 2. 팀원
> [팀 회고](https://)

|⭐️Rhode|⭐️Christy|
| :--------: | :--------: |
|<img height="180px" src="https://i.imgur.com/XyDwGwe.jpg">|<img height="180px" src="https://i.imgur.com/kHLXeMG.png">|



</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.01.02 (월) ~ 23.01.20 (금)** 

|날짜|타임라인|
| :-------: | :-------: |
|23.01.02 (월)|참고 공식 문서 학습|
|23.01.03 (화)|FruitStore, JuiceMaker, ErrorMessage 작성|
|23.01.04 (수)|1차 리팩토링, STEP1 1차 PR|
|23.01.05 (목)|2차 리팩토링, STEP1 2차 PR|
|23.01.06 (금)|3차 리팩토링, 공식 문서 학습|
|23.01.09 (월)|진행 예정|
|23.01.10 (화)|진행 예정|
|23.01.11 (수)|진행 예정|
|23.01.12 (목)|진행 예정|
|23.01.13 (금)|진행 예정|

<br/>

## 4. 프로젝트 구조
### 순서도
추후 나머지 step에서 추가할 예정

<br/>

## 5. 실행 화면(기능 설명)
추후 나머지 step에서 추가할 예정


</br>

## 6. 트러블 슈팅
### 1. 동일한 코드가 반복되는 문제
```swift
    func useFruit(juice: Recipe) throws {
        let recipe = Recipe.selectRecipe(recipe: juice)
        for (key, value) in recipe {
            guard let stock = fruitStock[key] else {
                throw JuiceMakerError.invalidFruit
            }
            let amount = value
            let newStock = stock - amount
            fruitStock[key] = newStock
        }
    }
    
    func isStocked(juice: Recipe) -> Bool {
        var isAvailable = true
        let recipe = Recipe.selectRecipe(recipe: juice)
        for (key, value) in recipe {
            guard let stock = fruitStock[key] else {
                return false
            }
            let amount = value
            let newStock = stock - amount
            if newStock < 0 {
                isAvailable = false
            }
        }
        return isAvailable
    }
```
해당 코드의 for문 부분을 isStocked로 남기고, isStocked에서 success와 failure로 구분해 재고를 반환하는 방법을 선택했습니다.
```swift
func isStocked(juice: Juice) -> Result<[(fruit: Fruit, stock: Int)], JuiceMakerError> {
        let juice = juice.selectRecipe
        var fruitList: [(Fruit, Int)] = []
        for (fruit, amount) in juice {
            guard let stock = fruitStock[fruit] else {
                return .failure(JuiceMakerError.invalidFruit)
            }
            let newStock = stock - amount
            fruitList.append((fruit, newStock))
            if newStock < 0 {
                return .failure(JuiceMakerError.outOfStock)
            }
        }
        return .success(fruitList)
    }
```
이런 방법을 통해서 재고가 있을 경우에는 재고에 대한 정보를 useFruit에서 받아와서 처리해주는 방향으로 해결하였습니다.

<br/>

### 2. 딕셔너리를 사용해 for문을 돌리는 방법
```swift
static func selectRecipe(recipe: Recipe) -> [FruitType:Int] {
        switch recipe {
        case .딸기쥬스:
            return [.딸기: 16]
        case .바나나쥬스:
            return [.바나나: 2]
        case .키위쥬스:
            return [.키위: 3]
        case .파인애플쥬스:
            return [.파인애플: 2]
        case .딸바쥬스:
            return [.딸기: 10, .바나나: 1]
        case .망고쥬스:
            return [.망고: 3]
        case .망고키위쥬스:
            return [.망고: 2, .키위: 1]
        }
    }
```
위와 같은 딕셔너리를 통해 레시피를 관리하고 있는데요. 초기에는 이를 사용할 방법을 잘 찾지 못했습니다. 코드를 짤 초기에는 
```swift
    case .딸기쥬스:
        return ["딸기": 16]
```
이와 같은 형태를 가지고 있었고, 각각의 케이스에 서브스크립트를 사용하여 접근하고자 했습니다. 그래서 그 과정에서 서브스크립트를 잘 사용하기 위해서 key값도 ```.딸기```와 같이 enum을 적용해서 바꾸어 주었습니다. 그렇지만, 서브크립트를 사용하려니 여러차례 옵셔널 바인딩을 해야했습니다. 그래서 다른 방법을 찾아보았고 [이 게시물](https://jellysong.tistory.com/91)을 보고 key와 value에 접근하여 for문을 돌리는 방법을 알게 되었습니다. 그리고 현재의 ```for (key, value) in recipe``` 코드로는 꼭 ```.딸기```와 같이 enum을 적용해서 써줄 필요는 없는 것 같습니다. 그렇지만, String을 사용하는 것보다 enum을 적용해서 작성해주는 것이 조금 더 간결해보이기 때문에 그렇게 유지하고 있습니다.

<br/>

### 3. 튜플 사용시 라벨이 사용 되지 않는 문제
```swift
func useFruit(juice: Juice) -> [Fruit: Int]? {
        let fruitRemainder = isStocked(juice: juice)
        switch fruitRemainder {
        case .success(let remainder):
            for fruit in remainder {
                fruitStock[fruit.0] = fruit.1
            }
            return fruitStock
        case .failure(let error):
            print(error.rawValue)
            return nil
        }
    }
```
쥬스를 제작하고 남은 재고를 `fruitstock[fruit.0] = fruit.1`에서 `fruit.0`대신 `fruit.name`등으로 받아오고 싶었습니다.

```swift
func isStocked(juice: Juice) -> Result<[(Fruit, Int)], JuiceMakerError> {
        let juice = juice.selectRecipe
        var fruitList: [(fruit: Fruit, stock: Int)] = []
        for (fruit, amount) in juice {
            guard let stock = fruitStock[fruit] else {
                return .failure(JuiceMakerError.invalidFruit)
            }
            let newStock = stock - amount
            fruitList.append((fruit: fruit, stock: newStock))
            if newStock < 0 {
                return .failure(JuiceMakerError.outOfStock)
            }
        }
        return .success(fruitList)
    }
```
그래서 위와 같이 코드를 고쳤는데 전혀 반영이 되지 않았습니다. 그러다가 중요한 것은 반환타입이라는 것을 깨달았습니다.
```swift
func isStocked(juice: Juice) -> Result<[(fruit: Fruit, stock: Int)], JuiceMakerError> {
        let juice = juice.selectRecipe
        var fruitList: [(Fruit, Int)] = []
        for (fruit, amount) in juice {
            guard let stock = fruitStock[fruit] else {
                return .failure(JuiceMakerError.invalidFruit)
            }
            let newStock = stock - amount
            fruitList.append((fruit, newStock))
            if newStock < 0 {
                return .failure(JuiceMakerError.outOfStock)
            }
        }
        return .success(fruitList)
    }
```
이렇게 Result안의 배열 안의 튜플에 라벨을 달아줘야합니다.

```swift
for fruit in remainder {
                fruitStock[fruit.fruit] = fruit.stock
            }
```
그 결과 이렇게 fruit과 stock이라는 라벨을 사용해서 값에 접근할 수 있게 되었습니다.

<br/>

## 7. 참고 링크
> - [Swift 공식문서 - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
> - [Swift 공식문서 - Enumeration](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
> - [Swift 공식문서 - Structures and Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
> - [[Swift] Collection Type - 딕셔너리(Dictionary), 반복문, key/value 기반 정렬](https://jellysong.tistory.com/91)

<br/>

## 8. 아쉬운 점
* nil을 통해 무언가가 되지 않는 경우에 대한 정보를 전달하고 있다는 점이 아쉬웠습니다: 근본적으로 nil반환이 나쁜 것은 아니지만, 사용자가 경고해야할 일이 있는 경우 error를 반환하는게 좋다고 합니다. 그래서 추후에 step02, 03을 진행하면서 리팩토링 할 생각입니다.
