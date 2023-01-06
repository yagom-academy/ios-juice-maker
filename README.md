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
* 만약 주스의 재고가 부족하다면 alert에서 재고를 수정하러 이동하거나 alert창을 닫는다
* 재고수정 버튼을 눌러 재고 수정 화면으로 가서 재고를 수정한다.

## 팀원

|⭐️Vetto|⭐️레옹아범|
| :--------: | :--------: |
|<img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="150" height="180">|<img height="180px" src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg">|

### 팀 규칙
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

## 프로젝트 구조
<details>
    <summary><big>순서도</big></summary>
    작성 예정
</details>

## 프로젝트 수행 중 핵심 경험
<details>
    <summary><big>STEP 1</big></summary>

* Swift API Design Guide에 따른 이름짓기
* 소스코드에 불필요한 코드 및 코멘트 남기지 않기
* 메서드의 기능단위 분리
* 요구사항에 따른 타입의 정의
* 타입의 캡슐화/은닉화
* 상황에 알맞은 상수/변수의 올바른 선택

</details>
    
<details>
    <summary><big>STEP 2</big></summary>    

* 내비게이션 바 및 바 버튼 아이템의 활용
* 얼럿 컨트롤러 활용
* Modality의 활용
* 화면 사이의 데이터 공유
    
</details>

## 타임라인

#### STEP 1 [2023.01.02] ~ [2023.01.05]
|날짜|타임라인|
| :-------: | :-------: |
|23.1.2.(월)|Fruit, JuiceMenu등 기본적인 타입 생성 및 FruitStore, JuiceMaker내의 메소드 생성|
|23.1.3.(화)|JuiceMaker내 makeJuice 버그 fix, 메소드와 프로퍼티 은닉화|
|23.1.4.(수)|메소드 이름과 파라미터 argument Label등을 사용하여 읽기 편하게 리팩토링|
|23.1.5.(목)|JuiceMaker내에 do-catch문 수정, FruitStore 이니셜라이저 수정|

#### STEP 2 [2023.01.05] ~ [2023.01.06]

## 트러블슈팅

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

## 참고링크
[Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)  
[Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)  
[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)  
[Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)  
[Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)  
[Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)  
