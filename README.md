# 🧃Juice Maker

## 📚목차
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
### **Step01**
* **Model 구현**

    - **FruitStore class**
      딸기, 바나나, 파인애플, 키위, 망고 5종류의 과일 재고를 관리하기 위한 클래스 정의
      <br/>
      > * 각 과일의 초기 재고: 10개
      > * 각 과일의 수량 n개를 변경하는 메서드
      > * 각 과일의 재고를 확인하는 메서드
    - **JuiceMaker struct**
      FruitStore의 과일을 사용해 과일쥬스를 제조하는 구조체 정의
      <br/>
      > * 각 쥬스 별 들어가는 과일의 개수를 기록하는 Nested Type Juice 열거체
      > * 쥬스를 만드는 make 메서드 


<br/>

## 2. 팀원


| 송준 | Rowan |
| -------- | -------- | 
|   <Img src = "https://i.imgur.com/9Bd6NIT.png" width="200" height="200"/>  |  <Img src = "https://i.imgur.com/NP7PZ6m.png" width="200" height="200"/> |
| <center>Driver, Navigator</center>  | <center>Driver, Navigator</center>     |



</br>

## 3. 타임라인
**프로젝트 진행 기간** 
- **23.01.02 (월) ~ 23.01.20 (금)** 

>23.01.02 (월) : 참고자료 읽기, Model 기본 객체 및 메서드 정의 
23.01.03 (화) : 변수명 / 함수 리팩토링, PR 보내기
23.01.04 (수) : PR 피드백을 통한 코드 리팩토링
23.01.05 (목) : STEP 1. 머지 / STEP 2. 사전학습
23.01.06 (금) : STEP 2. 진행 (뷰컨트롤러 정의, 화면전환 구현)

<br/>

## 4. 프로젝트 구조
~~2주차 추가 예정~~
<br/>

## 5. 실행 화면(기능 설명)
~~2주차 추가 예정~~
<br/>

## 6. 트러블 슈팅
### 과일 재고 표현 및 초기값 할당
- 3단계에 걸쳐 과일 재고를 표현하는 방법을 개선하였습니다.
#### 1. 과일 클래스를 인스턴스화해서 과일/개수 할당
- 재고 변경 시, 각각의 과일 인스턴스를 참조하는 방법이 까다로웠습니다. 빈 배열을 하나 만들어서 각각의 과일 인스턴스들을 배열에 넣어주었고 재고 변경을 원하는 과일을 찾을 수 있도록 findFruit 메서드를 추가로 정의하였습니다.

```swift
class FruitStore {
    class Fruit {
        let name: String
        let stock = 10
        
        init(name: String) {
            self.name = name
        }
    }

    let strawberry = Fruit(name: "딸기")
    let banana = Fruit(name: "바나나")
    let kiwi = Fruit(name: "키위")
    let pineapple = Fruit(name: "파인애플")
    let mango = Fruit(name: "망고")

    func makeFruitsList() -> [Fruit] {
        let fruitsList = [self.strawberry, self.banana, self.kiwi, self.pineapple, self.mango]
        return fruitsList
    }

    func findFruit(fruitName: String) -> Fruit? {
        for i in 0..<makeFruitsList().count {
            if makeFruitsList()[i].name == fruitName {
                return makeFruitsList()[i]
            }
        }
    }
}
```
<br/>

#### 2. Dictionary[String: Int]로 과일/개수 할당
- 과일 클래스 인스턴스를 메서드를 통해 Array에 담아주는 방법이 불편하고, 과일 인스턴스 프로퍼티에 재고를 할당하여 재고관리에 어려움을 느꼈습니다.
- 좀 더 간결한 표현과 재고 접근의 용이성을 위해 Array에서 Dictionary로 재고 표현 방법을 변경하였습니다.
```swift
class FruitStore {
    var fruitsStock = ["딸기":10, "망고":10, "바나나":10, "키위":10, "파인애플":10]

    func subtractInventory(fruit: String, number: Int) throws {
        guard let selectedStock = self.fruitsStock[fruit],
              selectedStock - number >= 0 else {
            throw StockError.outOfStock
        }
        
        fruitsStock[fruit] = selectedStock - number
    }
    
    func addInventory(fruit: String, number: Int) {
        if let selectedStock = self.fruitsStock[fruit] {
            fruitsStock[fruit] = selectedStock + number
        }
    }
    
    func checkStock(fruit: String) {
            let resultMessage = "\(fruit)의 재고는 \(fruitsStock[fruit])개입니다."
}
```
<br/>

#### 3. Dictionary[Fruits: Int]로 과일/개수 할당
- Dictionary Key값이 String일 경우 Key값의 범위가 너무 넓어 명시적이지 않습니다.
- 열거형 타입으로 Key값의 범위를 한정하여 가독성과 타입의 명시성을 높였습니다.

```swift
enum Fruits: CaseIterable {
    case strawberry
    case mango
    case pineapple
    case kiwi
    case banana
}

var fruitsStock = [Fruits: Int]()
    
    func fillFruitsStock() {
        for fruit in Fruits.allCases {
            fruitsStock[fruit] = 10
        }
    }
    
    init() {
        self.fillFruitsStock()
    }
}
```
<br/>

## 7. 참고 링크
- [Nested Type - Swift Language Guide](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Properties; Computed Property - Swift Language Guide](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
<br/>

## 8. 아쉬운 점


