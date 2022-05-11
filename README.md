#  주스메이커 프로젝트
> 프로젝트 기간 2022.04.25~2022.05. 
> 팀원: @hugh(https://github.com/Hugh-github, @yeton(https://github.com/yeeton37)
> 리뷰어: @Jason

## UML 클래스 다이어그램
![Class Diagram](https://user-images.githubusercontent.com/102569735/165211439-7dc467d8-e6e7-4d3f-a1ed-e517b555cd38.png)

## step1 기능 구현
- 구조체(JuiceMaker),클래스(FruitStore),프로토콜(BindingOptional),enum(Fruits,Menu,JuiceMakerError) 구현
- 구조체(JuiceMaker) 
    - 재고가 충분한지 확인하는 메서드(checkStock)
    - 주스를 만드는 메서드(make)
    - 딕셔너리 타입의 Menu.recipe에서 key값만 분리해오는 메서드(classifyKey)
    - 프로토콜을 채택해서 옵셔널 바인딩해주는 메서드(unwrapOptional) 
- 클래스(FruitStore)
    - 재고를 감소시켜주는 메서드(decreaseStock)
    - 재고를 채워주는 메서드(fillStock)
    - 프로토콜을 채택해서 옵셔널 바인딩해주는 메서드(unwrapOptional) 
- enum(Menu)
    - 연산프로퍼티를 사용해서 주스의 레시피를 딕셔너리 타입으로 반환해줌 
- protocol(BindingOptional)
    - JuiceMaker, FruitStore에서 옵셔널 바인딩 해주는 부분이 필요해서 프로토콜을 따로 만들어줌

## 고민했던 것들
- 옵셔널 바인딩 시 받아주는 변수명을 어떻게 써야할 지 고민...
```swift
    func unwrapOptional(_ stock: Int?) -> Int {
        guard let number = stock else { return 0 }
        return number
    }
```
위에서 number에 stock이 담기면 이라는 조건으로 옵셔널 바인딩을 해주고 싶었는데 네이밍을 어떤식으로 좋을 지 감이 잘 안왔습니다..ㅜㅜ

- 제이슨의 추천 영상에서 입력/처리/출력 부분을 다 객체로 분리해서 main에서 세 개의 객체가 서로 상호작용을 하도록 하는 방법을 추천해주셔서 그렇게 코드를 작성하기 위해서 노력을 해보았는데 아직 어떤식으로 써야하는 지 크게 와닿지가 않았습니다.

- 재고를 확인해주는 메서드를 JuiceMaker에 구현해줄 지 FruitStore에 구현해줄 지 고민이 됐습니다. 
- 들여쓰기 2번 조건을 만족하기 위해서 코드가 길어지는 걸 방지하고자 옵셔널 바인딩을 해주는 메서드(unwrapOptional)를 만들고, 메서드 안에서 재고가 nil일 경우에 return 0을 해주었는데, 다른 방식으로는 어떻게 하면 좋을 지 고민이 됩니다. 
```swift
 func unwrapOptional(_ stock: Int?) -> Int {
        guard let number = stock else { return 0 }
        return number
    }
```

- 딕셔너리 타입의 menu.recipe에서 key랑 value를 순차적으로 꺼내오기 위해 어떤 방식을 쓸 지 고민함
```swift
for (fruit, need) in menu.recipe {
    
}
```

for문으로 key와 value를 받아오는 방법을 사용해봤다.
menu.recipe의 key는 fruit에, value는 need에 저장이 되므로 for문 안에서 key랑 value를 자유자재로 사용 가능해짐~!

- 메뉴를 쭉 출력해주려는데 메뉴가 enum 타입일 때 어떻게 배열처럼 쭉 꺼내쓸 수 있는지 고민함
```swift
enum Menu {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
}
```

위처럼 enum 타입의 Menu를
```swift

strawberryjuice, bananaJuice, pineappleJuice ... 
```
이렇게 배열처럼 출력해줄 수 있는 방법은 바로 CaseIterable 프로토콜을 받는 것임

```swift
enum Menu: CaseIterable {
   case strawberryJuice
   case bananaJuice
   case pineappleJuice
   case kiwiJuice
   case mangoJuice
}
```
위와같이 선언해주고
```swift

let menu = Menu.allCases.map({ "\($0)" }).joined(separator: ", ")
```
이렇게 선언해주면

`strawberryjuice, bananaJuice, pineappleJuice ... `
이런 식으로 잘 출력됨

- 여기저기에서 계속 딕셔너리의 key값이 필요한 상황인데 key만 따로 빼줄 수 있는지 고민

프로젝트에서 우리가 구현한 코드는 거의 모든 함수가 딕셔너리 타입의 Menu를 매개변수로 가져와서 쓰는 거였는데 그렇게 되면 딕셔너리인 Menu에서 key를 뽑아주기 위해 계속해서 for문을 돌려줘야 하는 불상사가 발생했다…
위에 첫번째 고민에서 썼던거처럼 for문을 돌려줘도 되지만 중복된 코드는 최대한 지양하는 것이 좋기 때문에 key만 따로 리턴해주는 함수를 만들었다.(휴의 아이디아!)

예를 들어서

```swift
for (fruit, need) in menu.recipe {
            
}
```

이렇게 여러개의 key(fruit)를 따로 빼주기 위해서 이런식으로 for문을 계속 돌려줬는데
```swift

func classifyKey(menu: Menu) -> [Fruits] {
        var keys: [Fruits] = []
        
        for keyValue in menu.recipe.keys {
            keys.append(keyValue)
        }
        return keys
    }
```

위의 코드처럼 key를 빼주는 함수를 따로 만들고, key는 여러개가 나올 수 있기 때문에(코드 설계상) 배열로 담아주어서 리턴하는 방법을 사용해줬다. 유레카~!


## 배운 것들
- private을 우선 고려해서 변수나 상수를 선언해보기
- 하드코딩 지양 ( 숫자로 돼있는것들 목적을 확실히 나타내주기)
- 작성하다보면 함수들이 중복되는 곳이 생기는데 그걸 자꾸 줄이려는 노력을 해야 함
- 딕셔너리에서 key 따로 뺄 수 있음 (함수만들어서)
- 프로토콜(CaseIterable) 사용하는 법 배움

## PR 후 개선사항
- 타입 내의 프로퍼티에 무조건 private을 붙이고 그 후에 메서드끼리 상호작용하도록 코드를 작성해보기로 했음
```swift
enum Menu {
     case strawberryJuice
     case bananaJuice

     private var recipe: [Fruit: Int] { // private 붙이고
         switch self {
         case .strawberryJuice:
             return [.strawberry: 16]
         case .bananaJuice:
             return [.banana: 2]
         }
     }
     func count(to total: Int) -> [Fruit: Int] { // 메서드로 상호작용하도록
         var countList: [Fruit: Int] = [:]

         for (fruit, need) in self.recipe {
             countList.updateValue(need * total, forKey: fruit)
         }
         return countList
     }
 }
```
- 재고를 체크하는 메서드를 재고 프로퍼티가 있는 FruitStore에 구현해주는 것이 나을 것 같다는 피드백을 받고, JuiceMaker에서 FruitStore로 메서드를 옮김 

- 아래의 오류 처리 로직은 나중에 코드의 흐름을 이해하기 어려움
```swift
do {
    try checkStock(menu: menu, total: total)
    store.decreaseStock(menu: menu, total: total)
} catch {
    store.fillStock(fruits: classifyKey(from: menu))
}
```
- 아래의 오류 처리 로직은 한눈에 파악하기가 쉬움
```swift
do {
    try checkStock(menu: menu, total: total)
} catch {
    // 알랏으로 에러 뜨게 하기
}
store.decreaseStock(menu: menu, total: total)
```
    - 제이슨의 피드백에서 정상 흐름에 대해 고민해보라고 하셨는데 추후 공부가 더 필요할 것 같다..!
     
- struct와 class를 언제 사용하는 지에 대한 제이슨의 대답
    - 보통 메소드가 있고 객체로서 협력할수 있는 역할이라면 class를 사용하고, 모델 값 혹은 DTO(Data Transfer Object)의 역할이라면 struct 를 사용한다. (ps. 위의 JuiceMaker와 FruitStore은 메소드가 있어 class 의 성격을 띄지만 사실 지금 프로젝트에서는 별로 상관이 없어보여서 그대로 둬도 괜찮을 것 같음)
    
## step2 기능 구현
- ViewController
    - 재고수정 버튼을 눌렀을 때 화면이 전환되는 메서드(tabEditStock)
    - 쥬스 주문 버튼을 눌렀을 때 쥬스를 주문하는 메서드(order)
    - 과일들의 재고(label) 수량을 변경시켜주는 메서드(updateStock)
    - 재고 부족 알림창을 띄어주는 메서드(showlackOfStockAlert) 
    - 쥬스 제조 완료 알림창을 띄어주는 메서드(showCompletionAlert)
    - 재고 수정 화면으로 넘어가는 방식을 modality로 구현한 메서드(changeView)
        - 메서드(showlackOfStockAlert)의 okAlert의 handler에서 사용
        - 재고수정버튼 눌렀을 때 사용
- JuiceMaker
- FruitStore
    - 원래 기본값으로 설정했던 초기재고를 initializer를 통해 초기화해주는 방식으로 변경
    - stock에 저장돼있는 과일의 개수를 ViewController으로 가져다주는 메서드(notifyStock) 구현
- Menu
    - Menu의 case를 String 타입으로 반환해주는 계산 프로퍼티 name 변수 선언
## 고민했던 것들
- 네비게이션 컨트롤러가 두 개인 이유에 대해 고민
    - 왜 이번 프로젝트에서 네비게이션 컨트롤러가 2개 있는지에 대해 토론해봤다. 결론은 나중에 앱이 확장될 것을 생각하면 재고 수정만의 문제가 아니라 훨씬 더 많은 화면들이 필요할텐데 하나의 네비게이션 컨트롤러에 연결된 흐름으로 재고수정 화면을 구현해주면 나중돼서 다 바꿔줘야할 수도 있어 번거로울 것이다 라는 결론이 나왔다. 네비게이션 컨트롤러는 스택을 담는 바구니라고 보면 쉬운데, 우리는 재고 수정 화면과 과일 주문 화면의 흐름이 다르다고 결론이 나서 모달로 화면을 구성하기로 했고, 또 그에따라 화면이 하나의 흐름이 아닌 두 갈래의 흐름이 되기 때문에(현재로썬) 두 개의 네비게이션 컨트롤러를 사용해주기로 결정함
- 과일쥬스 주문 버튼을 눌렀을 때 그걸 Menu의 case로 인식하기 위한 방법 2가지 중 뭘 쓸지 고민함
    - 1번째 방법: currentTitle(버튼에 쓰여진 문자열을 그대로 인식) 사용
    - 2번째 방법: 각 주문 버튼에 tag를 설정해주고 enum Menu의 원시값을 Int형으로 해주고 둘의 int를 비교해줌
    - 우리는 2번째 방법인 tag 방법을 사용했음. 그 이유는 코드가 더 깔끔해보여서...!
- 원래 기본값으로 설정했던 초기재고를 initializer를 통해 초기화해주는 방식으로 변경

## 배운 개념
- forEach와 CaseIterable 사용
```swift
    private var stock = [Fruit: Int]()
    
    init(defaultStock: Int) {
        Fruit.allCases.forEach {
            stock[$0] = defaultStock
        }
    }
```
    - 초기 재고값을 init 메서드로 받아오기 위해서 stock의 key인 Fruit 타입은 CaseIterable을 채택함.
    - 그리고 배열로 받아온 뒤 forEach를 사용해서 stock의 key을 가져와서 각각의 key에 value를 할당해줌

## PR 후 개선사항

- Notification을 함수 호출이 아닌 속성 감시자를 통해 Post
    - 속성 감시자를 통해 stock이 변할 경우 post 하도록 수정
    - 속성 감시자의 didSet, willSet은 값이 초기화된 이후로 호출된다.
    - didSet, willSet을 사용하기 위해서는 속성이 반드시 초기화되야 한다.
    - class의 생성자 안에서 값을 할당할 때는 didSet, willSet이 호출되지 않는다.(초기화 이후부터 속성 감시)

```swift
private(set) var stock = [Fruit: Int]() {
        didSet {
            NotificationCenter.default.post(name: .notifyStock, object: nil, userInfo: ["stock": stock])
        }
    }
```


- @IBOutletCollection

`@IBOutlet private var fruitStockLabel: [FruitStockLabel]!`

- 배열이기 때문에 버튼을 연결하는 순서대로 저장된다.
- 배열의 요소들이 비슷한 특성이나 비슷한 디자인을 하고 있을 때 사용하는 것 같다.


- 각각의 Label에 해당하는 타입 생성
```swift
class EditStockStepper: UIStepper {
    func convertToFruit() -> Fruit? {
        return nil
    }
}

class StrawberryStepper: EditStockStepper {
    override func convertToFruit() -> Fruit? {
        return .strawberry
    }
}
```

상속받은 타입에서 재정의를 통해 타입에 해당하는 Fruit case반환


- 원시값을 직접 설정하는 것보다 계산 속성을 이용하는게 좋다.

`제이슨 피드백` : 순서를 정해주기 위해 Int를 채택하는 건 나쁜 패턴입니다.
순서를 정해야 한다면 order를 반환하는 연산 프로퍼티를 만드시는게 좋습니다.

```swift
// 나쁜 예
enum Menu: Int

// 좋은 예
extension Menu {
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .mangoAndKiwiJuice:
            return "망키쥬스"
        case .strawberryAndBananaJuice:
            return "딸바쥬스"
        }
    }
```


- tag는 동적으로 생성된 뷰를 취급할 방법이 없을때 사용하기 좋은 값이다.
화면에 보이는 버튼은 tag를 통해 구분하는 것보다 ViewController와 직접 연결해서 사용하는 것이 좋다.
## Step3 기능구현
- EditStockViewController
  - stepper를 통해 EditStockViewController의 fruitsStock을 변경하고 delegate를 통해 HomeViewController에 전달
  - 메서드 tapCloseButton을 통해 화면 닫기
- HomeViewController
  - EditStockViewController로 부터 전달받은 데이터를 메서드의 파라미터로 사용해 FruitStore의 stock 변경
- Stepper 타입 만들기
  - 각각의 Stepper의 타입을 만들어주었다. 
- 화면간의 데이터 전달
  - HomeViewController에서 EditStockViewController로 저장 속성을 통해 데이터 전달
  - EditStockViewController에서 HomeViewController로 Delegate를 통해 데이터 전달
- Delegate 패턴
  - Delegate를 사용하기 위해 프로토콜 생성
  - HomeViewController에서 프로토콜 채택
  - HomeViewController에서 대리자 설정
  - EditStockViewController에서 Delegate를 통해 HomeViewController로 데이터 전달
- Auto Layout
  - 다양한 기기에서 View가 잘 적용되도록 Auto Layout설정
- StoryBoard 나누기
  - Main 스토리보드에서 나눌 ViewController를 선택해 editor의 Refactor To Storyboard를 사용하면 새로운 Storyboard 파일 생성
  - 중요한 point! Main Storyboard파일에 생성된 Storyboard Reference의 Referenced ID를 새로운 파일에 있는 ViewController의 ID와 동일하게 설정
 
## 고민했던 것들
1. 화면 간의 데이터를 전달하는 방법에 대해 고민했습니다.

  - Model에 있는 FruitStore의 stock을 HomeViewController에 전달하는 방법은 NotificationCenter를 사용했습니다.
  - HomeViewController와 EditStockViewController 사이의 데이터 전달은 저장속성을 통한 전달 방법과 Delegate 패턴 전달 방법을 사용했습니다.
 
 이번 프로젝트에서는 코코아 버전의 MVC를 사용했기에 View와 Controller가 명확히 구분되지 않았습니다... 그래서 편의상 설명할 때 ViewController라고 칭하겠습니다!.
 
 먼저 저희가 애플 문서를 읽어보니 Model과 ViewController사이에서는 Observer패턴을 자주 사용한다고 나와있어서 Model과 ViewController 사이의 데이터 전달 방식을 Notification으로 했습니다. 다수의 이벤트가 발생했을 때 사용하기 편리한 방법인데, 이번 프로젝트에서는 다수의 이벤트가 발생하지는 않았지만 공부한 김에 사용해보고 싶어서 써봤습니다..! 
 또, ViewController끼리는 의존성이 강해지면 분리하기 어려워 좋지 않다고 생각을 해서 프로토콜을 채택하는 방식인 delegate 패턴 전달 방식을 사용해서 의존성을 낮춰주는 방식을 사용했습니다. 두 번째 화면이 present될 때 데이터를 전달해 주도록 했습니다!
 
  - Delegate의 대리자 설정 관련하여 고민... 
 
`editStockVC.delegate = self`

처음에는 EditStockViewController에서 HomeViewController의 메서드를 실행시키기 위한 데이터를 전달해 주기 때문에, HomeViewController이  EditStockViewController에게 너가 데이터를 보내줘! 라고 하면서 EditStockViewController을 대리자로 만들어준다고 생각을 했습니다.  

그런데 다시 고민해보니 EditStockViewController는 데이터를 전달만 해주고 HomeViewController에서 데이터를 받아 일을 대신해주기 때문에( 함수의 정의도 이 곳에서 일어나기 때문) 대리자가 HomeViewController가 된다는 것을 알게되었습니다.
처음 delegate를 사용해보니 개념이 매우 헷갈렸던 것 같습니다...

- Stepper를 통한 데이터 전달을 어떻게 해줄지 고민

updateStepperValue에서 생성된 데이터를 화면의 ` 닫기` 버튼이 눌렸을 때 한 번만 전달할지, Stepper 이벤트가 발생할 때마다 전달할지를 고민했습니다. 
저희가 생각하기로는 Stepper 이벤트가 발생할 때마다 데이터를 전달해주면 변경될 때마다 FruitStore의 stock을 계속 변경해서 notificationCenter로 post를 해주기 때문에 이 방식은 비효율적이라 생각했습니다. 

반면, 데이터를 화면 닫기 버튼을 눌렀을 때만 전달하게 되면 한 번에 데이터를 전달한다는 장점은 있지만, FruitStore의 stock 자체를 변경해준다기보다는 EditStockViewController에서 전달받은 stock으로 대체한다는 느낌이 들어 약간 어색함이 느껴졌습니다.



## 배운 개념
- Notification 사용 방법
- Delegate패턴 사용 방법
- 속성 감시자 활용 및 개념
- IBAction을 사용하지 않고 addTarget을 통해 이벤트 처리
- Class의 상속(메서드와 속성 재정의)
