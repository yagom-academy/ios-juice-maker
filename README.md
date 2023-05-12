# 쥬스메이커🧃

> 과일의 재고를 관리하고 쥬스를 만드는 앱

</br>

## 목차

1. [팀원](#1.)
2. [순서도](#2.)
3. [타임라인](#3.)
4. [실행 화면(기능 설명)](#4.)
5. [트러블 슈팅](#5.)
6. [참고 링크](#6.)
7. [팀 회고](#7.)

---

</br>

<a id="1."></a>

## 1. 팀원

| [Erick](https://github.com/h-suo) | [JusBug](https://github.com/JusBug) |
| --- | --- |
| <img src="https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" height="150"/> | <Img src="https://github.com/JusBug/ios-juice-maker/assets/109963294/53a73571-41d9-4914-a917-d8ea099be948" width="150"/> |

---

<a id="2."></a>

</br>

## 2. 순서도

<details>
<summary>순서도 없음</summary>

## </details>

</br>

<a id="3."></a>

## 3. 타임라인

### 2023.05.08.(월)

**Fruit Store 및 Juice Maker 구현**

- `Fruit` 구조체 생성
- 재고 변수 및 재고 변경 함수 생성
- `JuiceMaker`  내부에 `FruitStore` 인스턴스 생성 및 `makeJuice()` 생성

### **2023.05.09.(화)**

**개인공부**

### **2023.05.11.(목)**

**리뷰확인 및 코드 수정**

- `Fruit`을 열거형으로 수정 및 `fruitsStock` 딕셔너리 생성
- 과일 재고를 가져오는 `getStock()` 및 `addFruits()`, `useFruits()` 추가
- `Juice` 열거형 생성 및 `Juice` 열거형 내 케이스 별로 재료를 가지고 있는 `ingredients` 프로퍼티 생성

### **2023.05.12.(금)**

- `README` 작성

---

</br>

<a id="4."></a>

## 4. 실행 화면(기능 설명)

**실행 화면 없음**

---

</br>

<a id="5."></a>

## 5. 트러블 슈팅

### 🔥유지보수성과 확장성의 문제

- 초기에 `Fruit`를 name과 stock을 프로퍼티로 가진 구조체로 작성했으나, 추후 과일이 추가되는 경우 타입 수정은 물론 `FruitsStore`의 코드도 수정해야하는 확장성이 떨어지는 코드였습니다.
- 그리고 `Juice`는 타입을 따로 만들지 않고 String을 case 별로 나누는 코드로 작성하였으나, 위와 같이 확장성이 떨어지는 코드였습니다.

<details>
<summary>세부 사항</summary>

### Fruit 구조체

```swift
struct Fruit {
    var name: String
    var stock: Int
}
```
  
### makeJuice 코드

```swift
func makeJuice(_ juice: String) throws {
        
        switch juice {
        case "딸기쥬스":
            guard fruitStore.strawberryStock >= 16 else { throw InputError.stockError }
            let changeNumber = fruitStore.strawberryStock - 16
            try fruitStore.changeStock("딸기", to: changeNumber)
        case "바나나쥬스":
            guard fruitStore.bananaStock >= 2 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.bananaStock - 2
            try fruitStore.changeStock("바나나", to: changeFirstNumber)
        case "키위쥬스":
            guard fruitStore.kiwiStock >= 3 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.kiwiStock - 3
            try fruitStore.changeStock("키위", to: changeFirstNumber)
        case "파인애플쥬스":
            guard fruitStore.pineappleStock >= 2 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.pineappleStock - 2
            try fruitStore.changeStock("파인애플", to: changeFirstNumber)
        case "딸바쥬스":
            guard fruitStore.strawberryStock >= 10 && fruitStore.bananaStock >= 1 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.strawberryStock - 10
            try fruitStore.changeStock("딸기", to: changeFirstNumber)
            let changeSecondNumber = fruitStore.bananaStock - 1
            try fruitStore.changeStock("바나나", to: changeSecondNumber)
        case "망고쥬스":
            guard fruitStore.mangoStock >= 3 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.mangoStock - 3
            try fruitStore.changeStock("망고", to: changeFirstNumber)
        case "망고키위쥬스":
            guard fruitStore.mangoStock >= 2 && fruitStore.kiwiStock >= 1 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.mangoStock - 2
            try fruitStore.changeStock("망고", to: changeFirstNumber)
            let changeSecondNumber = fruitStore.kiwiStock - 1
            try fruitStore.changeStock("키위", to: changeSecondNumber)
        default:
            throw InputError.nameError
        }
    }
```

</details>

### 🧯해결방안

- `Fruit`를 열거형으로 수정하고, 재고는 `FruitsStore`에 `FruitStock` 딕셔너리를 만들어 추후 과일이 추가되어도 `Fruit`타입만 관리해도 되는 코드로 수정하였습니다.
- `Juice`도 열거형으로 만들고 케이스별로 필요한 재료를 반환해주는 있는 `ingredients` 프로퍼티를 만들어 추후 유지보수 관련하여 유용하도록 코드를 수정하였습니다.

<details>
<summary>세부 사항</summary>

### Fruit 코드

```swift
enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}
```
  
### Juice 코드

```swift
enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var ingredients: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
```

</details>

### 🔥에러처리

- throw, do-catch문으로 에러 처리를 할 때 `makeJuice()`가 아닌 `printError()` 내에서 따로 에러를 처리하여, 에러만 출력하는 것 처럼 보이는 문제가 있었습니다.
- 초기 에러타입의 이름이 InputError로 어디서 발생하는 에러인지 인지하기 힘든 네이밍이었습니다.

<details>
<summary>세부 사항</summary>

### printError 코드

```swift
func printError(_ juice: String) {
        do {
            try makeJuice(juice)
        } catch InputError.stockError {
            print("재고가 부족합니다.")
        } catch InputError.nameError {
            print("잘못된 이름입니다.")
        } catch {
            print("알수없는 오류")
        }
    }
```
  
### InputError 코드

```swift
enum InputError: Error {
    case nameError
    case stockError
}
```

</details>

### 🧯해결방안

- do-catch문을 `makeJuice()`내에서 처리하여 쥬스가 만들어질 때 발생하는 에러를 처리하도록 하였습니다.
- 에러 타입을 `JuiceMakerError`로 리네임하고 케이스 별로 이름도 세분화하였습니다. 

<details>
<summary>세부 사항</summary>

### makeJuice 코드

```swift
func makeJuice(_ juice: Juice) {
        do {
            try useIngredient(juice)
        } catch JuiceMakerError.nonExistentFruit {
            print("없는 과일입니다.")
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch JuiceMakerError.nonExistentJuice {
            print("없는 쥬스입니다.")
        } catch {
            print("알수없는 에러: (error.localizedDescription)")
        }
  }
```
  
### JuiceMakerError 코드

```swift
enum JuiceMakerError: Error {
    case nonExistentFruit
    case outOfStock
    case nonExistentJuice
}
```

</details>

---

</br>

<a id="6."></a>

## 6. 참고 링크

- https://developer.apple.com/documentation/swift/caseiterable
- https://developer.apple.com/documentation/swift/dictionary/init(uniquekeyswithvalues:)
- https://hello-developer.tistory.com/67

---

</br>

<a id="7."></a>

## 7. 팀 회고

### 👏🏻 우리팀이 잘한 점

- 

### 👊🏻 우리팀이 개선할 점

- 

</br>

### 💜 서로에게 좋았던 점 피드백

### Dear. Erick

```
- 
```

### Dear. JusBug

```
- 
```

</br>

### :pray: 서로에게 아쉬웠던 점 피드백

### Dear. Erick

```
- 
```

### Dear. JusBug
