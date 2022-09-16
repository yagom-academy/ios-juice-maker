## iOS 커리어 스타터 캠프
## Juice Maker

---
## 목차

#### 1. [👥 팀원](#1.-팀원)
#### 2. [🏞 UML](#2.-Project-UML)
#### 3. [🤓 고민한 점](#3.고민한-점)
#### 4. [📺 실행 영상](#4.-실행-영상)
#### 5. [🔎 참고 링크](#5.-참고-링크-🔎)
--- 
# 1. 팀원 👥

| <center> Baem | <center> Jeremy |
| -------- | -------- |
| <a href="https://ibb.co/K6tWhrT"><img src="https://user-images.githubusercontent.com/88357373/188073563-1f58d29f-3a36-4d4d-9698-03cf24113fb3.PNG" alt="Ash" border="0" width="200"></a>  | <a href="https://ibb.co/K6tWhrT"><img src="https://i.imgur.com/RbVTB47.jpg" border="0" width="200"></a>  |
| [<center>*@baem2*](https://github.com/dylan-yoon) | [<center>*@yjjem*](https://github.com/yjjem) | 
---
  
# 2. Project UML
<img src="https://i.imgur.com/L15v4nM.jpg"/>
    
# 3.**트러블 슈팅**

### Alert의 재사용성

Alert를 생성할떄 title, message, action, addAction등 Alert마다 새로 만들어줘야 하는 것이 마음에 걸려 class 형태로 reuseable Alerter를 구현했습니다. 
저희 프로젝트의 Alert 생성은 반복되는 코드가 없고 간단합니다. isPresentable을 true로 지정하게 되면 재고추가 ViewController가 present되는 action이 Ok 버튼에 추가됩니다.
    
```Swift
private func presentAlertOrderIsReady(_ juice: Juice) {
        let alert = Alerter(title: "완성",
                            message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
                            isPresentable: false,
                            presentOn: self).alertController
        
        return present(alert, animated: true)
    }
```
    
### KVO 삭제 후 Singleton을 사용하게 되면서 쥬스 주문 화면의 Lable이 업데이트가 안되는 문제를 해결할 수 있는 방법에 대해 고민했습니다. 
    
해결: 커스텀 Delegate를 생성하면서 dismiss시 레이블을 업데이트 해주도록 구현했습니다.
    
```swift
@IBAction func tappedCloseModalButton(_ sender: UIButton) {
    self.dismiss(animated: true)
    StockEditorViewController.delegate?.didDismissModal()
}
```
    

### Dictionary 타입에 대한 고민
최초에 딕셔너리를 사용해 보고자 사용 했지만,
```swift
    var stock: [String: Int] = [
        Fruit.strawBerry.rawValue: 10,
        Fruit.banana.rawValue: 10,
        Fruit.pineApple.rawValue: 10,
        Fruit.kiwi.rawValue: 10,
        Fruit.mango.rawValue: 10
    ]    
```
KVO 를 사용 했을 때는 딕셔너리 사용을 위해 Key 값을 String으로 고정해야 한다.
또한 다른 타입들에 비해 타입 자체가 무거우며, 옵셔널 타입을 해결해야 하는 불편함들이 있었다.
추후에는 struct, tuple 등 다른타입과 비교해서 방향에 맞는 역할을 할 수 있도록 노력해야 겠다.
    


### Error Handling
처음 프로젝트를 시작하면서 에러 핸들링을 고려하기 위해 JuiceMaker 에서 사용을 했다.
하지만 ViewController 에서 JuiceMaker의 에러를 핸들링 하기 때문에 핸들링 위치를 바꿔 주어야 했다.
이와 같이 객체지향 관점에 맞게 핸들링도 적절하게 사용해야 겠다.
    
    
### 분기 처리
버튼의 분기처리를 통해 코드를 간략하게 사용하고자 했다.
    하지만 아래의 경우 처럼 하나의 `@IBAction func` 에 분기 처리를 한다면 코드의 길이는 짧아지지만 
    특정버튼을 수정한다던지 특정 버튼에만 특수한 이벤트를 사용한다고 할 때 분기 처리보다는 하나의 버튼에 하나의 `@IBAction func`를 사용한다면 특정 이벤트에 대해 대처가 쉬울 것이다.

수정 전
```swift
     @IBAction func orderJuice(_ sender: UIButton) {
        if let sender = sender.titleLabel?.text?.replacingOccurrences(of: " 주문", with: ""),
            let juice = Juice(rawValue: sender) {
            if juiceMaker.requestStockAvailability(for: juice) {
                juiceMaker.store.useStockForRecipe(of: juice)
                presentAlertOrderIsReady(juice)
            } else {
                presentAlertNotEnoughStock(data: juice.recipe)
            }
        }
    }
```
수정 후    
```swfit
@IBAction func tapStrawBerryBananaButton(_ sender: UIButton) {
        orderJuice(juice: .strawBerryBanana)
    }
    
    @IBAction func tapMangoKiwiButton(_ sender: UIButton) {
        orderJuice(juice: .mangoKiwi)
    }
    
    @IBAction func tapStrawBerryButton(_ sender: UIButton) {
        orderJuice(juice: .strawBerry)
    }
    
    @IBAction func tapBananaButton(_ sender: UIButton) {
        orderJuice(juice: .banana)
    }
    
    @IBAction func tapPineAppleButton(_ sender: UIButton) {
        orderJuice(juice: .pineApple)
    }
    
    @IBAction func tapKiwiButton(_ sender: UIButton) {
        orderJuice(juice: .kiwi)
    }
    
    @IBAction func tapMangoButton(_ sender: UIButton) {
        orderJuice(juice: .mango)
    }
```
이 경우에는 각각에 좀 더 적절한 방향으로 사용하면 좋을 것이다.
    

# 4. 참고 링크 🔎 
- [누구나 쉽게 이해할 수 있는 Git-입문 - 발전편](https://backlog.com/git-tutorial/kr/stepup/stepup1_4.html)
- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
- [Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)
- [Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
    

