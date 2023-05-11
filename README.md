# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

- 타임 라인
- 23.05.09: RequiredFruitQuantity 타입 추가, 쥬스제조시 필요한 과일 수량 변경 함수 change() 추가
- 주스생성 시 과일재고 체크로직 수정
- FruitStore() 변수 네이밍 수정, 프라이빗진행
- addStoredFruit() 함수 네이밍 변경 -> increaseFruitStock()
- invalidInputError 에러 추가
- FruitName() 타입 생성
- JuiceName() 타입 생성
- FruitStoreError-> case Error 추가
- JuiceMaker()있던 checkFruitStock()함수 이동 -> FruitStore()
- JuiceName() 확인 함수 추가
- JuiceMaker() start() 함수-> makeJuice() 함수 변경 진행
- checkFruitStock() 함수 전달인자 타입 변경(Stirng-> JuiceName)
- checkFruitStock() 조건 변경
- 23.5.11
- 재고채크 함수 변경, 재고 증가,감소 함수 변경
- 주스 제조시 과일 감소 함수 생성



```swift
    func decrease(_ juice: Juice) {
        let recipe: [Fruit: Int] = juice.recipe
        for (key, value) in recipe {
            if let stock = self.stock[key] {
                self.stock[key] = stock - value
            }
        }
    }
```

```swift
        for (key, value) in recipe {
            if let stock = self.stock[key] {
                self.stock[key] -= value
            }
        }
```
                self.stock[key] = stock - value
                self.stock[key] -= value
                위 코드와 아래 코드에 차이
                
                타입을 더 나누지 않아서 코드를 모아서 사용시에 네이밍 어색합니다.. 전치사를 써도 어색하네요...
                여기서 타입을 더 나눠보는게 좋을까요?
