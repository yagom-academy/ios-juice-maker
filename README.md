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


