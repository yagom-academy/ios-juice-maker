# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소
프로젝트 기간 2022.04.25 ~ 2022.05.13 </br>
팀원: bonf, bradheo65, ZZBAE</br>
리뷰어: GREEN

---

## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

---
## 주차 별 학습

Step 01
> 04.25 (월) - 순서도, UML, GroundRolue 작성</br>
> 04.26 (화) - 열거형 CaseIterable 프로토콜 사용, 에러 처리 사용</br>
> 04.27 (수) - Step1 PR 작성</br>
> 04.28 (목) - reNaming, 리뷰 토대로 수정</br>
---

## PR
> Step01: https://github.com/yagom-academy/ios-juice-maker/pull/223

---
## 키워드
> #CaseIterable #defaultError #try-catch

---
## 순서도
![unknown](https://user-images.githubusercontent.com/98302604/165425608-3a918bc5-32e5-4f12-b551-302fe8529ff9.png)


---
## UML
![](https://i.imgur.com/EQEdVL3.png)


---

## [STEP 1]

### 이번 스텝 수행 중 핵심 경험 체크
- [x] Swift API Design Guide에 따른 이름짓기
- [x] 소스코드에 불필요한 코드 및 코멘트 남기지 않기
- [x] 메서드의 기능단위 분리
- [x] 요구사항에 따른 타입의 정의
- [x] 타입의 캡슐화/은닉화
- [x] 상황에 알맞은 상수/변수의 올바른 선택

---
 
### 구현 내용
> 각 과일별 재고 초기값 수량 선정, 쥬스 선택 시 과일별 재고에서 해당 쥬스를 만드는데 필요한 재료와 수량만큼 소모되는 기능, 과일 재고가 부족할 시 에러 처리를 해주는 기능.

---
**파일 : Fruit**
- enum Fruit = 과일 종류를 관리하는 타입
```swift
enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}
//열거형을 이용해 다섯가지 과일 나열
```

---
**파일 : FruitStore**
 - class FruitStore = 저장고에 남은 과일 개수를 관리해주는 타입
     - func chooseRecipe: 선택된 과일 쥬스에 대한 레시피 확인 후 에러 처리 해주는 메서드
     - private func checkFruitStock: 과일 재고에 대해 확인하는 메서드
     - private func useStock: 과일 재고에 있는 것으로 쥬스 재료를 소모하는 메서드
```swift
class FruitStore {
    
    var stocks: [Fruit: Int] = [:]
    
    init(defaultFruitStock: Int) {
        Fruit.allCases.forEach { stocks[$0] = defaultFruitStock }
    }

    func chooseRecipe(order: Juice) throws {
        for fruit in order.recipeOfJuice.keys {
            try checkFruitStock(juice: order, fruits: fruit)
        }
    }

 private func checkFruitStock(juice: Juice, fruits: Fruit) throws {
        guard let stockFruit = stocks[fruits],
              let needFruitAmount = juice.recipeOfJuice[fruits],
              stockFruit >= needFruitAmount else {
            throw StockError.outOfStock
        }
        useStock(juice: juice, fruits: fruits)
    }
    private func useStock(juice: Juice, fruits: Fruit) {
        if let stockFruit = stocks[fruits],
           let requiredFruit = juice.recipeOfJuice[fruits] {
            stocks.updateValue(stockFruit - requiredFruit, forKey: fruits)
        }
    }
} 
```
---
**파일 : Juice**
- enum Juice: 쥬스 메뉴를 관리하는 타입
    - var recipeOfJuice: 쥬스 제조 시 필요한 과일을 딕셔너리로 관리
``` swift
enum Juice: CaseIterable {
    case strawberry
    case banana
    case strawberryBanana
    case mango
    case mangoKiwi
    case kiwi
    case pineapple
//열거형을 이용해 7가지 쥬스 종류 나열
    
    var recipeOfJuice: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        }
    }
}
//enum은 class와 struct처럼 method와 property를 선언할 수 있다. switch-case문을 이용해서 모든 과일에 대한 값(재료 개수)을 빠짐없이 설정할 수 있다.
```
---
**파일 : JuiceMaker**
 - struct JuiceMaker = 주스를 만들어주는 타입
     - fruitStore: FruitStore에 저장되는 과일 개수의 초기값을 설정해준다.
     - func makeJuice: 쥬스를 만드는 함수를 실행시키고, 오류 발생 시 처리해주는 함수
``` swift
struct JuiceMaker {
    let fruitStore = FruitStore(defaultFruitStock: 10)
    
    func makeJuice(of juice: Juice){
        do {
            try fruitStore.chooseRecipe(order: juice)
        } catch StockError.outOfStock {
            print("재고부족")
        } catch {
            print(error)
        }
    }
}
```
---
**파일 : Error**
- enum StockError: 재고 에러를 관리하는 타입
```swift
enum StockError: Error {
    case outOfStock
}
//과일에 재료가 부족할 때 에러!
```

---

### 고민한 점/해결한 점

> **1) 열거형 프로토콜**
>
>- **고민한점**: 과일 재고의 초기값을 설정하기 위해 처음에 딕셔너리 형태로 하드코딩을 진행보았지만 다시 생각해보니 이미 열거형을 사용해서 초기값을 넣어준다면 유지보수하기도 편하기 때문에 어떻게 구현을 하면 될지 고민해보았습니다.
>
>- **해결한점**: Fruits라는 열거형에 CaseIterable이라는 프로토콜을 설정해주어서 딕셔너리 형태로 사용할 수 있도록 설정해 주었습니다.
```swift
enum Fruits: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}
```
> **2) for문과 forEach의 사용성**
>
>- **고민한점**: for문과 forEach 중 어떤 것을 사용해서 각 과일 별로 초기 값을 넣어줄지 고민했습니다.
>
>- **해결한점**: 서로의 차이점은 for문인 경우 지정된 요소 수 만큼 반복되고 forEach인 경우 저장된 요소 수 만큼 반복되어 전체에 하나씩 넣어 줄 수 있어 forEach를 사용해서 작성해 보았습니다.
```swift
    private var stocks: [Fruits: Int] = [:]
    private let stock = 10
    init() {
        Fruits.allCases.forEach { stocks[$0] = stock }
    }
```
> **3) try-catch 디폴트 오류**
> 
>- **고민한점**: try-catch 문을 이용하여 오류 처리를 하는 과정에서 "call can throw, but it is not marked with 'try' and the error is not handled" 문구의 오류가 발생하였습니다.
>
>- **해결한점**: try-catch 오류의 디폴트값을 설정해서 해결할 수 있었습니다.
```swift
    do {
        try fruitStore.chooseRecipe(order: juice)
    } catch StockError.outOfError {
        print("재고부족")
    } catch { // 디폴트 오류를 설정
        print(error)
    }
```

