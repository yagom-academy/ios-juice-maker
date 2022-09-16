# 쥬스메이커 README
> 프로젝트 기간 2022/08/29 ~  
> 팀원: [rhovin](https://github.com/yuvinrho), [Mangdi](https://github.com/MangDi-L) / 리뷰어: [엘림](https://github.com/lina0322)

# 목차
- [프로젝트 소개](#소개)
- [개발환경 및 라이브러리](#개발환경-및-라이브러리)
- [타임라인](#타임라인)
- [실행 화면](#실행-화면)
- [트러블 슈팅](#트러블-슈팅)

## 프로젝트 소개
> 과일 쥬스를 선택해서 주문하는 앱


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

## 타임라인

### 1주차
- 08/29 ~
    - JuiceMaker, FruitStore 타입 정의
    - 과일쥬스 만드는 함수 정의
- 08/30 ~
    - 쥬스 주문로직에 대한 에러처리 구현
- 09/02 ~
    - 버튼 클릭시 재고추가 화면으로 이동하도록 설정
    - 쥬스 주문시 주문완료/실패 얼러트 설정
    
### 2주차 
- 09/06 ~
    - 쥬스 주문버튼 누르면 과일재고 수량 변경되게 설정
    - 쥬스 주문시 과일개수 레이블 갱신하도록 설정
- 09/09 ~
    - 과일재고 변경시 해당되는 과일개수 레이블만 변경되도록 수정
    
    
- 09/13 ~
    - 과일재고가 바뀌면 주문화면의 과일개수 레이블 변경되도록 notification 기능 추가
    - 과일재고 추가 화면 UIStepper를 이용해 과일재고 수정하도록 설정
### 3주차
- 09/15 
    - 과일재고 추가 화면 오토레이아웃 설정



## 클래스 다이어그램
![JuiceMakerUMLClassDiagram](https://user-images.githubusercontent.com/49121469/190550856-3f9c6d45-306f-4ed0-a6d4-67fe632bbdc0.jpg)

## 실행 화면
![JuiceMakerGIF](https://user-images.githubusercontent.com/49121469/190535606-a4263183-0cac-4843-b3fe-e7f2be9860bb.gif)
## 트러블 슈팅

### 🤔겪었던 문제점, 고민했던 부분 → 😎해결책
- 1
처음 에러처리를 할때 catch에서 에러에 대한 메시지를 출력하게했었는데 이부분을 리뷰어에게 개선해야할부분으로 조언받아서 무슨 방법이 있을까 찾아봤다. CustomStringConvertible 프로토콜을 채택해서 case가 더이상 프린트문을 출력하지 않게 구현했다. catch문 마지막에 debugPrint(error)로 해당하는 에러를 출력한다.
[참고문서](https://www.advancedswift.com/custom-errors-in-swift/)
```swift=
extension JuiceMakerError: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .underFlowOfAmount:
            return "재료가 부족합니다."
        case .notExistFruits:
            return "해당 과일이 없습니다."
        case .unExpectedError:
            return "예상치 못한 에러입니다."
        }
    }
}
```
```swift=
do {
        try JuiceMaker.shared.makeFruitJuice(of: fruitJuice)
            showJuiceComeOutAlert(alert, fruitJuice: fruitJuice)
        } catch JuiceMakerError.underFlowOfAmount {
            showFruitsOutOfStockAlert(alert)
        } catch {
            debugPrint(error)
        }
```
- 2 
FruitJuice의 ingredients 타입을 튜플형으로 구현했었는데 딕셔너리타입을 씀으로 인해 ingredients를 사용하는 코드부분에서 코드수를 굉장히 많이 줄일수있었다. 특히 재료를 2개 받는 딸기바나나와 망고키위의 구현이 더 쉬워졌다.
[참고문서](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
```swift=
var ingredients: [Fruits: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoJuice:
            return [.mango: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
```

- 3
JuiceMaker 에서 FruitStore의 fruitList를 받아올때
변수 fruitStore에다가 private(set)을 달아서 꺼내오는 방법과
코드처럼 연산프로퍼티를 이용해서 가져오는 방법이 있다.
(FruitStore의 fruitList는 private(set) 접근제어자 사용)
전자 방식으로 꺼내올때 JuiceMaker.shared.fruitStore.꺼내오는메소드
후자 방식으로 꺼내올때 JuiceMaker.shared.fruitList 
이런차이가 있다. 어느방법을 쓸까 고민하다 더 적은코드로 꺼내올수있는 연산프로퍼티를 채택했다.
```Swift=
class JuiceMaker {
    static let shared: JuiceMaker = JuiceMaker()
    private var fruitStore = FruitStore(fruitCount: 10)
    var fruitList: [Fruits: Int] {
        return fruitStore.fruitList
    }
```

- 4
화면을 보여줄때 과일재고개수를 화면에 띄우는 방법으로 세그(prepare,performSegue)와 delegate를 이용하는법 그리고 Notification을 이용하는법을 떠올렸다. 서로 장단점을 비교한 결과 세그와 delegate로 일일이 데이터를 넘겨주게되면 Notification으로 구현할때보다 코드가 상대적으로 많아지기 때문에 심플하게 코드를 작성할수있는 Notification으로 구현했다.
다만 Notification은 많이 사용할수록 결합도가 높아진다는 단점이 있기때문에  앞으로 데이터를 가지고 화면을 이동할때 어떤 방법을 쓰는것이 적절한지 고민해봐야겠다.
```swift=
private(set) var fruitList: [Fruits: Int] = [:] {
        didSet {
            NotificationCenter.default.post(
                name: Notification.Name("showFruitCount"),
                object: fruitList,
                userInfo: nil)
        }
    }
```

### 😮알게 된 점
- 코드를 시험용으로 콘솔로만 출력되게 하려면 debugPrint()를 사용하는것이좋다.
- 중첩 타입(Nested Type)을 이용해서 원하는 기능을 쉽게 구현가능하다. 
- catch블록에서 각 에러에 대해 출력하는 것 보다, 에러 자체적으로 메시지를 갖고 있어야 한다 
- 싱글톤을 구현하는방법과 사용하는법을 간단하게 알게되었다. 어떤곳이든 하나의 인스턴스로 활용할수있다는 장점이 있지만 어떤곳이든 참조할수있기때문에 멀티스래싱으로 오류를 일으킬수도 있다는 단점을 알게되었다. 단점을 알게됐다고 무조건 쓰지말자가 아니라 적절히 활용할수있고 컨트롤할수있다면 사용해도 될것같다.
- 4번째 트러블슈팅에 기록한것처럼 Notification과 세그(prepare,performSegue),delegate의 장단점들을 알게되었다. 앞으로 데이터를 가지고 화면을 이동하는법에 대해 어떤식으로 설계를 하고 무엇을 사용해야하는지 충분히 고민하고 선택해야겠다.
