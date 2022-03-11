# 쥬스메이커 프로젝트 저장소

> 프로젝트 기간 2022.02.21 ~ 2022.03.11 </br>
팀원 : [@Lingo](https://github.com/llingo) [@Taeangel](https://github.com/Taeangel) / 리뷰어 : [@린생](https://github.com/jungseungyeo)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [해결한점](#해결한점)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [해결한점](#해결한점)
- [STEP 3](#step-3)
    + [고민한점](#고민한점)
    + [해결한점](#해결한점)
- [그라운드 룰](#그라운드-룰)
    + [활동 시간](#활동-시간)
    + [코딩 컨벤션](#코딩-컨벤션) 

---
## UML
![스크린샷 2022-03-10 오후 4 43 12](https://user-images.githubusercontent.com/94151993/157613109-c7871bce-e24a-4302-a323-9778fbadae8d.png)

---
## [STEP 1]
### 고민한점

1. `make()` 함수의 에러 처리에서 `catch`로 받을 때 각각의 case를 모두 적어주는 것을 해결할 방법이 있을까? 를 고민했습니다.
2. 왜 `FruitStore` 는 클래스로 되어 있지만 `JuiceMaker`는 구조체로 구현되어 있을까에 대해 고민했습니다. 먼저,  클래스는 참조타입이기 때문에 인스턴스를 복사하지 않고 참조하게 되어 `JuiceMaker` 내에서 동일한 `FruitStore` 인스턴스로 접근할 수 있도록 하기 위해 사용했고 `JuiceMaker` 의 경우 그럴 필요가 없기 때문에 구조체로 정의했다고 생각합니다.
3. `FruitStore`와 `JuiceMaker` 객체의 기능을 구현할 때 재료가 충족하는 지 확인하는 `canMake()` 함수를 어디에다가 구현할 지 고민했고 `FruitStore`은 과일 재고를 관리/변경하는 역할을  `JuiceMaker`는 주스를 제조와 관련된 역할만 수행할 수 있도록 구분하여 `JuiceMaker`에 구현 했습니다.

### 해결한점
1. `catch` 에서 받은 `error` 를 `MakeJuiceError` 타입으로 타입 캐스팅하여 처리했습니다. 타입을 체크할 수 있는 `is` 를 사용하여 개선하는 방법도 고민했지만, 출력하는 부분에도 직접 타입에 접근해야하는 문제가 있기 때문에 `let error`로 받고 `MakeJuiceError` 로 캐스팅하여 `rawValue`를 출력하도록 변경하였습니다.

```swift
// JuiceMaker.swift
// 기존 코드
do {
  for (fruit, amount) in juice.recipe {
    try self.fruitStore.changeNotCheckStock(of: fruit, by: -amount)
  }
} catch MakeJuiceError.outOfStock {
  print(MakeJuiceError.outOfStock.rawValue)
} catch MakeJuiceError.notExistFruit {
  print(MakeJuiceError.notExistFruit.rawValue)
} catch {
  print(error.localizedDescription)
}

// 해결한 코드
do {
  for (fruit, amount) in juice.recipe {
    try self.fruitStore.changeNotCheckStock(of: fruit, by: -amount)
  }
} catch let error as MakeJuiceError {
  print(error.rawValue)
} catch {
  print(error.localizedDescription)
}
```

2. 생성자 내부에서 `stock` 데이터를 추가했었습니다. 하지만, Fruit의 종류가 추가될 때마다 변경해줘야 한다고 생각했고 `CaseIterable` 프로토콜을 채택하여 `allCases` 프로퍼티로 처리하였고 `configureStock()` 함수로 분리하였습니다.

📒 **CaseIterable** 프로토콜이란?

열거형의 모든 case 값들에 대한 타입 프로퍼티 `allCases`으로 배열 컬렉션을 제공하는 프로토콜입니다. 따라서, `allCases` 는 배열 컬렉션`[Fruit]`를 반환하게 됩니다.

```swift
// Fruit.swift
enum Fruit: CaseIterable {
  case strawberry, banana, pineapple, kiwi, mango
}

// FruitStore.swift
// 기존 코드
init() {
    let defaultCount = 10
    
    self.stock = [
      .strawberry: defaultCount,
      .banana: defaultCount,
      .mango: defaultCount,
      .kiwi: defaultCount,
      .pineapple: defaultCount
    ]
  }

// 해결한 코드
private func configureStock() {
    let defaultCount = 10
    
    for fruit in Fruit.allCases {
      stock[fruit] = defaultCount
    }
  }
``` 

---

## [STEP 2]
### 고민한점
- 메인 스토리보드에서 재고관리 하는 부분에 Navigation Controller이 기본으로 설정되어 있는 이유가 궁금했고 이 이유가 Navigation bar를 활용하기 위해서 기본으로 설정되어 있다고 생각했습니다.
- 함수를 연속적으로 사용하도록 구성해서 결합도가 높아지는 것을 해결할 방법에 대해 고민했습니다.
- 화면에 보이는 Stock과 실제 Stock를 연결하는 방법에 대해 궁금했습니다.

### 해결한점
- 화면에 보이는 Stock와 실제 Stock를 `fetchStock`함수로 연결해서 해결했습니다.

- 결합도가 높아지는 문제를 다음과 같이 해결했습니다.
기존의 코드에는 다음가 같은 문제가 있었다고 생각했습니다.
1. 1번 함수가 2번 함수에서 사용하고 2번 함수가  3번 함수에서 연달아 사용하게 되는 문제
2. 하나의 함수가 2가지 역할을 수행하는 문제
3. for 반복문 내부에서 checkStock 를 해주어서  `guard let _ = ...` 와 같이 불필요한 변수를 `_`로 처리하여 가독성이 떨어지는 문제
4. +/- 의 역할을 메소드 주입을 통해 구현한 점

**기존 코드**
```swift
// FruitStore.swift
func checkStock(
    of fruit: Fruit,
    in amount: Int,
    by operation: (Int, Int) -> Int
  ) -> Result<Int, MakeJuiceError> {
  guard let item = self.stock[fruit] else {
    return .failure(.notExistFruit)
  }
  guard operation(item, amount) >= 0 else {
    return .failure(.outOfStock)
  }
  return .success(item)
}
  
func changeStock(of fruit: Fruit, in amount: Int, by operation: (Int, Int) -> Int) {
  guard let item = self.stock[fruit] else {
    return
  }
  self.stock[fruit] = operation(item, amount)
}

// JuiceMaker.swift
private func canMake(_ juice: Juice) -> Bool {
  for (fruit, amount) in juice.recipe {
    guard let _ = try? self.fruitStore.checkStock(of: fruit, in: amount, by: -).get() else {
      return false
    }
  }
  return true
}
  
func make(_ juice: Juice) {
  guard self.canMake(juice) else {
    return
  }
  for (fruit, amount) in juice.recipe {
    self.fruitStore.changeStock(of: fruit, in: amount, by: -)
  }
}
```
기존 코드의 FrutiStore에서 `checkStock()`에는 stock 내부에 해당 과일이 없는 경우와 연산 결과가 재고 개수보다 작거나 같은 지를 확인하는 두가지 기능을 수행하고 있고

`changeStock()`는 주입을 통해 +/- 연산을 수행하는 문제와 stock 내부에 해당 과일이 있는 지도 확인하는 문제가 있었습니다.  

JuiceMaker에서는 FruitStore의 `checkStock()`를 가져다가 재료에 해당하는 과일들의 재고가 충분한지를 `canMake()`를 통해 해줘서 JuiceMaker는 만드는 역할을 하는 객체이지만 체크하는 기능까지 담당하는 문제가 있었습니다.

---

**개선된 코드**
```swift
// FruitStore.swift
func checkStock(of fruits: [Fruit: Int]) -> Bool {
  return fruits.keys
    .filter { self.stock.keys.contains($0) }
    .count == fruits.count
}

func canMake(_ fruits: [Fruit: Int]) -> Bool {
  return self.stock
    .merging(fruits) { $0 - $1 }
    .filter { $0.value < Int.zero }
    .count == Int.zero
}

func consumeStock(of fruits: [Fruit: Int]) {
  self.stock.merge(fruits) { $0 - $1 }
}

// JuiceMaker.swift
func make(_ juice: Juice) -> Result<Juice, MakeJuiceError> {
  let recipe = juice.recipe
  guard self.fruitStore.checkStock(of: recipe) else {
    return .failure(.notExistFruit)
  }
  guard self.fruitStore.canMake(recipe) else {
    return .failure(.outOfStock)
  }
  self.fruitStore.consumeStock(of: recipe)
  return .success(juice)
}
```
개선된 코드에서는 재고가 충분한지를 판단하는 `canMake()`역할을 FruitStore로 옮기고, 

두가지 기능을 수행하던 `checkStock()`는 해당 과일이 내부에 있는 지만 확인하도록 변경했습니다.

`changeStock()`은 `consumeStock()`로 주입을 통한 방식에서 소비한다는 의미를 더 명시할 수 있도록 네이밍을 변경하고 재고에서 개수를 줄여주는 역할만 해야한다고 생각하여 개선했습니다.

---

## [STEP 3]

### 고민한점

1. JuiceViewController에 있는 juiceMaker를 StockViewController에 어떻게 전달할지에 대해 고민했습니다.
2. IBOutlet을 각각 하나씩 선언해줘 사용하기 불편한 것을 어떻게 개선할 지 고민했습니다.
3. LandScape 모드 (가로모드)에서 Modal Page Sheet와 Full Screen 차이에 대해 고민했습니다.
4. StockViewController의 navigationItem과 NavigationController의 navigationItem의 차이에 대해 고민했습니다.

### 해결한점

1. IBOutlet을 각각 선언해줬는데 IBOutlet Collection을 사용해 IBOutlet 배열과 tag를 통해 해결했습니다.
2. UIViewController에 navigationItem 프로퍼티가 있고 StockViewController와 NavigationController는 UIViewController를 상속받고 있기 때문에 각각 navigationItem을 사용할 수 있는 것이고 각각 다른 것을 보게된다는 점을 알게 되었습니다.
3. LandScape 모드 (가로모드)에서 Modal Page Sheet와 Full Screen 차이는 
Page Sheet에서 전체 화면으로 덮어지지만 사실 첫번째 ViewController가 사라지지 않고 두번째 ViewController가 덮여지는 방식이고
Full Screen일때는 첫번째 ViewController가 사라지면서 두번째 ViewController가 나오는 방식이라는 것을 View Life Cycle 출력을 통해 알았습니다.

---
## 그라운드 룰

### 활동시간
변동사항이 있으면 DM을 보내줄 것

#### 1. 세션이 있는 날 (월, 목)
- (세션이 끝나고) 오후 6시 30분 ~ 10시

#### 2. 세션이 없는 날 (화,수,금)
- 오후 1시 ~ 5시
- 오후 6시 30분 ~ 10시

---

### 공식 문서 및 세션 활동, 일정
- 전날 공부한 것을 공유
- 모르는 내용을 서로 묻기
- (공식 문서를 다 숙지할 때까지는) 마이크 음소거 후 공부
- 숙지 완료가 되면 프로젝트 진행

---

### 코딩 컨벤션
#### 1. Swift 코드 스타일
[스타일가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88)

#### 2. 커밋 메시지
#### 2-1. 커밋 Titie 규칙
```
feat: 새로운 기능의 추가
fix: 버그 수정
docs: 문서 수정
style: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
refactor: 코드 리펙토링
test: 테스트 코트, 리펙토링 테스트 코드 추가
chore: 빌드 업무 수정, 패키지 매니저 수정(ex .gitignore 수정 같은 경우)
```

#### 2-2. 커밋 Body 규칙
- 현재 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장
- 문장형으로 끝내지 않기
- subject와 body 사이는 한 줄 띄워 구분하기
- subject line의 글자수는 50자 이내로 제한하기
- subject line의 마지막에 마침표(.) 사용하지 않기
- body는 72자마다 줄 바꾸기
- body는 어떻게 보다 무엇을, 왜 에 맞춰 작성하기
