# 쥬스메이커🧃

> 과일의 재고를 관리하고 쥬스를 만드는 앱

</br>

## 목차

1. [팀원](#1.)
2. [순서도](#2.)
3. [타임라인](#3.)
4. [실행 화면(기능 설명)](#4.)
5. [트러블 슈팅](#5.)
6. [참고 링크](#6.)
7. [팀 회고](#7.)

---

</br>

<a id="1."></a>

## 1. 팀원

| [Erick](https://github.com/h-suo) | [JusBug](https://github.com/JusBug) |
| :---: | :---: |
| <img src="https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" height="150"/> | <Img src="https://github.com/JusBug/ios-juice-maker/assets/109963294/53a73571-41d9-4914-a917-d8ea099be948" width="150"/> |

---

<a id="2."></a>

</br>

## 2. 순서도

<details>
<summary>추후 추가 예정</summary>

## </details>

</br>

---

<a id="3."></a>

## 3. 타임라인

### 2023.05.15.(월)

**storyboard, ViewController 세팅**

- storyboard의 레이블과 버튼을 ViewController에 연결
- storyboard 내에 ViewController의 StoryboardID 설정

**JuiceMakerViewController 구현**
- `pushViewController`로 화면 전환 구현
- `JuiceMaker.FruitStore.bringStock()`로 재고를 가져와 `stocklabel.text`에 값을 할당해주는 composeText() 생성
- 성공, 실패 알림 창을 띄어주는 `popUpFailMessage()`, `popUpSuccessMessage()` 생성
- `button.currentTitle`을 사용하여 `orderJuiceButtonTap()` 하나로 버튼 액션을 처리

### **2023.05.16.(화)**

**리뷰 확인 및 코드 수정**

- 함수 네이밍 수정 및 은닉화 설정

### **2023.05.18.(목)**

**리뷰확인 및 코드 수정**

- 함수 네이밍 수정
- `fatalError()`를 모두 제거하고 `return`으로 처리

### **2023.05.19.(금)**

- `README` 작성

---

</br>

<a id="4."></a>

## 4. 실행 화면(기능 설명)

| 버튼 액션으로 화면 이동 |
| :--------: |
| <Img src = "https://hackmd.io/_uploads/SyY0G77r3.gif" width="600"/> |

| alert 액션으로 화면 이동 |
| :--------: |
| <Img src = "https://hackmd.io/_uploads/ryvtfQQB2.gif" width="600"/> |

| 쥬스 만들기 성공 |
| :--------: |
| <Img src = "https://hackmd.io/_uploads/H1BNQXmr2.gif" width="600"/> |

| 쥬스 만들기 실패 |
| :--------: |
| <Img src = "https://hackmd.io/_uploads/Sy3WN7mHh.gif" width="600"/> |

</br>

<a id="5."></a>

## 5. 트러블 슈팅

### 재사용성

**🔥문제점**

- 버튼 하나하나에 `@IBAction func`을 생성하였더니 버튼의 갯수만큼 함수가 필요하여 재사용성이 떨어지는 문제가 있었습니다.

<details>
<summary>본문 코드 내용</summary>

### @IBAction func

```swift
@IBAction func strawberrybananaJuiceOrderButton(_ sender: UIButton) {
    orderJuice(.strawberryBananaJuice
}
    
@IBAction func mangokiwiJuiceOrderButton(_ sender: UIButton) {
    orderJuice(.mangoKiwiJuice)
}
    
// ...
```

</details>

</br>

**🧯해결방안**
- 버튼의 `.currentTitle`을 사용하여 switch문으로 분기처리하여 하나의 `@IBAction func`으로 모든 버튼 액션을 처리하였습니다.


<details>
<summary>본문 코드 내용</summary>

### @IBAction func

```swift
@IBAction private func orderJuiceButtonTap(_ sender: UIButton) {
        guard let title = sender.currentTitle else { print("버튼이 설정되지 않았습니다."); return }
        
        switch title {
        case "딸기쥬스 주문":
            orderJuice(.strawberryJuice)
        case "바나나쥬스 주문":
            orderJuice(.bananaJuice)
        case "파인애플쥬스 주문":
            orderJuice(.pineappleJuice)
        case "키위쥬스 주문":
            orderJuice(.kiwiJuice)
        case "망고쥬스 주문":
            orderJuice(.mangoJuice)
        case "딸바쥬스 주문":
            orderJuice(.strawberryBananaJuice)
        case "망키쥬스 주문":
            orderJuice(.mangoKiwiJuice)
        default:
            break
        }
    }
```

</details>

</br>

### fatalError

**🔥문제점**

- do-catch문을 사용하지 않아도 되는 에러는 `fatalError`를 사용하여 에러처리를 하였지만 의도치 않게 앱이 종료될 수도 있는 위험성이 있었습니다.

<details>
<summary>본문 코드 내용</summary>

### 

```swift
func bringStock(_ fruit: Fruit) -> Int {
    guard let stock = fruitsStock[fruit] else { fatalError("과일이 없습니다.") }

    return stock
}
```

</details>

</br>

**🧯해결방안**

- `fatalError`를 사용하지 않고 `return 0`을 사용하여, 입력받은 과일이 없다면 재고를 0을 주는 방법으로 처리하였습니다.

<details>
<summary>본문 코드 내용</summary>

### 

```swift
func bringStock(_ fruit: Fruit) -> Int {
    guard let stock = fruitsStock[fruit] else { return 0 }
        
    return stock
}
```
    
</details>

---

</br>

<a id="6."></a>

## 6. 참고 링크

[Apple-pushViewController](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621887-pushviewcontroller)
[Apple-FatalError](https://developer.apple.com/documentation/swift/fatalerror(_:file:line:))

[블로그-화면전환](https://velog.io/@5n_tak/Swift-ViewController-%ED%99%94%EB%A9%B4%EC%A0%84%ED%99%98-%EB%B0%A9%EB%B2%95)
[블로그-FatalError](https://gwangyonglee.tistory.com/52)

---

</br>

<a id="7."></a>

## 7. 팀 회고

### 👏🏻 우리팀이 잘한 점

- 처음 팀 배정 됐을 때부터 각자의 의견을 적극적으로 서로에게 공유하며 프로젝트에 방향성에 대해 충분히 논의를 해온 덕분에 큰 의견 차이 없이 매끄럽게 팀활동을 이어올 수 있었던 것 같습니다.
- 그라운드룰에 맞게 팀프로젝트를 잘 수행하였습니다.

### 👊🏻 우리팀이 개선할 점

- 코드의 확장성 재사용성에 대해 고민하는 시간이 부족했던 것 같습니다.

</br>

### 👍 서로에게 좋았던 점 피드백

### Dear. Erick

```
- 저와 달리 에릭이 ios개발 경험이 있으셔서 함께 프로젝트를 하면서 배운 점도 많았고 저도 그만큼 부족함을 많이 느겼던 것 같습니다. 앞으로 남은 기간동안 팀에 좋은 결과를 가져다 주기 위해 저의 부족함을 메꿔나가겠습니다.
```

### Dear. JusBug

```
- 제가 부족했던 에러처리와 do-catch문 작성 등에 대해 잘 알려주셨습니다.
- 매일 온화하게 대해주시고 제 의견도 잘 수용해주셨습니다.
```

</br>

### :pray: 서로에게 아쉬웠던 점 피드백

### Dear. Erick

```
- 함께 순서도를 작성하면서 각자의 코드 구성의 방향성을 제시하였고 처음엔 제가 제안했던 방향으로 딕셔너리로 과일과 재고를 관리하기로 했으나 에릭은 해당 Key, Value 값에 접근하기가 번거로워져 사용자 정의 타입으로 전환하는 것을 권유하였습니다. 하지만 Som은 유지보수성과 확장성 측면에서 전자로 관리하는 게 좋다고 말씀하셔서 다시 코드를 수정하는 일이 있었습니다. 앞으로는 Som의 리뷰대로 지적해 준 내용을 준수하며 효율적으로 시간을 관리하면서 팀에게 더욱 좋은 영향을 줄 거 같습니다.
```

### Dear. JusBug
```
- 생각하는 시간이 기셔서, 코드 구현 방향에 대해 짧게 생각 정리를 하시면 좋을 것 같습니다.
```
