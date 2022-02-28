# ios-juice-maker
# 팀원
- minseong, papri
# UML
<img src ="https://user-images.githubusercontent.com/94295586/155451528-fa9ba753-61da-4ce2-9307-f750c8073a50.png" width = 700 height = 500>

# 구현함수
- `makeJuice()`: 음료를 입력받아 음료제작이 가능한지 확인 후 가능하면 제작
- `isEnoughStock()`: 음료에 필요한 재료가 있는지 확인
- `decreaseFruitStock()`: 음료제작에 필요한 재료만큼  과일저장소의 정보최신화
# 고민한 점
- `Enum Fruit`를 `FruitStore`에 종속되게 해줄지 아니면 파일을 따로 빼줄지 고민했습니다. `FruitStore`가 과일종류와 재고의 관한 목록만 있으면 된다고 판단하여 파일을 분리했습니다.
- `Class FruitStore`에서 과일과 과일재고의 구현. 
  - a. `enum Fruit`을 만들어 해당 과일과 재고를 `Dictionary`의 `key`와 `index`로 두어 관리할지
  - b. `Fruit`이란 구조체를 만들어 그 안에 과일이름과 과일재고를 넣고 `struct Fruit`객체들의 배열로 관리할지 
> b를 선택하면 과일 객체를 하나하나 다 만들어줘서 배열에 넣어야 하고, 과일 값을 줄일 때 배열.과일구조체인스턴스.재고 << 이렇게 접근해야해서, a 방식을 선택하였습니다. 
> 추후에 `FruitStore`에서 취급하는 과일의 종류가 다양해지더라도 `Fruit enum`에 `case`를 추가하면 되기 때문에 a방식으로 결정했습니다.
- 매직넘버
  - `Class FruitSore`에서 초기화를 진행할 때, 초기 재고인 10이 매직넘버이기 때문에 `DefaultSetting`이란 `enum`을 만들어 해결하였습니다.
- 접근지정자
  - `Class FruitStore`의 재고관리는 `decreaseFruitQuantity()`메소드를 통해 `private`한 과일인벤토리에 접근하는 식으로 이뤄져야겠다고 생각했습니다. 
  - 과일을 만드는 것 외에 다른 이유로 과일인벤토리를 건들지 못하게 만들어야 한다고 생각했습니다.
- 에러처리 - `throw`를 하는 부분과 `catch`를 할 부분
  - 재고를 검사하는 동시에 `Error`를 던져줄지 검사가 끝나고 `Bool`값으로 반환받아 그 결과값에 따라서 `Error`를 던져줄지 고민하였습니다.
> 재고를 확인하는 부분은 `FruitStore`에서 진행해야 한다고 생각하여 `Error`를 `isEnoughStock()`서 던져주었습니다.
- 네이밍
  - `JuiceMakeError`, `JuiceMakerError`라는 네이밍을 고민하였습니다
> 쥬스를 만드는 과정에서 에러가 생기는 것이기 때문에 JuiceMakeError라는 이름을 선택하였습니다.
# 조언을 얻고 싶은 부분
```swift
func decreaseFruitStock(by juiceIngredient: [Fruit : Int]) {
    for (fruit, requiredAmount) in juiceIngredient {
        if var fruitStoreStock = fruitsInventory[fruit] {
            fruitStoreStock -= requiredAmount
            fruitsInventory[fruit] = fruitStoreStock
        }
    }
}
```
- 위 코드의 네이밍을 고민을 많이 했는데 가독성이 좋은지 조언 부탁드립니다! 
- 이번 프로젝트를 수행함에 있어 읽고 참고해야 하는 문서를 이틀간 읽고 프로젝트를 실행하였습니다, 막상 시작하려니 알고 있는 지식들을 어떻게 활용해야 할지 어떤 방향으로 갈지 계속 방황했습니다. 어떤식으로 공부를 해야 할까요?? 조언을 얻고 싶습니다.
