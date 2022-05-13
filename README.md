## iOS 커리어 스타터 캠프

### 쥬스 메이커
> 프로젝트 기간 2022/04/25 ~ 2022/05/13  
> 팀원: [@sookoong](https://github.com/Jeon-Minsu) [@bard](https://github.com/bar-d)/ 리뷰어: [@Jake](https://github.com/jryoun1)


# 목차
- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](###시간)
    - [예외사항](##예외사항)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)

- [STEP 0](#STEP-0)
    - [고민한점](#고민한점)
    - [배운 개념](#배운개념)
- [STEP 1](#STEP-1)
    - [고민한점](#고민한점)
    - [배운개념](#배운개념)
- [STEP 2](#STEP-2)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)
- [STEP 3](#STEP-3)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)


# 프로젝트 소개
- 주스의 재고를 확인하고 주스를 만드는 어플리케이션

# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()


# 키워드  
- `guard`, `switch`, `try-do-catch`
- `enum`, `extenstion`, `struct`, `class`
- `dictionary`
- `name space`, `파일 세분화`
# 그라운드 룰

### 시간

[프로젝트에 집중하는 시간]

- 09:30 ~ 21:00

[식사 시간]

- 점심 12:30 ~ 13:30
- 저녁 18:00 ~ 19:00

[연락이 어려운 시간]

- 바드 : 00:00 ~ 01:00
- 수꿍 : 00:00 ~ 01:00

[휴일]

- 수꿍 : 4/28 (목) 저녁 시간 

### 규칙

[커밋]

- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
- `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- `docs` = 문서에 변경 사항이 있는 경우
- `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines

[커뮤니케이션]

- 디스코드 회의실
- 디스코드 다이렉트 메시지



# 핵심경험
- [x] Swift API Design Guide에 따른 이름짓기
- [x] 소스코드에 불필요한 코드 및 코멘트 남기지 않기
- [x] 메서드의 기능단위 분리
- [x] 요구사항에 따른 타입의 정의
- [x] 타입의 캡슐화/은닉화
- [x]  상황에 알맞은 상수/변수의 올바른 선택

# [STEP 0]

## 고민한점 


## 배운개념
- 시뮬레이터 설정법

# [STEP 1]

## 고민한점
- ### 과일과 재고 저장 타입을 `dictionary`로 할지 `tuple`로 할지 고민
    - `tuple`은 순서가 있고 생성된 이후 값을 변경할 수 없음
    - `dictionary`는 순서가 없고 생성된 이후 값을 변경할 수 있음
        - `dictionary`타입을 사용하기로 결정

- ### 과일재고의 타입을 `UInt`로 설정해도 되는 것인가? -> 과일재고가 마이너스는 될 수가 없기에 `UInt`사용하여도 무방함
    - `Int`타입 설정후 에러 핸들링을 통해 처리
        - 에러 핸들링 같은 경우 *제이크*가 추천해준 `LocalizedError`적용해봄 
- ### 과일의 재고가 부족하여 과일쥬스를 제조할수 없을 때 조건문을 설정하고 반복문을 처리할까 생각했는데, `guard`문을 이용한 오류처리로 구현
- ### 제조할 수 있는지 없는지를 판단하는 함수를 생성해야되나? 
    - 정해진 과일 외 다른 과일로 쥬스를 제조할 때 오류로 핸들링 
        - 열거형을 사용하여 주어진 선택사항애서만 선택할 수 있도록 변경, 쥬스를 만드는데 필요한 과일의 갯수가 스토어 내에 충분히 있는지만 판별하는 함수 생성  
- ### `juiceMaker`는 `FruitStore`를 소유하고 있다는 말은 상속을 받는 것인가? 아니면 `juiceMaker`안에 있는 것인가?  
    - 여러개의 `FruitStore`가 있다고 생각을 하여 자신만이 사용하는 `FruitStore`가 있을 것이기에  `juiceMaker` 내에서 자신이 이용하는 `FruitStore`를 선언해야 된다고 생각함
- ### 열거형으로 처리하였을 때는 case구문 안에서만 확인하기 때문에 case 구문에 없는 것은 빌드 자체가 안됨 
    - 오류처리를 하기위해 열거형 타입에 `extenstion`을 사용해 스트링값을 할당
        - 기획자의 의도에 맞게 할려면 주어진 선택사항 내에서 구현을 해야되므로 `extenstion`제거
- ### 쥬스메이커에서 makejuice를 스트링타입으로 `parameter`를 받을지 case 자체를 `parameter`로 받을지 고민함     
    - 일단 String 타입으로 `parameter` 생성
        - 위와 동일하게 `extenstion`제거후 `Product`열거형 타입으로 `parameter`을 받아옴
- ### 현재 `makeJuice`함수 내에서 현재 너무 많은 일들을 하고 있는데 이 부분을 어떻게 나눌지 고민중
    - *제이크의 제안* : `makeJuice`는 어떤 역할을 하는 함수인지 정의해 보아라
        - ex) 1. 음식의 레시피 체크, 2. 필요한 음식 재료가 있는지 체크 3. 필요한 음식재료의 수량이 있는지 체크
    - 캡슐화에 대해 더 공부해 볼 것

## 배운개념

# [STEP 2]

## 고민한점
- ### `화면전환`
    - 처음 `네비게이션`을 사용해서 화면전환을 할지, `모달` 방식을 이용해서 화면전환을 할지 고민했었습니다. 
    - `네비게이션`은 주로 정보의 깊이와 흐름을 가지는 구조에서 사용되고, `모달`은 화면 전체를 정보의 흐름에서 벗어나 전환해주는 것이라고 알고있습니다.
    - 하지만, 재고를 변경하는 것은 정보의 흐름에서 벗어나지 않고 메인 스토리보드의 정보를 흐름에 따라 변경한다 생각해 `네비게이션`을 사용하였습니다.


- ### `얼럿 타입`
    - 재고가 부족할 때 나타나는 아니오 얼럿구문은 `.cancel`와 `.destructive`중 무엇을 사용해야 할지 고민했습니다.
    - `.destructive`는 데이터를 파괴하거나 변경할 때 사용한다고 나와있는데, 아니오를 누를 경우, 데이터의 변환없이 화면을 다시 띄어주면 되는 것이어서 `.cancel`스타일을 선택하였습니다.


- ### `IBAction button`
    - 처음에는 각 버튼에 `IBAction` 이벤트를 연결해주어 총 일곱개의 `IBAction` 이벤트가 생성되었습니다.
    - 너무 많은 이벤트가 생성이 되어 비효율적이라고 생각하였습니다.
    - 이를 한곳으로 모을 수 있을까라는 생각에 `tag`와 `currentTitle`이라는 메소드를 알게되었고, `currentTitle`을 사용하여 적용해보았습니다.

- ### `텍스트 레이블 언래핑`
    - 텍스트 레이블을 강제 언래핑을 하는 이유는 개발자가 제대로 된 레이블에 연결을 하기 때문에 강제 언래핑을 사용하는 것으로 알고 있습니다.
    - 하지만, 프로젝트 제약사항에 `!`는 최대한 사용하지 말라는 문구가 있어서 `optional binding(?)`를 사용해 언래핑을 하였습니다.
    - UILabel이 다른 코드들을 보았을 때 강제 언래핑을 많이 사용하는데 현 프로젝트에서도 강제 언래핑을 사용해도 될까요?



- ### `error handling`
    - STEP1에서 `error handling`을 할 때, 재고가 부족하면 `localized Error`타입을 통해 에러 메세지를 출력해주었는데, STEP2를 진행하면서 출력해줄 필요가 없다고 생각하여 `FruitStore`내 `handle`함수에서 `String`으로 반환값을 주었는데, `handle`함수의 결과가 사용되지 않는다고 노란색 에러가 뜹니다.
    - 이럴 때에는 반환값을 `String`으로 주는 것이 나을까요? 아니면 출력을 하도록 그냥 두는것이 나을까요?🤔

- ### `함수 은닉화`
    - `JuiceMaker`구조체 내에 있는 `make`함수를 `ViewController`로 빼내서 사용을 하였는데, 이를 위해 `JuiceMaker`의 메소드들의 은닉화를 풀어줘야만 했습니다.
    - 은닉화를 풀지않고 하는 방법이 있을까요?

- ### `singleton`
    - 싱글톤 디자인 패턴을 적용해보려고 했는데, 안의 인스턴스 멤버를 사용할 수 없다고 합니다.
    - 만약 싱글톤 디자인 패턴을 적용시키려면 전체적인 리팩토링이 필요할까요?
    - 아니면 저희가 적용을 제대로 못시킨 걸까요?

>```swift
>extension JuiceMaker {
>    static let warehouse = JuiceMaker.fruitStore.fruitWarehouse
>}
><오류메시지>
>Cannot use instance member 'fruitStore' within property initializer; property initializers run >before 'self' is available
>```


- ### `notification`
    - 최근에 배운 `notification`을 적용해보려고 했는데 현재 상황에서는 `notification`이 사용될 필요가 없다고 생각하여 사용하지 않았습니다. 
    - 만약 `notification`을 사용한다면 `FruitStockViewController` 뷰 컨트롤러에서 데이터를 발송하면 `main ViewController`가 받는 방법으로 사용해야 될 것 같습니다.
    - 제이크의 생각은 어떠한가요?🤔



## 배운개념
- `Iterface Builder`, `IBOutlet`, `IBAction`, `sender.currentTitle`, `sender.tag`
- `navigation`, `modal`, `auto layout`
- `alert`, `UIKit`

# [STEP 3]

## 고민한점

### 1. `BarButtonItem, ButtonItem`
- `BarButtonItem`을 사용하여 과일 재고를 관리해주는 뷰컨트롤러에서 쥬스를 만드는 뷰 컨트롤러로 돌아오는 기능을 수행하는 버튼을 만들어 줘야 했었는데, `Button`레이블을 생성하여 오른쪽 상단에 넣어줬더니 마치 `Right BarButton Item`으로 귀속되는 것처럼 들어가 `Button Item`을 `BarButton Item`으로 착각해서 코드를 작성하였었습니다.  
![ButtonItem](https://user-images.githubusercontent.com/92622931/167352740-b64a869d-8b22-4fd1-98b7-1902ccbc00ab.gif)  
- 이렇게 만들어진 버튼은 `sender`를 `UIButton`으로 설정해 주었어야 했는데, `Button`이 들어간 영역이 `BarButtonItem`영역으로 들어가는 줄 착각하고 `sender`를 `UIBarButtonItem`으로 적어 왜 안되는지 한참을 고민했었습니다😵‍💫
- `document outline`이나 `Attirbutes Inspector`를 조금만 더 상세히 봤다면 고민할 일이 없었을 텐데 저희가 쓴 코드가 틀린 부분이 없다고 생각해 한참을 고민을 하다가 나중이 되서야 이유를 알게되었습니다


### 2. `UI Object` 
- `UI Object`들을 스토리보드로 만들 경우 개인이 할 때는 편하게 만들 수 있지만, 
- 협업할 때에는 하나하나 찾아봐야 하기 때문에 코드로 작성하는 것이 협업하는데 편하다는 장점이 있습니다.
- 현 프로젝트에서는 둘이서 라이브 코딩으로 협업하기에 스토리보드를 사용하여 만들어보았습니다.

### 3. `뷰컨트롤러에서 다른 뷰 컨트롤러에서 데이터를 전달해주는 법`
- 쥬스를 만들어주는 뷰 컨트롤러에서는 `property type`를 사용해 데이터를 전달해주었고, 반면 과일 재고를 관리하는 뷰 컨트롤러에서는 `notification`을 사용해 데이터를 전달해주었습니다.
- 뷰 컨트롤러 간의 데이터를 전달하는 방법을 6가지 방법이 있는것으로 알고 있는데  
    - `property에 직접 접근` 
        - 간단한 방법이지만, `push`, `present`방식으로 화면을 전환하는 경우에만 데이터가 정상적으로 넘어감
    - `property와 함수를 이용`
        - 서로 함수에 의존해서 데이터를 전달하는 방식이기에 유지보수가 어려움
    - `segue` 이용
        - 컨트롤러에 직접적으로 의존하고 있는 형태
        - 뷰컨트롤러에 강하게 결합되어있어 수정할 때 어려움
    - `delegate` 이용
        - 위의 방법처럼 강한 결합한 상태를 보완하기 위한 방법
        - 뷰 컨트롤러간의 의존을 하지않고 떨어져있는 구조
    - `closure` 이용
        - `delegate`보다 간결하며 프로토콜 및 메소드 없이 지역 스코프 내에서 바로 처리할 수 있음
    - `notificationCenter`
        - 간단한 데이터를 넘기거나, 어떠한 변화에 대응하는 작업을 할 때 사용하는 것이 적절
        - 모든 데이터를 `notificationCenter`로 넘긴다면 여러 변화를 `observe`해야 하므로 상당히 비효율적인 방식이 될수도 있음

- 이 6가지 방식 중 간단한 데이터만 넘기고 현재 뷰 컨트롤러를 `present`형식으로 넘겨주고 있어서 `propery`를 이용해 데이터를 넘겨주어보았고, `notificationCenter` 같은 경우는 약 1주일 가량 씨름을 해와서 사용한 것이 없지않아 있습니다만(*아래에 질문으로 따로 남겼습니다*), 간단한 데이터를 넘기고 변화에 대응하는 작업을 할 때 사용했기에 현 프로젝트에서 사용해보았습니다.

## 배운개념
- `notification`, `type property`, `UIBarButtonItem`
- `push`, `present`, `UIViewController Lifecycle`


질문
---
### 1. `Notification` 관련 질문

>- 화면 이동 방식: ViewController 1 -> ViewController 2 -> ViewController 1 
>- 데이터 전달 구조 : ViewController2 -> ViewController1

- VC2 에서 Notification을 post,  
VC1 에서 addObserver를 구현하려고 한다면,

- VC1에서 NotificationCenter에 Observer로 등록을 해놓았기 때문에   
VC2에서 NotificationCenter로 알림을 Post하면,   
미리 VC1에서 등록한 옵저버에서 해당 알림을 수신하여, selector에 등록한 기능을 수행할 수 있습니다.

- 반면에, 

>- 화면 이동 방식: ViewController 1 -> ViewController 2 -> ViewController 1 
>- 데이터 전달 구조 : ViewController1 -> ViewController2


- VC1 에서 Notification을 post,   
VC2 에서 addObserver를 구현하려고 한다면,

- VC1에서 NotificationCenter로 알림을 Post하였으나, 메모리에 옵저버가 등록되지 않았기 때문에 해당 알림을 수신을 받지 못합니다.   
VC2에서 뒤늦게 NotificationCenter에 Observer로 등록을 해보았지만, 이미 VC1에서 보낸 post는 만료가 되어 VC2의 Observer는 아무런 Notification을 수신하지 못하는 상태입니다.

- 즉, 문제를 정리하자면, Observer가 메모리에 올라가기 이전에 VC1에서 post를 하였기에 observer가 알림을 인식하지 못하는 상태에 직면한 것입니다.

- 이를 해결하기 위해서는 VC1에서 알림을 post하기 이전에 observer를 메모리에 먼저 올린다면 VC2에서도 알림을 수신할 수 있을 것입니다. 하지만, 어떻게 VC1에서 알림을 post하기 전에 VC2의 Observer를 메모리에 먼저 올릴 수 있는지 방법을 아무리 궁구해보아도 떠오르지 않았습니다.

- 수일동안 여러 차례 고민하여 방법을 궁구하던 중 학습활동 시간을 통해 View Life Cycle의 State Method가 각각 언제 호출되는지 탐구하던 중 다음의 생각이 떠올랐습니다.

- VC1에서 VC2로 기본 모달방식으로 화면전환을 할 때 각각의 State Method는 다음과 같이 호출됩니다.

[모달 방식 - automatic]
```swift
1st viewDidLoad
1st viewWillAppear
1st viewDidAppear
======================
2nd viewDidLoad
2nd viewWillAppear
2nd viewDidAppear
```

- VC1에서 VC2로 풀스크린 모달방식으로 화면전환을 할 때 각각의 State Method는 다음과 같이 호출됩니다.

[모달 방식 - fullScreen]
```swift
1st viewDidLoad
1st viewWillAppear
1st viewDidAppear
======================
2nd viewDidLoad
1st viewWillDisappear
2nd viewWillAppear
2nd viewDidAppear
1st viewDidDisappear
```

- 그렇다면, VC1이 viewWillDisappear나 viewDidDisappear에서 Notification을 Post하면
이미 VC2에서 '2nd viewDidLoad'로 옵저버를 등록하면 알림을 수신받을 수 있지 않을까 하는 가설을 생각하게 됩니다.
그리고 이를 구현해본 결과 VC2의 observer에 등록된 selector 함수가 올바르게 실행됨을 확인할 수 있었습니다!!

- 이에 제이크에게 해당 방법이 앞서 끊임없이 갈구하였던 메모리에 미리 observer를 올린 알맞은 방법에 해당하는지 궁금합니다. 추가적으로 혹시나 다른 방법으로는 어떻게 미리 Observer를 메모리에 올릴 수 있는지 또한 궁금하여 질문드립니다!




- 다만 notification을 사용하는 경우에 대해서 차차 알아가시면 좋을 것 같습니다.
notification에 대한 [공식문서](https://developer.apple.com/documentation/foundation/notificationcenter)를 확인해보면
A notification dispatch mechanism that enables the broadcast of information to registered observers.
이런 설명이 있습니다. 여기서 broadcast라는 것이 중요한 부분입니다.
notification은 어떠한 이벤트가 발생했을 때 이를 알아야하는 여러 개의 객체들이 있을 때 이들 각각에게 알려주는 것은 코드의 양이 많아질 수 있으므로 한 번의 post로 인해 observer하고 있는 모든 곳에서 이를 알아차릴 수 있도록 1:다 에 적합한 방법입니다.

- 그렇다면 이번 프로젝트와 같이 vc끼리 1:1로 데이터를 주고 받는 경우에는 어떠한 방법들을 사용할까요?  
위에서 말씀해주신 6가지 방법들 중 notificationCenter를 제외한 방법들을 사용할 수 있을 겁니다!
물론 notification을 사용해도 됩니다. 그러나 지금 겪는 문제처럼 observer를 등록하는 시점과 post하는 시점이 순차적이지 않은 경우에 이를 수정하는 방법까지 고려하면서 notification을 사용했을 때 얻는 이점이 있을 것 같지는 않습니다.

- 이외의 방법인 delegate에 대해서도 공부를 해보시면 좋을 것 같네요!
[notification과 delegate를 비교하는 글](https://wlgusdn700.tistory.com/45)입니다.

- 추가로 해주신 질문에 대해서는 다른 방법은 저도 잘 모르겠네요. 🥲 저도 찾아보고 알게되면 공유해드리겠습니다!
---
### 2-1 `Modal` 내 `Navigation`구현 중 `Navigation Bar`미표시
2. 일단 아래 질문에 대해서는
- 이전 방식에서 Navigation Bar의 Title 과 뒤로가기 버튼이 자동적으로 생성~  
navigation viewcontroller에 대해서 공부를 해보시면 좋을 것 같네요. 🙏🏻  
navigation viewcontroller에서는 navigationBar를 보여주고 말지 결정할 수 있습니다.

> 이에, 스토리보드를 보면 FruitStockViewController에 navigation title과 item들이 정상적으로 표시되는데도 불구하고 네비게이션 컨트롤러가 아닌 VC로 화면 전환을 바로하면 왜 네비게이션 바가 노출되지 않는지 이유가 궁금합니다.

- 또한 navigation viewcontroller에서 present와 push에 대해서도 같이 알아보시면 질문에 대한 답변이 될 수 있을 것 같네요. 🙏🏻
- 지금의 구현하신 방법으로도 문제가 해결되긴 했지만 navigationViewController 에서 또 다른 navigationViewController를 present 하기 때문에 의도하신 것을 해결은 했지만 좋은 방법은 아닙니다.

- 추가로 Modal의 경우에는 navigationBar가 기본적으로 생성되지 않기 때문에 직접 navigationBarView를 생성하고, button을 달아서 동작하게 할 수 있습니다.
- 이 부분에 대해서는 modal에 대해서 추가적으로 알아보시면 도움이 될 것 같네요.



- 수꿍과 바드가 알아보신 것처럼 navigationBar의 height를 변경할 수는 없습니다.  
 modal 형태라면 위에서 말했듯이 navigationBar 처럼 생긴 뷰를 만들기 때문에 height를 조절할 수 있을 것이고, 그렇지 않은 경우라면 title의 fontsize를 변경하면 사이즈가 커질 것 같은데, 이 부분은 지금 꼭 확인하지 않아도 될 것 같네요 🙂

- stepper의 경우에는 기획서에 있는 것이 Xcode 11이후부터 새로운 디자인으로 변경되었습니다. 커스텀을 하는 방법도 있지만 이번 프로젝트에서 의도한 내용은 아닌 것 같으니 현재 디자인으로 하셔도 될 것 같습니다. 👍🏻
---
