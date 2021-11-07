# 🥤 쥬스 메이커

> 쥬스팝니다. 매진되면 재고도 수정하고 다시 팝니다. 쥬스 사세요.

</br>

**Index**

- [Ground Rule](#GroundRule)
- [코드 전체 흐름](#flow)
- [타입 별 기능](#typefunction)
- [구현 기능 및 코드](#implement)
- [Trouble Shooting](#TroubleShooting)

</br>

![JuiceMaker_gif1](https://user-images.githubusercontent.com/70251136/140608410-c4587a80-52b6-4b31-8d2a-e6c16e3d7a51.gif)

![JuiceMaker_gif2](https://user-images.githubusercontent.com/70251136/140608402-dd68aeb2-45a0-4230-8c8d-646584bd3927.gif)


</br>

</br>

<a name="GroundRule"></a>
#  🤝  Ground Rule

### 👨‍👦 팀원

Jiseong (@yim2627)  July (@July911)

### ⏰ 시간

- 수요일, 주말은 가급적 휴식을 가진다.
- 프로젝트 진행시 스크럼 진행한다.
	- 스크럼은 카메라를 켜서 서로의 컨디션과 기분을 물어본 뒤 오늘 할일을 상의한다.
- 그 날의 목표를 달성할 때까지 프로젝트 진행한다.
- 시간에 구애받지않고 목표치 달성으로 계획한다.

### 📒 Commit Convention

[Commit Convention](https://www.conventionalcommits.org/en/v1.0.0/) 참고

- Karma Style
- feat: 새로운 기능 추가
- fix: 버그 수정
- docs: 문서 수정
- style: 기능 코드 수정이 없는 경우 
	- Ex) 주석 제거
- refactor: 코드 리팩터링 

해당 컨벤션에 맞게 함수단위로 커밋한다.

</br>

<a name="flow"></a>
# 🌊 코드 전체 흐름

<img width="100%" alt="image" src="https://user-images.githubusercontent.com/70251136/140609237-6f7e3272-bfa8-433d-be21-4339419d3978.png">

</br>

<a name="typefunction"></a>
# 🤹‍♀️ 타입 별 기능

**Model 관련 타입**

| Type | 기능 |
| --- | --- |
| Fruits | 쥬스를 만드는데 사용되는 과일들을 담은 Enumeration |
| Juices | - 만들어지는 쥬스들을 관리하는 Enumeration</br> - Description 이라는 computed property를 사용하여, ViewController에서 어떤 쥬스가 만들어지는지 알려줄 수 있는 String값을 쉽게 불러오도록 구현</br> - Recipe 라는 computed property 를 사용하여, 쥬스를 선택하면, 어떠한 과일이 얼마나 필요한지를 return 해주는 Dictionary 형태로 구현 |
| FruitStore | 재고는 어느곳에서나 한번에 관리되야하는 이유로 싱글톤으로 구현 |
| JuiceMaker | FruitStore 싱글톤을 가져와서 쥬스를 만드는 핵심 기능만 담은 구조체 |
| ErrorHandling | - 재고 부족과 알수없는 입력이 처리되었을때, 에러문구를 띄어주는 Error 타입의 Enumeration</br> - localizedDescription 를 통하여 rawValue 를 타이핑하는것을 방지 | - localizedDescription 를 통하여 rawValue 를 타이핑하는것을 방지 |
</br>

**Controller 관련 타입**

| Type | 기능 |
| --- | --- |
| JuiceOrderViewController | - 화면간 데이터 전달을 위한 NotificationCenter 를 화면 초기 실행시 호출되는 함수 viewDidLoad에 addObserver</br>- 각 쥬스 버튼을 클릭할 때 재고가 충분하다면, 재고가 실시간으로 수정되고 성공 Alert 실행</br>- 재고가 충분하지 않다면, 재고를 수정하는 Modal 이동</br>- 이전 버전의 작은 ios 모델에서 쥬스 버튼의 Text가 뭉개지는 현상을 해결하기 위한 오토레이아웃 함수 구현 | 
| FruitStorageViewController | - 각 Stepper에 값이 변경될때마다 Label이 변경되게 하는 함수 구현</br> - 닫기 버튼을 클릭하였을때, Model의 FruitStore()로 NotificationCenter post 를 보내게 하여 JuiceOrderViewController()의 값이 변하게 하는 함수 구현 |

</br>

<a name="implement"></a>
# 📚 구현 기능 및 코드

### 1️⃣ 첫번째 뷰에서 두번쨰 뷰로 데이터 전달

**FruitStorageViewController -> JuiceOrderViewController**

전달할 데이터를 준비하는 함수를 구현하였습니다.

```swift
 private func makeCurrentStock() -> [String] {
       fruitLabels = [
           strawberryStockLabel.text,
           bananaStockLabel.text,
           mangoStockLabel.text,
           kiwiStockLabel.text,
           pineappleStockLabel.text
       ]
       
       var currentStock: [String] = []
       
       fruitLabels.forEach { stock in
           currentStock.append(stock ?? "0")
       }
       return currentStock
   }
```

Alert에서 “재고 수정” 을 선택하여 화면이 전환될 때와 네비게이션 바의 버튼을 사용하여 화면 전환이 될 때, 데이터를 보내는 ```prepare()``` 메소드에 위의 함수를 사용해주었습니다.

```swift
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.children.first is FruitStorageViewController {
            let viewController = segue.destination.children.first as? FruitStorageViewController
            viewController?.fruitStock = makeCurrentStock()
        }
    }
```

---

### 2️⃣ 두번쨰 뷰에서 첫번째 뷰로 데이터 전달

**FruitStorageViewController -> Model -> JuiceOrderViewController**

- JuiceOrderViewController의 viewDidLoad에서 NotificationCenter를 addObserver 추가 

```swift 
NotificationCenter.default.addObserver(self, selector: #selector(updateFruitsStock), name: .update, object: fruitStore)
```

- ```selector```에 재고를 수정해주는 ```updateFruitsStock``` 함수를 넣어 NotificationCenter가 알림을 받으면 재고가 수정되게 구현

- ```FruitStorageViewController``` 내부에 있는 ```transmitStepperValueToFruitStock``` 함수 안의 ```changeFruitStock``` 에서  NotificationCenter에 Notifiaction을 Post

- ```changeFruitStock```이 ```fruitStorage```를 변경하면, NotificationCenter 가 ```updateFruitsStock```을 실행하며, ```JuiceOrderViewController``` 의 Label을 갱신

### 🧖‍♀️ 과일 창고 - Singleton 활용

```swift
class FruitStore {
  static let shared: FruitStore = FruitStore()
}
```

Singleton 으로 구현한 이유

- Model뿐만 아니라 view controller에서도 과일 재고에 관련된 부분이 많음
- Singleton을 통해서 단 하나의 인스턴스(과일 창고)에 접근하여 과일의 재고를 소모하고, 충전하므로 과일 창고의 또 다른 객체가 생성될 필요가 없다고 판단함

FruitStore 의 ```shared``` property로 접근 가능


</br>

<a name="TroubleShooting"></a>
# ☄️ Trouble Shooting

### 화면간 데이터 전달 문제

처음 화면간 데이터 전달을 구현 할 때는 Alert에서 “재고 수정” 을 선택하여 화면이 전환될 때 ```instantiateViewController()``` 메소드를 사용하여 Storyboard identifier를 통해 접근하였고, 위의 함수 ```makeCurrentStock()```을 사용하여, 데이터를 전달해주었습니다.

```swift
    private func presentFruitStoreViewController(_ action: UIAlertAction) {
        guard let navcontroller = self.storyboard?.instantiateViewController(withIdentifier: "FruitStock") else { return }
        let viewController = navcontroller.children.first as? FruitStorageViewController
        viewController?.fruitStock = makeCurrentStock()
        
        self.present(navcontroller, animated: true, completion: nil)
    }
}
```

하지만 화면 전환 방법이 Storyboard의 identifier를 이용하는 것과 segue identifier를 이용하는 것, 이 두가지가 사용됨이 효율적이지 못하다 판단하여, 아래와 같이 segue를 통한 화면 전환 방식으로 통일 해주었습니다.

```swift
 private func showNotEnoughStock() {
        let message = FruitStockError.outOfStock.localizedDescription
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "재고 수정하기", style: .default) { [weak self] (action) in
            self?.performSegue(withIdentifier: FruitStorageViewController.identifier, sender: nil)
        }
        let cancleAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        present(alert, animated: true, completion: nil)
    }
```

이로 인해 화면 전환시 두가지의 접근 방법이 모두 ```prepare()```를 호출하게 되었고, 이전에 구현했던 ```presentFruitStoreViewController()```가 필요하지 않아져서 가독성, 효율성을 증가시키는 결과를 가져왔습니다.

---

### UI와 Outlet 변수 연결 문제

![image](https://user-images.githubusercontent.com/70251136/140610636-31bef545-1610-45f7-b45e-6d826847d656.png)

버튼을 아울렛변수에 연결 후 변수의 이름을 뷰컨트롤러에서 따로 수정해주니, 에러가 발생하여 버튼과 변수의 연결을 끊고 다시 연결해주어 에러를 해결했습니다.

이를 통해 버튼과 같은 것들과 변수, 함수를 연결후 이름만 바꿔주면 에러가 발생함을 알게되어, 연결 전에 처리를 해줘야함을 배웠습니다.






