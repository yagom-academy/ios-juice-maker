# ios-juice-maker
# 팀원
- minseong, papri

# 구현함수
- `makeJuice()`: 음료를 입력받아 음료제작이 가능한지 확인 후 가능하면 제작. 제작에 성공하면 `true`, 실패하면 `false` 리턴
- `canDecreaseFruitStock()`: 음료제작에 필요한 양만큼 재고를 깎고, 필요한 재료의 재고가 부족하다면 `error`를 `throw`한다. 만약 재고가 충분해 재고를 깎을 수 있다면, `inventory`에 재고상황을 반영하고 `ture`를 리턴
- `updateFruitsStock()`: 과일 `inventory`의 현황을 `VC`의 `UILabel`에 각각 표시
- `showSuccessAlert()`: 과일 제조에 성공했을 때 `Alert`표시
- `showFailAlert()`: 과일 제조에 실패했을 때 `Alert`표시 후 재고 수정시 화면전환

# 고민한 점 및 해결
- 각각의 과일의 재고를 표시하는 `UILabel`을 한번에 관리할 수 있게 하고 싶었습니다
> `IBOutlet Collection`을 사용했습니다.
- `ViewControl`에서 과일 수량 표시하는 `label`의 값을 띄워줘야 하는데 어떻게 `FruitStore` 인벤토리의 값을 가져올지 고민하였습니다.
> 싱글턴패턴을 이용하여 `FruitStore` 인벤토리에 접근하여 반복문을 통해  각각의 `Label` 세팅해 주었습니다
- 주문버튼을 눌렀을 때 재고가 있을 경우와 없을 경우를 어떻게 구별해야 할지 고민하였습니다.
> `makeJuice()`의 `return` 타입을 `bool`타입으로 주어 제조에 성공한 경우와 실패한 경우를 구분해 주었습니다.
- 각각의 쥬스주문버튼의 기능들이 중복이 되는데 하나의 액션으로 다양한 버튼의 기능을 수행할 수 있게 만드는 방법이 있을까요?? 혹시;;; 있다면 그 (정보or기법??)에대한 키워드등을 얻을 수 있을까요??😭
- 과일의 재고가 변경될 때마다 `updateFruitsStock()`를 실행해 주었습니다 매번 실행해 주는게 비효율적이라는 생각이 들었습니다 더 좋은 방법이 있을까요???
