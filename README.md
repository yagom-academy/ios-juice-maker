# ios-juice-maker Step2

## 신경쓴 부분
재고의 값이 변경될때 마다 어떻게 뷰를 업데이트 해줄지 고민했습니다  
모델과 컨트롤러가 서로를 모를수록 좋고 + 의존성을 제거하기 위해   
인스턴스가 간접적으로 메세지를 주고 받는 방법 중 하나인 Notification 을 사용했습니다  
NotificationCenter 는 1: N 으로 소통을 할 때 적절한 방법입니다  

나중에 재고를 수정하는 뷰 컨트롤러에도 값 변경 이벤트를 전달할 필요가 있기때문에  
Notification 의 취지에도 적합하다고 생각했습니다
(저희 프로젝트의 경우 `1` = FruitStore, `N` = viewController, StockUpdateController 입니다)


## 고민했던 점, 해결방법
- `consumeFruit()` 함수에서 믹스쥬스를 제조할 때, 두가지 과일 중 한 종류의 과일이라도 재고가 부족하다면, 쥬스가 만들어지지 않도록 설계를 했습니다. 그런데, 로직의 오류로 쥬스는 만들어지지 않지만, 재고가 충분한 과일의 재고가 빠지는 오류가 발견되었고, 도미닉의 조언대로 guard문을 분리하는 방법으로 해결했습니다. **감사합니다!**
- checkStock() 함수를 Bool 타입을 반환하는 함수로 변경하면서, 네이밍을 hasEnoughStock()으로 변경했어요. `~을 가지고있는가?`의 의미를 가진다고 생각해서 수정해보았습니다.

---

## 조언을 얻고싶은 부분
- 과일쥬스 주문 버튼을 관리하는 방식에 대해 고민이 되었습니다. 기존의 코드는 각각의 버튼을 개별적으로 사용하고 있고, 아래의 예시 코드에서는 버튼을 한곳에서 관리할 수 있도록 해보았습니다. 아래의 코드처럼 한 곳에서 관리한다면, 각각의 메서드로 나누는 것보다 코드가 여기저기 돌아다니지 않는다는? 장점이 있는 것 같기도 해요. 두가지 방법 중 어떤 방법이 나은 것인지 도팀장님의 의견이 궁금합니다 :smile: 
```swift
    @IBAction func orderJuice(_ sender: UIButton) {
        
        switch sender.tag {
            
        case JuiceMaker.Menu.strawberryJuice.menuNumber:
            
            juiceMaker.makeFruitJuice(juice: .strawberryJuice)
            showSuccessAlert(for: .strawberryJuice)
            
        case JuiceMaker.Menu.bananaJuice.menuNumber:
            juiceMaker.makeFruitJuice(juice: .bananaJuice)
            showSuccessAlert(for: .bananaJuice)
            
        case JuiceMaker.Menu.pineappleJuice.menuNumber:
            juiceMaker.makeFruitJuice(juice: .pineappleJuice)
            showSuccessAlert(for: .pineappleJuice)
            
        case JuiceMaker.Menu.kiwiJuice.menuNumber:
            juiceMaker.makeFruitJuice(juice: .kiwiJuice)
            showSuccessAlert(for: .kiwiJuice)
            
        case JuiceMaker.Menu.mangoJuice.menuNumber:
            juiceMaker.makeFruitJuice(juice: .mangoJuice)
            showSuccessAlert(for: .mangoJuice)
            
        case JuiceMaker.Menu.strawberryBananaJuice.menuNumber:
            juiceMaker.makeFruitJuice(juice: .strawberryBananaJuice)
            showSuccessAlert(for: .strawberryBananaJuice)
            
        case JuiceMaker.Menu.mangoKiwiJuice.menuNumber:
            juiceMaker.makeFruitJuice(juice: .mangoKiwiJuice)
            showSuccessAlert(for: .mangoKiwiJuice)
            
        default:
            print("그런 메뉴/버튼 없읍니다! 디폴트로 어떤 값을 주면 좋을까요?")
        }
    }
```



- 과일쥬스 주문 버튼에 액션을 줄 때, 메서드 이름을 `orderBananaJuice`와 같이 네이밍 해주었는데, `bananaButtonTapped`와 같은 방식으로 네이밍하는 방법도 있을 것 같아요.
알맞은 네이밍인지 궁금합니다.

<br>

- postNotification 메서드의 파라미터중 stock을 Optional 타입으로 주고싶은데 warning이 나와요

    - 만약 stock의 타입을 optional이 아닌 일반 Int타입으로 선언하면 주문실패 노티피케이션을 보낼 때 stock 파라미터에 의미없는 값을 보내야해서 고민입니다
    - 현재는 의미없는 값을 보내고, notification을 받는 쪽에서 받은 정보를 무시하는 식으로 코드를 작성했는데, stock를 optional 타입으로 바꾸는 방향으로 어떻게 작성하면 좋을까요?
```swift
private func postNotification(for fruit: Fruit, stock: Int?, succeed: Bool) {
        notificationCenter.post(name: Notification.Name.stockInformation,
                                object: nil,
                                userInfo: [NotificationKey.fruit: fruit,
                                           NotificationKey.stock: stock,
                                           NotificationKey.orderComplete: succeed])
}
// 위 메서드는 notification의 userInfo에 과일, 재고, 주문성공 여부를 추가정보로 제공하는 메서드 입니다.
```
![](https://i.imgur.com/PeCiE5r.png)


- optional 타입으로 주려는 이유!
    
```swift
// 재고부족시 stock 정보를 줄 필요가 없어서 nil로 주고싶어요
private func hasEnoughStock(of fruit: Fruit, amount: Int) -> Bool {
        if let fruitAmount = stockOfFruit[fruit], fruitAmount >= amount {
            return true
        } else {
            postNotification(for: fruit, stock: nil, succeed: false) // false
            return false
    }
}

// 재고를 빼는것에 성공했을때는 stock 파라미터에 남은 재고를 넣어줍니다
private func subtractStock(of fruit: Fruit, amount: Int) {
    if let stock = stockOfFruit[fruit] {
        stockOfFruit[fruit] = stock - amount
        postNotification(for: fruit, stock: stock - amount, succeed: true) // true
    }
}
```

- `ViewController`class 내부의 프로퍼티나 메서드에도 접근제어를 설정해주는지 궁금해요!


## 브랜치 전략

![](https://i.imgur.com/DaPGdFV.jpg)

## 구현한 모습

![](https://i.imgur.com/cVcTaed.gif)

