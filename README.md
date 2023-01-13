# 🧃 JuiceMaker

## 목차
* [소개](#소개)
* [팀원](#팀원)
* [프로젝트 구조](#프로젝트-구조)
* [타임라인](#타임라인)
* [트러블 슈팅](#트러블-슈팅)
* [참고 링크](#참고-링크)
* [2팀 회고](#2팀-회고)

## 소개
### 프로젝트 기간: 23.01.02 ~ 23.01.20
* 각 주스의 현재 재고량을 보여준다.
* 주스 만들기 버튼을 누르면 해당 주스의 재고가 충분히 있다면 완료를 띄워주며 재료를 감소시킨다.
* 만약 주스의 재고가 부족하다면 alert를 띄워주고 '네'를 누를시 재고를 수정하러 이동하거나 '아니오'를 alert창을 닫는다
* 재고수정 버튼을 눌러 재고 수정 화면으로 가서 '+','-'버튼을 눌러 재고량을 수정한다.

## 팀원

|⭐️Vetto|⭐️레옹아범|
| :--------: | :--------: |
|<img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="150" height="180">|<img height="180px" src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg">|

## 프로젝트 구조
<details>
    <summary><big>UML</big></summary>
    1.19.(목) 활동학습 이후 작성 예정
</details>

## 실행화면

#### [**IPhone 14 pro max**]
* 쥬스 제조 성공 및 ```재고수정```버튼 클릭시 화면 이동
![14프로맥스](https://user-images.githubusercontent.com/55453151/212246427-8f4e30d0-75b9-479c-992b-fea1d210f1ba.gif)

#### [**IPhone 12 pro**] 
* 재료가 모자를 경우 Alert창과 예를 누를시 발생하는 화면이동 Action
![12프로](https://user-images.githubusercontent.com/55453151/212246442-83e06bc6-bf82-4c4b-b658-66a1852b8d06.gif)

#### [**IPhone SE 3rd generation**] 
* 재고 수정이 이전화면에 반영되는 내용
![SE3세대](https://user-images.githubusercontent.com/55453151/212246450-017ecc6e-158c-4f09-a944-63d66bd4758d.gif)

> 오토레이아웃을 보여주기 위해 다양한 기종의 실행화면을 넣었습니다.

### 프로젝트 수행 중 핵심 경험
 
<details>
    <summary>STEP 1</summary>

* Swift API Design Guide에 따른 이름짓기
* 소스코드에 불필요한 코드 및 코멘트 남기지 않기
* 메서드의 기능단위 분리
* 요구사항에 따른 타입의 정의
* 타입의 캡슐화/은닉화
* 상황에 알맞은 상수/변수의 올바른 선택

</details>
    
<details>
    <summary>STEP 2</summary>    

* 내비게이션 바 및 바 버튼 아이템의 활용
* 얼럿 컨트롤러 활용
* Modality의 활용
* 화면 사이의 데이터 공유
    
</details>

<details>
    <summary>STEP 3</summary>    

* 내비게이션 바 및 바 버튼 아이템의 활용
* 얼럿 컨트롤러 활용
* Stepper 활용
* Modality의 활용
* 화면 사이의 데이터 공유
* 오토레이아웃 시작하기
    
</details>


## 타임라인

<details>
    <summary>STEP 1 [2023.01.02] ~ [2023.01.05]</summary>    

|날짜|타임라인|
| :-------: | :-------: |
|23.1.2.(월)|Fruit, JuiceMenu등 기본적인 타입 생성 및 FruitStore, JuiceMaker내의 메소드 생성|
|23.1.3.(화)|JuiceMaker내 makeJuice 버그 fix, 메소드와 프로퍼티 은닉화|
|23.1.4.(수)|메소드 이름과 파라미터 argument Label등을 사용하여 읽기 편하게 리팩토링|
|23.1.5.(목)|JuiceMaker내에 do-catch문 수정, FruitStore 이니셜라이저 수정|
    
</details>

<details>
    <summary>STEP 2 [2023.01.05] ~ [2023.01.10]</summary>    

|날짜|타임라인|
| :-------: | :-------: |
|23.1.5.(목)|feat: 과일 개수 초기화 변경, 네비게이션 이동 구현,  decrease, increase Fruit 기본 매개변수 값 추가, Fix: Error, JuiceMaker오류처리 수정|
|23.1.6.(금)|feat: Juice, JuiceMaker, FruitStore 기능추가, updateLabel 함수 구현, Alert메소드 구현, clickButton 함수 구현, alert 화면 이동 구현, 메소드 수정|
|23.1.9.(월)|feat: 메서드 구현, 싱글톤 패턴 구현, chore: 변수명 수정,  파일 헤더 주석 변경, 테스트용 코드 삭제|
|23.1.10.(화)|feat: 은닉화, 접근 제어 수정, refactor: 은닉화 및 final 클래스 변경, refactor: 코드 수정, ViewController 파일명 및 class 명 변경|
    
</details>

<details>
    <summary>STEP 3 [2023.01.11] ~ [2023.01.20]</summary>    

|날짜|타임라인|
| :-------: | :-------: |
|23.1.11.(수)|feat: 함수 메소드 프로퍼티 생성 및 구현, stepper 구현, NavigationBar 수정, touchUpDismissButton 구현, 네비게이션 바 뒤로가기 버튼 삭제, style: 함수 위치 수정, fix: stepper동작 이상 버그 수정|
|23.1.12.(목)|feat: autolayout 설정, 메소드 생성 및 static변수 생성, refactor: STEP2 리뷰 수정, ecideOrderJuice함수 리팩토링, FruitStockViewController내의 IBAction함수명 변경, chore: 분리돼있는 조건문 수정|
|23.1.13.(금)|feat: 데이터전달(delegate) 구현, refactor: singleton에서 delegate로 데이터 공유 방식 변경에 따른 리팩토링, 데이터 전달 객체를 Dictionary컬렉션에서 FruitStore 타입으로 리팩토링|
    
</details>

## 트러블 슈팅

<details open>
    <summary><big>Step1</big></summary>

### 재료가 두개 들어간 쥬스 제조시 두번째 재료가 부족한 경우 첫번째 재료가 소진되는 문제
#### 문제점
```swift
func makeJuice(juice: JuiceMenu) {
    let recipe = juice.recipe

    for (fruit, num) in recipe {
        do {
            try fruitStore.checkFruit(fruit: fruit, number: num)
            fruitStore.decreaseFruit(fruit: fruit, number: num)
         print(fruitStore.fruits)
        } catch FruitStoreError.noExistInventory {
            print("해당 과일 존재하지 않음")
        } catch FruitStoreError.lackedInventory {
            print("\(fruit.name)과일 재고 부족")
        } catch {
            print(error)
        }
```

* 기존 재료가 두개 들어가는 쥬스를 제조시 첫 재료의 재고 확인 후 재료를 사용하고 다음 재료 재고를 확인하여 사용하는 형태로 구성하였음.
* 이럴 경우 딸바쥬스(딸기, 바나나) 제조 시 딸기는 충분하지만 바나나가 부족한 상황에서 딸기는 소모되고 쥬스는 제조되지 않는 현상 발생

#### 해결법
```swift
private func checkFruitInStore(_ juice: Juice) -> Bool {
    for (fruit, num) in juice.recipe {
        do {
            try fruitStore.checkFruit(fruit, by: num)
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    return true
}
```
* checkFruitInStore라는 메소드를 생성하여 여러개의 재료를 받을 경우 두개의 재료가 전부 다 있을 경우 true / 두개 중 하나의 재료라도 없을 시 false를 반환하게 만들어 makeJuice메소드에서 true값일 경우 쥬스를 생성할 수 있게 만들었습니다.

### enum Error
#### 문제점
* 에러가 발생했을 때 do-try-catch문으로 에러처리를 하고 그 catch문 안에서 print문을 사용하였는데 그렇게 하면 새로운 에러가 추가 될 때 출력문을 찾아가야 한다는 단점이 생겼습니다.
```swift
enum FruitStoreError: Error {
    case lackedInventory
    case noExistInventory
}

do {
    try fruitStore.checkFruit(fruit, by: num)
} catch FruitStoreError.noExistInventory {
    print("해당 과일 존재하지 않음")
    if let error = FruitStoreError.noExistInventory.errorDescription {
        print(error)
    }
    return false
} catch FruitStoreError.lackedInventory {
    print("과일 재고 부족")
    if let error = FruitStoreError.lackedInventory.errorDescription {
        print(error)
    }
    return false
} catch {
    print(error)
}
```
    
#### 해결 법
* 리뷰어의 조언대로 Error로 처리하여 출력문을 찾아가는 방식이 아닌 LocalizedError를 사용하여 에러가 발생한 이유를 출력하는 방식으로 코드를 리팩토링 하였습니다.
* 이를 토대로 각각의 case에 해당하는 catch문을 쓰던 방식에서 하나의 catch문만을 사용하여 코드를 작성할 수 있었습니다.
```swift
enum FruitStoreError: LocalizedError {
    case lackedInventory(fruit: Fruit, lackedAmount: Int)
    case noExistInventory
    
    var errorDescription: String? {
        switch self {
        case .lackedInventory(let fruit, let amount):
            return "\(fruit) 과일 \(amount)개 부족"
        case .noExistInventory:
            return "과일 존재하지 않음"
        }
    }
}

do {
    try fruitStore.checkFruit(fruit, by: num)
} catch {
    print(error.localizedDescription)
}
```

### Naming    
#### 문제점
* 클래스 메서드라 생각하여 동사로만 이루어진 짧은 이름의 함수명을 지었습니다. 그러나 다른 코드에서는 동사 + 명사인 함수명이 있었고 통일성이 맞지 않아 코드의 가독성이 좋지 않았습니다.

```swift
func increase(fruit: Fruit, by amount: Int) {
}

func checkFruitInStore(_ juice: Juice) -> Bool {
}
```

#### 해결한점
* 동사와 목적어를 함께 쓰는 함수명으로 전부 통일했으며, 함수 인자의 경우 함수명과 중복되는 점이 있어서 argument Label을 "_"로 만들어 가독성을 높였습니다.
    
```swift
func increaseFruit(_ fruit: Fruit, by amount: Int = 1) {
}
    
func checkFruitInStore(_ juice: Juice) -> Bool {
}
```

</details>

<details open>
    <summary><big>Step2</big></summary>
    
### 화면전환 방법 고민
#### 문제점
* 화면전환 방법은 크게 Modality와 Navigation으로 구현됩니다.
* Navigation은 정보의 깊이에 따라서 구체적인 정보로 갈 때 사용하는게 좋고, Modality는 회원가입과 같이 구체적인 정보로 가지는 않지만 사용자에게 몰입감을 줘야할 때 사용하는게 좋다고 생각합니다.
* 위 두개의 방법 중 쥬스를 만드는 JuiceMakerViewController에서 재고를 수정하는 FruitStockViewController로 어떤 방식으로 이동할지에 대해 고민했습니다.
    
#### 해결법
* JuiceMakerViewController는 쥬스를 만드는 화면뿐만이 아니라 현재 남은 재고를 알려주고 있습니다.
* FruitStockViewController는 현재 남은 재고를 확인은 물론, 수정까지 할 수 있습니다.
* 그렇기 떄문에 JuiceMakerViewController의 구체적인 재고 정보를 FruitStockViewController가 보여준다고 생각하기 때문에 Navigation방법으로 FruitStockViewController로 화면전환 방법을 구현하였습니다.
    
### 긴 Switch문의 코드 리팩토링
#### 문제점
```swift
func decideOrderJuice(_ juice: String) -> Juice? {
    switch juice {
    case "딸바쥬스 주문":
        return .strawberryBananaJuice
    case "딸기쥬스 주문":
        return .strawberryJuice
    case "바나나쥬스 주문":
        return .bananaJuice
    case "파인애플쥬스 주문":
        return .pineappleJuice
    case "망키쥬스 주문":
        return .mangoKiwiJuice
    case "키위쥬스 주문":
        return .kiwiJuice
    case "망고쥬스 주문":
        return .mangoJuice
    default:
        return nil
    }
}  
```
* 해당 긴 Switch문은 버튼을 눌렀을 경우 해당 버튼이 어떤 쥬스를 만들어야하는지에 대해 반환해주는 메소드입니다.
* 해당 메소드는 모든 쥬스에 관한 case를 담고 있고 이것은 이후 쥬스의 개수가 늘어날 경우 추가적으로 case문을 더 작성하여야하기 때문에 확장성면에서 좋지 않은 메소드입니다.
    
#### 해결법
```swift
enum Juice: CaseIterable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice

    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        }
    }
}
    
private func decideOrderJuice(_ juice: String) -> Juice? {
    return Juice.allCases.first { juice == "\($0.name) 주문" }
}
```
* 리뷰어의 조언을 토대로 Juice의 열거형 타입에 CaseIterable프로토콜을 채택하여 모든 case에 접근을 할 수 있도록 구현하였습니다.
* 이를 토대로 Juice의 케이스 중 해당하는 쥬스의 "이름 + 주문"이 button의 titleLabel과 같다면 해당 Juice의 타입을 반환토록 짧게 구성하였습니다.
    
</details>

<details open>
    <summary><big>Step3</big></summary>
    
### 화면 간 데이터 이동
#### 문제점
* 기존 싱글톤을 통해서 하나의 인스턴스로 각 화면간의 데이터를 공유하는 형태로 진행을 했습니다.
* 싱글톤의 단점 중 하나인 의존성이 높아진다로 인해 싱글톤 방식의 구현이 아닌 Delegate방식으로 구현하였습니다.
* Delegate로 화면 간 양방향 데이터 이동을 구현하였지만, FruitStockViewController에서 JuiceMakerViewController로 Delegate방식은 괜찮지만, JuiceMakerViewController에서 FruitStockViewController로 데이터 이동을 Delegate로 할 시 또 각각의 결합도가 높아지는 문제가 있었습니다.
    
#### 해결법
##### FruitStockViewController
```swift
func setFruits(_ fruits: FruitStore) {
    self.fruitStore = fruits
} 
```
##### JuiceMakerViewController
```swift
private func pushFruitStockViewController() {
    guard let fruitStockViewController = self.storyboard?
            .instantiateViewController(withIdentifier: FruitStockViewController.identifier) as? FruitStockViewController else { return }
        
    fruitStockViewController.setFruits(juiceMaker.getFruitStore())
        
    self.navigationController?.pushViewController(fruitStockViewController, animated: true)
}
```
* pushViewController을 할 때 다음 뷰 컨트롤러의 인스턴스를 생성하는데 여기서 setFruits메소드를 실행시켜서 데이터를 전달 할 수 있게 만들었습니다.


### Stepper 작동 오류
#### 문제점
* 처음에 코드를 짤 때 저장되어있는 과일량보다 stepper의 value가 높아지면 저장되어있는 fruit의 개수를 늘려주고 아니면 fruit의 개수를 내려주는 식으로 코드를 구현했다. 하지만 이렇게 코드를 작성 할 경우 stepper의 밸류와 fruit의 개수가 0으로 동일할때 fruit의 개수가 마이너스 값으로 바뀌는 오류가 있었다.
    
#### 해결법
* else 문 대신에 else if문으로 작을때를 조건에 걸어주면 value와 fruit의 개수가 같아지더라도 아무 변화가 일어나지 않고 오류가 발생하지 않는다.

수정 전
```swift
if Int(sender.value) > currentStock {
    fruitStore.increaseFruit(fruit)
} else {
    fruitStore.decreaseFruit(fruit)
}
```
수정 후
```swift
if Int(sender.value) > currentStock {
    fruitStore.increaseFruit(fruit)
} else if Int(sender.value) < currentStock {
    fruitStore.decreaseFruit(fruit)
}
```
                                              
</details>

## 팀 규칙
#### 코드 컨벤션
* 짝 프로그래밍
* commit단위는 기능
* 순번이 돌 때마다, 회의가 필요한 경우 회의(20~30분)
* 함수명은 상의하여 정하기

#### Commit 컨벤션
* feat : 기능 구현, 수정
* docs : 문서 추가, 수정
* refactor : 변수 네이밍 수정
* fix : 사용자가 사용하는 부분에서 bug 수정
* style : 코드의 형식 수정 (ex. 세미콜론 추가 등)
* chore : 별로 중요하지 않은 사항

```git
<type>(제목)

<body>(본문)

<footer>

예시
fix: 열거형 추가

묵찌빠 열거형, 가위바위보 열거형 추가

fix
```

## 참고 링크
[Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)  
[Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)  
[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)  
[Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)  
[Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)  
[Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)  
[delegate - Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uiapplication/1622936-delegate)
[managing-a-shared-resource-using-a-singleton](https://developer.apple.com/documentation/swift/managing-a-shared-resource-using-a-singleton)