### Step 02

> 04.29 (금) - 버튼 이벤트 함수 구상, FruitStore에 선언해 둔 함수 JuiceMaker로 옮기는 작업
> 05.02 (월) - Step1 복습 및 Step2에 필요한 내용 공부
> 05.03 (화) - 버튼 이벤트 함수 구현

---

#### 이번 스텝 수행 중 핵심 경험 체크
- [x] 내비게이션 바 및 바 버튼 아이템의 활용
- [x] 얼럿 컨트롤러 활용
- [x] Modality의 활용

---
#### 구현해야하는 기능
- ‘재고수정’ 버튼을 터치하면 ‘재고 추가’ 화면으로 이동합니다
- 각 주문 버튼 터치 시
    * 쥬스 재료의 재고가 있는 경우 : 쥬스 제조 후 “*** 쥬스 나왔습니다! 맛있게 드세요!” 얼럿 표시
    * 쥬스 재료의 재고가 없는 경우 : “재료가 모자라요. 재고를 수정할까요?” 얼럿 표시
        - ‘예’ 선택시 재고수정화면으로 이동
        - ‘아니오’ 선택시 얼럿 닫기
    * 과일쥬스를 제조하여 과일의 재고가 변경되면 화면의 적절한 요소에 변경사항을 반영합니다
    
#### 구현내용

