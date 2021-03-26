
# Juice Maker project

#### 진행기간(2021/03/08 ~ 2021/03/19)

<br/> 

## Step 1

### 이번 Step에서 공부한 내용 📚

<br/>

- #### enum + static property의 활용

  싱글톤 방식으로 쥬스의 종류를 모으기 위해 Class나 Struct를 사용할 경우 instance 생성을 막기가 어려움
  
  이에 enum이 stored property는 가질 수 없지만 static property는 가질 수 있다는 점을 이용
  
  ```swift
  enum JuiceType {
      static let strawberry = Juice(require: Requirements.strawberry, juiceName: "딸기쥬스")
      static let banana = Juice(require: Requirements.banana, juiceName: "바나나쥬스")
      static let kiwi = Juice(require: Requirements.kiwi, juiceName: "키위쥬스")
   // ... (후략)
  }
  ```
  
  <br/>
  
- #### 읽기 전용 property의 구현을 위해 `private(set)` 사용

  ```swift
  class Fruit {
      private(set) var stock: Int = 10
    //...
  }
  ```


<br/>

### 피드백을 통해 개선한 부분

> [Step1 피드백 링크](https://github.com/yagom-academy/ios-juice-maker/pull/37)

- canMake() 메서드를 연산프로퍼티로 변경 
- 맥락을 통해 타입을 유추할 수 있는 경우 타입 명시를 제거
- 앱 실행중에 변경되지 않을 값에 대해 let을 사용

<br/> 

## step 2, 3

##### **실제 작동 화면**

![JuiceMaker3](https://user-images.githubusercontent.com/67148595/111567574-8a71bb00-87e2-11eb-9a03-58de68681e99.gif)



<br/> 

### 이번 Step에서 공부한 내용 📚

- #### Custom Label과 Custom Button을 구현하여 Juice instance를 프로퍼티로 가질 수 있도록 제작

  ```swift
  class StockLabel: UILabel {
      var fruit: Fruit = FruitType.strawberry
  }
  
  class JuiceOrderButton: UIButton {
      var juice: Juice = JuiceType.strawberry
      
      func make(menu: Juice) {
          JuiceMaker.make(menu: menu)
      }
  }
  ```



<br/> 

- @IBInspectable과 @IBDesignable을 활용하여 borderWidth, borderColor, cornerRadius customizing

  ```swift
  @IBInspectable var borderWidth: CGFloat {
          set {
              layer.borderWidth = newValue
          }
          get {
              return layer.borderWidth
        }
  }
  // ...(후략)
  ```



<br/> 

- #### Dispatch Queue를 활용하여 Alert이 자동으로 dismiss 되도록 변경

  ```swift
  func successAlert(typeOfJuice: Juice) -> UIAlertController{
          let alert = UIAlertController(title: "주문 확인", message: "\(typeOfJuice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
              alert.dismiss(animated: true, completion: nil)
          }
          return alert
  }
  ```



<br/> 

- #### 버튼을 통한 segue 방식의 화면 전환 구현

  <img src="../../assets/Project%20Review/JuiceMaker/1.png" alt="1" style="zoom: 33%;" />



<br/> 

- #### Alert의 action을 통한 화면 전환(modal로 띄워준 화면을 dismiss 하는 방식) 구현 + 화면 전환 방식 (transitionStyle) customizing

  ```swift
  func failAlert() -> UIAlertController {
          let alert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
          let yesAction = UIAlertAction(title: "예", style: .cancel)
          { action in
              guard let stockView = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") else {
                  return
              }
              stockView.modalTransitionStyle = .flipHorizontal
              stockView.modalPresentationStyle = .fullScreen
              self.present(stockView, animated: true, completion: nil)
          }
          let noAction = UIAlertAction(title: "아니오", style: .default)
          
          alert.addAction(yesAction)
          alert.addAction(noAction)
          return alert
  }
  ```



<br/> 

### 피드백을 통해 개선한 부분

> [Step2 피드백 링크](https://github.com/yagom-academy/ios-juice-maker/pull/51)
>
> [Step3 피드백 링크](https://github.com/yagom-academy/ios-juice-maker/pull/53)

- custom Label, Button의 initailize 작업을 메서드로 묶어주기
- 버튼의 네이밍 수정






