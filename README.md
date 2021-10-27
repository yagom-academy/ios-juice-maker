# Juice Maker 
//

# 페어프로그래밍 규칙
- 커밋 단위: 함수 단위 (=기능 단위)
- 커밋 메세지: 카르마 문법 준수
- 프로젝트를 하다 모르는 부분이나 애매한 부분은 공식문서를 통해 스터디

# MVC 패턴
![](https://i.imgur.com/pNBObJ1.png)

# Step 1

## 주요 함수
+ fillStock : 과일의 초기 재고값을 할당해주는 함수
+ takeOutStock : 과일의 재고를 뺴내 Int 타입으로 반환 해주는 함수
+ decreaseStock : 과일의 재고를 감소시키는 함수
+ increaseStock : 과일의 재고를 증가시키는 함수
+ checkStock : 과일의 현재 재고를 확인하는 함수
+ consumeStock : 쥬스 레시피에 따라 소모되는 과일의 갯수를 과일의 재고에 감소시키는 함수


## 고민했던 부분 & 해결 과정
**1. 각 과일 별로 어떻게 초기 재고를 부여할 지 고민했습니다.**
```swift=
func fillStock(by amount: Int) {
        for fruit in Fruit.allCases {
            stock[fruit] = amount
        }
    }
```
재고를 채워주는 메서드를 FruitStore 클래스 내부에 만들어 준 뒤
```swift=
init(stockAmount: Int) {
    fillStock(by: stockAmount)
}
    
convenience init() {
    self.init(stockAmount: 10)
        
    fillStock(by: 10)
}
```
init과 convenience init을 각각 만들어줘서 재고 값을 입력받을 수도 있고 초기재고 값 '10'으로 시작할 수 있도록 이니셜라이저를 구현하여 해결했습니다. 

<br/>

**2. 주스별 레시피를 어떻게 표현할 지 고민했습니다.**
주스의 종류에 대한 열거형을 만든 뒤, 각 열거형 케이스에 주스의 레시피를 연결해주고 싶었습니다. 
따라서 열거형 내부에 연산 프로퍼티를 생성하여 각 케이스 별로 레시피가 반환될 수 있도록 해줬습니다. 

<br/>

**3. 딕셔너리로 생성된 레시피를 과일과 수량 각각으로 가져와서 재고를 체크할 수 있는 방법에 대해 고민했습니다.**
딕셔너리의 `Key`와 `Value`를 각각 가져오기 위해 튜플을 사용했습니다. 
```swift=
let recipe = juice.recipes
        
for (fruit, amount) in recipe {
    guard try fruitStore.takeOutStock(fruit: fruit) >= amount else {
        throw StockError.notEnoughStock
    }
}
```
<br/>

---
## 개선한 점
**1. 열거형 Juice, Fruit, StockError를 따로 소스파일을 만들어 관리했습니다.**
처음에는 `FruitStore` 내에서 파는 과일은 5가지 종류라고 가정하고 `FruitStore`에서 파는 과일을 `FruitStore.Fruit` 이런 식으로 호출해주는 것이 적합하다고 판단하여 `Fruit`을 nested type으로 설정했습니다.
하지만 다시 생각해보니 `FruitStore`에서는 재고를 관리하는 메서드와 재고를 나타내는 프로퍼티만 있는 것이 `FruitStore` 라는 Type의 기능을 보다 명확히 한다고 판단했습니다.
따라서 `Fruit` 열거형을 분리해주고 따로 파일(Fruit)을 만들어 관리해줬습니다.

<br/>

**2. FruitStore 내에 초기 재고에 해당하는 `initialStock`이란 프로퍼티가 존재했었으나, 이니셜라이저에서 한 번 사용하는 관계로 따로 `fillStock`이란 메서드를 만들어 수정했습니다**

<br/>

## 참고 문서
+ https://swift.org/documentation/api-design-guidelines/
+ https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
+ https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html
+ https://docs.swift.org/swift-book/LanguageGuide/Initialization.html
