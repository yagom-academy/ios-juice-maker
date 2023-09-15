# 🥤 쥬스 메이커

---
## 🔎 목차
- [팀원](#팀원)
- [타임라인](#타임라인)
- [트러블 슈팅](#트러블-슈팅)
- [참고 링크](#참고-링크)

---
## 👥 팀원
|Kiseok🐶|쥬봉이🐱|
|---|---|
|<img src="https://cdn.discordapp.com/attachments/1146018665737752590/1152107904191701013/IMG_1011.png" width="200" height="200">|<img src="https://avatars.githubusercontent.com/u/126065608?v=4" width="200" height="200">|
|[GitHub](https://github.com/carti1108)|[GitHub](https://github.com/jyubong)|

## 📅 타임라인
|날짜|내용|
|------|---|
|23.09.04|- 공식문서 공부<br> - 그라운드 룰 정하기|
|23.09.05|- juicemaker, fruitstore, fruit, juicemenu  타입  정의<br> - 쥬스 만드는 메소드, 과일 소모시키는 메소드 구현 <br>- Step1 PR|
|23.09.08|- 과일 소모시키는 메소드 기능 분리 <br> - 레시피 함수 -> 주스메뉴 열거형에 연산프로퍼티로 수정 <br>- ReadMe 작성|

## 🔥 트러블 슈팅
- FruitStore의 decreaseStock메서드는 과일 재고를 확인하고 문제가 없으면 과일 수량을 낮추는 함수입니다. 과일을 2개 소비해야할때 두 과일의 재고를 먼저 확인하고 수량을 낮추어주어야하는데, 이를 구현해보니 `for-loop 2개`를 사용하였는데 코드를 refactoring 할수 있을 것 같아 시도해보았습니다.
-> 첫번째 for-in 루프가 isInvalidStock 함수와 기능이 비슷해 isInvalidStock으로 옮겨주었습니다.

**수정 전 코드**
```swift
func decreaseStock(fruits: [Fruit : Int]) -> Bool {
    for (fruit, quantity) in fruits {
        guard checkStock(fruit: fruit, quantity: quantity) else {
            return false
        }
    }

    for (fruit, quantity) in fruits {
        guard let stock = fruits[fruit] else {
            return false
        }
        self.fruits[fruit] = stock - quantity
    }

    return true
}
```

**수정 후 코드**
```swift
private func isValidStock(recipe: [Fruit: Int]) -> Bool {
    for (fruit, quantity) in recipe {
        guard let stock = fruits[fruit], stock >= quantity else {
            return false
        }
    }

    return true
}

func isDecreasedStock(recipe: [Fruit: Int]) -> Bool {
    guard isValidStock(recipe: recipe) else {
        return false
    }
    
// (코드 수정 전과 동일)
}
```


## 📚 참고 링크
[애플 공식문서 Hashable](https://developer.apple.com/documentation/swift/hashable)
