>프로젝트 기간 2022.02.21 ~ 2022.03.11
>
>팀원 : [@cherrishRed](https://github.com/cherrishRed) [@saafaaari](https://github.com/saafaaari) / 리뷰어 : [@stevenkim18](https://github.com/stevenkim18)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [프로젝트 구조](#프로젝트-구조)
- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한점](#고민한-점)
    + [배운개념](#배운-개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한-점)
    + [배운개념](#배운-개념)

## 프로젝트 소개

<div align="center">
    <img src = "https://i.imgur.com/DW3C93h.png" width="100px">

🧃 주스를 주문하세요! 

☑️ 품절된 주스는 회색입니다
    
🍓 품절이여도 괜찮아요 재고를 수정하세요
    
</div>


**주스 주문**

<img src = "https://i.imgur.com/nGZFhTj.gif" width="500px">   


- 주스가 재고가 있어 주문이 가능할 때 주스가 나왔다는 알림 표현, 없다면 재료가 없다는 알림과 재고를 수정할지에 대한 얼럿 표현
- 재고가 있어 주문이 가능한 주스는 버튼이 파랑색, 없어 주문이 불가능한 주스는 버튼이 회색으로 표현


**재고 수정**

<img src = "https://i.imgur.com/WNR29dq.gif" width="500px">

- 재고 수정화면으로 넘어가 원하는 만큼 재고 수정 후 "예" 버튼을 누르면 적용
- "아니요" 버튼을 클릭시 재고가 수정되지 않고, 창 종료






## 프로젝트 구조 
<img alt = "juiceMakerUML" src = "https://user-images.githubusercontent.com/63499481/158018534-21381ba4-4d77-48ca-8227-073e0f564fe9.png" width="1200px">

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## 키워드
`Modality` `Alert` `Navigation` `Stepper` `AutoLayout` `delegate` `Protocol` `CustomStringConvertible`

## [STEP 1]
[STEP 1 PR](https://github.com/yagom-academy/ios-juice-maker/pull/181)

### 고민한 점
- 초기값 설정에 관한 이슈
- 필요없는 값 VS 조건문 반복문 중첩
- for 문 안의 guard 사용에 대한 리뷰어님의 생각
- 클래스 내부의 열거형 접근에 관해
- 열거형의 위치에 따른 메모리적 차이
- MVC에 대한 각 개체의 기능의 범위
### 배운 개념
- 열거형 사용법
- 클래스와 구조체(참조타입과, 값타입)의 차이
- 값타입의 값 변경에 따른 메모리의 변화 및 mutating키워드
- 타입 초기화의 방법과 각 차이 및 프러퍼티의 초기화 시점에 대해
- nestType
- 함수와 파라미터 네이밍에 대해
- guarad문과 if문의 차이

**nestType(enum)**
```swift 
struct JuiceMaker {
    enum Juice {
    //구현사항 
    }
}
```
nesteType 타입을 선언할 경우 JuiceMaker.Juice 처럼 타입으로 접근이 가능하다.

nestType으로 얻게 되는 장점은 Juice 라는 타입을 접근할 때 JuiceMaker.Juice 로 접근하게 하여 Juice가 JuiceMaker에 연관된 값 임을 정확히 하는데에 있다. 
전역으로 빼도 문제 없지만, 현재는 Juice 의 타입이 JuiceMaker 안에서만 사용되고 있다보니 여기에서 사용되는 값이다 라는 의미를 코드에 담고 싶었다. 
 그리고 이후 스텝에서 다른 객체에서 Juice 타입을 사용하면서 Juice 타입을 밖으로 빼기로 논의했고, 그 중 JuiceMaker 안에서만 사용되는 recipe 이라는 연산 프로퍼티를 extension 으로 JuiceMaker 내부에 선언해 주게 되었다. 

**이니셜라이져**
```swift
class FruitStore {
    private let defaultStock: Int = 10
    var stock: [Fruit: Int] = [.strawberry: self.defaultStock,
                     .banana: self.defaultStock,
                     .pineapple: self.defaultStock,
                     .kiwi: self.defaultStock,
                     .mango: self.defaultStock]
}
//컴파일 오류: Cannot find 'self' in scope
```
위 처럼 기본 프로퍼티 초기화 방법을 사용했을 때 self키워드를 사용할 수 없다. 이유는 시점의 문제인데 타입 내부에서 기본 프로퍼티를 사용하여 초기화했을 시 초기화 시점이 ` defaultStock`와 `stock`가 같기 때문에 컴파일 오류가 발생한다. 이를 해결하기 위해선 시점을 달리 주는 방법을 사용해야 하는데 `lazy`키워드를 이용하여 시점을 다르게 해주거나, 이니셜라이져 `init()`내부에서 해주어야 한다.
 
```swift
class FruitStore {
    private(set) var stock: [Fruit: Int]
    
    init(defaultStock: Int = 10) {
        stock = [.strawberry: defaultStock,
                 .banana: defaultStock,
                 .pineapple: defaultStock,
                 .kiwi: defaultStock,
                 .mango: defaultStock]
    }
}
```
때문에, 위와같은 방법으로 init의 전달인자에 기본값을 설정하여 유연한 초기화를 할 수 있도록 이를 해결하였다.
이를 공부하며, 여러 초기화 방법을 언제 어떤 방법을 사용할수 있을지와 

>타입 프로퍼티가 항상 같은 값을 가진다면, 초기화 구문 사용보다는 기본 프로퍼티를 사용하는 것이 바람직하다. 왜 내하면, 기본 프로퍼티를 사용하였을 때 코드가 간결하지고 명확해지며, 프로퍼티 타입을 유추하기 쉽다. 하지만, 인스턴스마다 다른 프로퍼티 초깃값을 설정해 줘야 하는 경우, 초깃값을 매개변수로 받을 수 있는 초기화 구문사용이 유용하다.

초기화엔 단계가 있다는 것을 배울 수 있었다.

> 1단계
>- 지정된 또는 편의 초기화 구문은 클래스에서 호출됩니다.
>- 클래스에 새로운 인스턴스에 대한 메모리는 할당됩니다. 메모리는 아직 초기화 되지 않았습니다.
>- 클래스에 대한 지정된 초기화 구문은 클래스에 의해 도입된 모든 저장된 프로퍼티가 값을 가지고 있는지 확인합니다. 이러한 저장된 프로퍼티에 대한 메모리는 초기화 됩니다.
>- 지정된 초기화 구문은 자체 저장된 프로퍼티에 동일한 작업을 수행하기 위해 상위 클래스 초기화 구문에 전달됩니다.
>- 이것은 최상위 체인까지 클래스 상속 체인 위로 계속됩니다.
>- 최상위 체인에 도달하고 체인에 마지막 클래스가 모든 저장된 프로퍼티가 값을 가지고 있다고 확인하면 인스턴스의 메모리는 완벽하게 초기화 되었다고 간주하고 첫단계가 완료됩니다.

> 2단계
> - 체인의 최상위에서 아래로 내려가면 체인에 각 지정된 초기화 구문은 인스턴스를 추가로 사용자 정의할 수 있는 옵션이 있습니다. 초기화 구문은 이제 self 로 접근할 수 있으며 프로퍼티를 수정할 수 있고 인스턴스 메서드를 호출하는 등에 작업을 수행할 수 있습니다.
> - 마지막으로 체인에 모든 편의 초기화 구문은 인스턴스를 사용자 정의하고 self 로 작업할 수 있는 옵션이 있습니다.
>
> [공식문서](https://bbiguduk.gitbook.io/swift/language-guide-1/initialization#initialization-parameters)를 인용하여 작성하였습니다.

**guard if 문 차이**
if와 guard를 사용함으로써 코드를 읽는 흐름이 달라질 수 있다.
```swift
guard checkOneStock(of: juice, with: list) else { return false }
```
```swift
if checkOneStock(of: juice, with: list) == false { return false }
```
적절한 상황에 잘 선택해서 사용하는 것이 좋다.

## [STEP 2]
[STEP 2 PR](https://github.com/yagom-academy/ios-juice-maker/pull/200)
### 고민한 점
* 어려 버튼에 대한 액션을 하나의 IBAction으로 처리해줄 것인가
* 어떤 방식으로 에러 처리를 해줄 것인가
* 다른 상황에 보이는 얼럿에 대한 함수를 분리할 것인가? 통합할 것인가?
* 화면전환을 모달을 사용할 것인가 내비게이션을 사용할 것인가?

### 배운 개념
- 모달과 네비게이션의 차이 
- 싱글톤 패턴 
- 에러 핸들링 
- CustomStringConvertible
- KVO, Notification center 의 사용법

**싱글톤 패턴**
싱글톤은 여러곳에서 같은 인스턴스에 접근해 모두가 같이 값을 변경해야 하는 경우 사용된다.

장점은 어디에서나 접근할 수 있는 전역인스턴스 이기 때문에 코드가 간결하고 편하다. 메모리를 절약할 수 있다.
단점은 객체지향 설계 원칙에 어긋난다. 객체지향의 원칙 중 개방 폐쇠 원칙으로 MVC 각각의 역할이 잘 분리되어야 하는데, 싱글톤을 사용할 경우 이 셋의 결합도가 올라가 각각의 역할이 모호해 지게 된다. 또한 멀티 쓰레드 환경에서 동기화 처리를 하지 않을 경우 2개의 인스턴스가 생성되는 문제점이 나타난다고 한다.

Swift에서는 노티피케이션 센터, NSFileManager, NSWorkspace, UIApplication 그리고 UIAccelerometer 등이 싱글톤으로 구현되어 있다.

처음엔 재고 관리에 싱글톤 패턴을 활용하였지만, swift 에서 싱글톤을 사용하는 의도와 (일을 해주는 역할) 데이터를 저장하는 의도가 맞이 않다고 판단해 다른 방식으로 변경하였다. 

**KVO, Notification center**
싱글톤 패턴에서 1대 1로 값을 전달하는데 특화되어 있는 KVO로 로직을 변경하려 하였으나,
```swift
class FruitStore: NSObject {
    //static var shared = FruitStore()
    @objc dynamic var stock: [Fruit: Int]
    
    private init(defaultStock: Int = 10) {
        stock = [.strawberry: defaultStock,
                     .banana: defaultStock,
                     .pineapple: defaultStock,
                     .kiwi: defaultStock,
                     .mango: defaultStock]
        }
}
//컴파일 오류: Property cannot be marked @objc because its type cannot be represented in Objective-C
```
위와 같이, enum 이 들어있는 dictionary 타입 값을 전달 할 수 없어 적용하지 못했다.(enum 타입은 NSObject를 상속 받지 못하기 때문에 KVO 방식으로 옮길 수가 없다.)

```swift
func changeStock(of fruit: Fruit, to numberOfFruit: Int) {
        guard var inStock: Int = stock[fruit] else { return }
        inStock += numberOfFruit
        stock[fruit] = inStock
        NotificationCenter.default.post(name: Notification.Name("notificationStock"),
                                        object: nil,
                                        userInfo: ["fruit": fruit,
                                                   "stock": inStock]
        )
    }
```
```swift
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitLable(_:)), name: Notification.Name("notificationStock"), object: nil)
        
    }
@objc private func updateFruitLable(_ notification: Notification) {
        guard let fruitName = notification.userInfo?["fruit"] as? Fruit else { return }
        guard let fruitStock = notification.userInfo?["stock"] as? Int else { return }
        print(fruitName, fruitStock)  
    }
```
때문에 위와 같이, 1대 n 방식이긴 하지만 값을 전달할 수 있는 Notification Center 를 채택하여 값을 전달하였다.
하지만 넘겨주는 값의 양의 비해 코드가 복잡해졌고 어디에서 값을 보내는지 추적하기가 어렵고 형변환을 해줘야 하는 단점 등으로 결국 인스턴스를 사용해서 값을 넘겨주는 방식으로 변경하였다. 


**다양한 화면전환 방법**
이번 프로젝트를 진행하며, 화면전환에 대한 이슈가 발생했다. 
화면 전환의 방법은 스토리보드에서 직접 Segue를 이용하여 전화해주는 방법 또는, 코드를 이용하여 Navigation방식으로 Push하는 방법과 Modally방식으로 Present 해주는 방법이 있다. 
```swift
    @IBAction func moveStockCorrectionView(_ sender: UIButton) {
        let stockCorrectionView = self.storyboard?.instantiateViewController(withIdentifier: "stockCorrection")
        self.present(stockCorrectionView!, animated: true, completion: nil)
        }

        stockCorrectionView?.modalTransitionStyle = .coverVertical
        stockCorrectionView?.modalPresentationStyle = .automatic
```
프로젝트에선 Modally방식으로 Present 해주는 방법을 채택하였고, TransitionStyle과 PresentationStyle은 기본값인 `.coverVertical` `.automatic`을 사용하였다.
## [STEP 3]
### 고민한 점
- 모달을 활용한 뷰 이동에서 중간 네비게이션컨트롤러 때문에, 만든 뷰 인스턴스와 실제 이동된 뷰의 인스턴스가 달랐던 문제
- 화면간 데이터 이동에 관한 문제

### 배운 개념
- MVC 
- delegate
- protocol
- auto Layout

**MVC**
처음 MVC 디자인 패턴에 대해 생각해 보며 프로젝트를 구상하였다.
때문에 첫 고민은 "각 개체가 특성과 행위를 어디까지 둘 것이냐?"라는 궁금증있었다.
MVC 디자인 패턴이 생겨난 핵심은 유지 보수라고 생각했고, 그래서 처음엔 모델을 단순한 데이터를 담는 그릇이라고 생각하였다. 컨트롤이 모든 기능적 함수를 가지고 있도록 설계하는 방향이 유지 보수에 더 적합할 것이라고 생각했지만, 컨트롤의 정의를 생각해 봤을 때, "중계자", "통로"이러한 키워드가 붙는다는 것과 "컨트롤은 재사용을 잘 하지 않는다"라는 말을 고려해. 컨트롤은 정말 연결시켜주고 뷰와 모델이 데이터를 주고받을 수 있는 정도의 기능만을 구현하고, 모델을 중점적으로 구현하는 방향으로 설정했다. 
때문에 [프로젝트 구조](#프로젝트-구조)와 같이 `FruitStore`와 `JuiceMaker` 모델이 있고, `MainViewController`와 `ManagingStockViewController` 컨트롤러가 존재한다. 하지만, ios에서 View와 Controller가 매우 밀접해 있다는 특성이 있어, 프로젝트가 진행되며 모델의 기능이 줄고, 컨트롤러의 역할이 점점 커지는 현상을 발견했다. 이러한 점을 보완하기 위해 다양한 디자인 패턴을 공부해야 한다는 생각을 가질 수 있었다. 
**delegate**
delegate 패턴이란, 원래 나의 오브젝트가 처리할 권한을 가지고 있어서 처리해야 할 일을 다른 오브젝트에게 권한을 넘겨주어서 다른 오브젝트에서 처리하도록 해주는 패턴이다.

manage 뷰에서 main 뷰로 이동 할 때에는 뷰의 생명주기 때문에 (모달로 창을 띄웠기 때문에 다시 main 으로 돌아올 때에 viewWillAppear 가 실행되지 않는다는 점에서) manage 뷰가 사라질 때 라벨의 값을 업데이트 해주어야 했다.
그래서 delegate 패턴을 이용해서 manage 뷰가 사라질때, main 뷰에서 라벨의 값이 변환되는 코드를 작성했다.

**protocol**
delegate 패턴을 사용하면서, 객체의 결합도를 낮추기 위해서 protocol을 사용하였다. 
```swift
protocol Delegator: AnyObject {
    var stock: [Fruit: Int]? { get set }
    var delegate: Updateable? { get set }
}
```

```swift
private func setUpDelegate(_ viewNavigation: UINavigationController) {
    guard let topView = viewNavigation.topViewController as? Delegator else { return }
    topView.stock = juiceMaker.fruitStore.stock
    topView.delegate = self
}

private func moveManagingStockView() -> UINavigationController? {
    guard let managingStockVN = self.storyboard?.instantiateViewController(withIdentifier: "ManagingStockViewNavigation") as? UINavigationController else { return nil }
    self.present(managingStockVN, animated: true, completion: nil)
    return managingStockVN
}
```
그리고 화면을 이동 할때, 코드의 재사용성을 높이기 위해서 다른 Navigation Controller 를 연결해도 문제가 생기지 않도록 다운 캐스팅을 할 protocol 을 만들어 사용했다. (Delegator 를 채택한 뷰이기만 하면 탑뷰로 어떤 뷰가 와도 문제가 되지 않는다. 

**auto Layout**
stack view 를 이용해 연관된 이미지, 라벨 스텝퍼를 묶고 또 그러한 stack view 들을 하나의 stack view 로 묶어서 auto Layout 을 적용했다. 