1. 각 과일 별 재고 라벨 생성
2. 쥬스 생성 시 과일 재고에 따른 alert 이벤트 생성
3. 쥬스 생성 후 변경된 재고 수량 반영
4. 과일 재고 부족 시 alert 이벤트에서 재고 ViewController로 이동 기능 생성
5. 쥬스 만드는 알람 시 한글로 보여지기 위해 Juice열거형에 name 연산 프로퍼티 추가
6. + Step01 리뷰 반영
---

#### 고민한 점/해결한 점
1. alert 이벤트
>- 고민한 점: alert 이벤트 생성 후 ViewController로 이동 가능 기능 구현을 어떻게 해야할지..</br>
>- 해결한 점: addAction의 UIAlertAction에서 handler에서 코드 입력 부분에 세그웨이 연결하는 방법 중 하나인 performSegue()를 사용해서 구현해보았습니다. withIdentifier인 부분은 View디렉토리 main에서 원하는 ViewController의 Identifier를 입력해주어 해결했습니다.
```swift
eventFail.addAction(UIAlertAction(title: "예", 
                                  style: .default, 
                                  handler: {_ in
                                            self.performSegue(withIdentifier: "moveToFruitStock",
                                                              sender: nil)}))
```
2. do-catch문의 위치 선정
> - 고민한 점: 처음 do-catch 문이 juiceMaker 클래스 안에 위치해 있었기에 alert 메시지를 어떻게 구현해야 할지 고민하였습니다.
> - 해결한 점: do-catch 문을 viewController에서 구현해주며 alert 메시지를 오류처리에서 구현할 수 있게 되었습니다.

3. 쥬스 생성 알람 한글로 변경
> - 고민한 점 : step01에서 생성하였던 Juice의 이름들이 그대로 나오는 것보다, 초기화면에 나와있는 한글로 변경하기 위해 고민하였습니다.
> - 해결한 점 : Juice 열거형에 한글 이름을 넣은 name 연산 프로퍼티를 추가하여, 초기화면에서 쥬스 생성에 성공할 때 뜨는 얼럿에 한글로 쥬스 이름이 나오게끔 구현할 수 있었습니다.

```swift
 var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        case .pineapple:
            return "파인애플"
        case .strawberryBanana:
            return "딸바"
        case .mangoKiwi:
            return "망키"
        }
    }
```


---

## 그라운드 룰 

### 👨‍👦‍👦 협업 방식
코드 작성 시 제약사항 준수
git commit 시 Karma Style 준수
짝 프로그래밍으로 코드 작성 시 부담 없이 작성 후 토의
순서도(전반적인 흐름)와 UML(세부적인 내용) 작성
의견이 있을 경우 자신 있게 말하기 - 자기의 코드가 아니라 우리의 코드 !!

### 📱 연락이 어려운 시간
업무시간: 10:00 ~ 19:00
bonf : 12:00 ~ 13:30, 18:00 ~ 19:30
Brad : 12:00 ~ 13:30, 18:00 ~ 19:30 연락 어려운 요일: (금)
ZZBAE: 12:00 ~ 13:30, 18:00 ~ 19:30 연락 어려운 요일: (수)

급한일이 있을 경우 디엠 보낸다.

### ☎️ 소통 방법
기본적으로 디스코드를 사용
### 💻 코드 컨벤션
Swift Statements 형식 준수
### 🪵 브랜치 이름규칙
develop - 최종 코드 → develop에서 야곰 레포로 pr 보내고, 머지되면 main으로 이동
각 step 별로 브런치 생성 (ex. step01, step02, step03)
### ⌨️ 커밋 규칙
1. [타입] : 제목
제목은 최대 50 글자까지만 입력
2. 본문은 위에 작성
본문은 한 줄에 최대 72 글자까지만 입력
3. 꼬릿말은 아래에 작성: ex) #이슈 번호
- --- COMMIT END ---
   > [타입] :  리스트
   > feat  : 기능 (새로운 기능)
   fix     : 버그 (버그 수정)
   refact  : 리팩토링
   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
   docs    : 문서 (문서 추가, 수정, 삭제)
   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
   ---  
     > 제목 첫 글자를 대문자로
     제목은 명령문으로
     제목 끝에 마침표(.) 금지
     제목과 본문을 한 줄 띄워 분리하기
     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
 ------------------
