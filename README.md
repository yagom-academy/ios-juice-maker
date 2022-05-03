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

