# ios-juice-maker Step3


## 고민했던 점, 해결방법
- **모델 - 뷰 컨트롤러 간 데이터 전달 방법**에 대해서 배웠습니다. 그 중에는 Notification Center, Singleton, Property Observer, KVO 등이 있었는데요. 처음에는 싱글턴으로 모든 곳에서 같은 값을 수정할 수 있도록 구현하면 편하지 않을까? 하는 생각이 있었습니다. 그러나 아래의 글을 읽고 싱글턴을 자제하자는 쪽으로 기울었어요.(오늘 TDD에 대해서 배웠는데 테스트가 어렵다는 단점도 있을 것 같아요)

- *싱글턴은 안티패턴이다?* 하나의 데이터에 접근해야 할때 싱글턴을 사용할 수 있지만, 결합도가 높아지고, 객체지향적인 구현 방식이 아니라는 단점이 있다는 점에서 싱글턴을 사용하는 것이 적절한지 고민이 되었어요. 또, 프로젝트 요구사항에 `JuiceMaker는 FruitStore를 소유하고 있습니다`라는 부분이 있어서 싱글턴을 사용하는 것이 위의 사항을 충족하는 것인지도 불명확하다고 생각했습니다. (활동학습 시간에, 소유한다는 것은 어떤의미인지도 생각해보면 좋을 것 같다는 이야기도 있었습니다.) 결론적으로는 위와같은 이유로 이번 프로젝트에서는 싱글턴을 사용하지 않았습니다!

- 따라서 NotificationCenter를 사용해서 데이터를 주고 받고 있는데, 하나 걱정되는 점은 프로젝트에서 두 개의 Notification을 사용하고 있다는 점입니다.
1. FruitStore(모델)의 값이 변할 때 ViewController로 노티피케이션 포스트
2. 두번째 뷰가 dismiss 될 때 노티피케이션을 포스트 & 메인뷰와 모델이 받은 노티피케이션에 대응 해주고 있습니다. 
1번은 적절하게 사용했다는 생각이 드는데, 2번은 뷰->뷰, 뷰->모델 이렇게 데이터를 주는 방법이 적절한지 잘 모르겠습니다. (두번째 뷰-모델 이 데이터를 주고받은 후 -> 메인 뷰컨트롤러가 모델에게 데이터를 받는게 맞지 않나...하는 생각이 들었거든요...)

뭔가 Notification을 남용하지 않았나? 하는 생각이 드네요..
도미닉의 생각은 어떤가요?


---

## 조언을 얻고싶은 부분
- 재고수정 화면으로 넘어가는 부분을 작성한 아래의 코드에서, `navigationController`를 상수에 담아서 띄워주는 방법과, `navigationController identifier`에 재고수정 뷰컨트롤러를 넣어주는 방법 중에 어떤 방법이 더 적절한지 고민이 되었습니다! 도미닉의 생각은 어떠신가요? :bear: 
```swift=
private func showStockUpdateView() {
        if let stockUpdateController = self.storyboard?.instantiateViewController(withIdentifier: "StockUpdateController") as? StockUpdateController {
            stockUpdateController.stockOfFruit = juiceMaker.stockOfFruit
            let navigationController = UINavigationController(rootViewController: stockUpdateController)
            present(navigationController, animated: true)
        }
    }
```

- `StockUpdateController`에서 `updateFruitStock()` 메서드는 stepper의 value를 과일의 재고 값으로 업데이트 해주는 역할을 하고 있어요. 지금은 아래와 같이 작성해주었는데,
```swift=
stockOfFruit[.strawberry] = Int(strawberryStepper.value)
```
이런식으로 `updateValue`메서드를 이용해서 작성해줄 수도 있을 것 같아요. 하지만, stepper의 value를 Int로 감싸서 넣어줘야하는 부분에서 현재의 방법보다 더 나은 것인지 잘 모르겠습니다..!
```swift=
stockOfFruit.updateValue(Int(strawberryStepper.value),
                         forKey: .strawberry)
```



