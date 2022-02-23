# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

# 쥬스메이커
- 팀원: 쿼카, 도니
- 리뷰어: 개굴

# UML
![juiceMaker_Step1_UML](https://user-images.githubusercontent.com/74251593/155289035-e6babcc5-e609-425c-b967-0806c1ee272c.png)

# 고민되었던점
- class와 struct 사용에대해 고민했습니다.
- FruitStore내에 Fruit타입을 두는게 좋을지에 대해서 FruitStore안에 과일이 있다고 생각되어 중첩타입으로 묶었습니다.
- changeFruitQuantity()메서드에대한 재사용성을 고려했습니다. plus를 시키는 메서드와 minus를 시키는 메서드 둘다 만들기보다 minus를 해야하는 수에 - 를 붙여서 마이너스인 경우는 차감하고 플러스인경우는 더하게끔 구현을 해보았습니다.
# 해결되지않은점
- 오류처리는 공식문서를 통해 학습하고 구현할 예정입니다.

# 조언을 얻고 싶은 부분
- subtractFruitQuantity메서드 내 self.fruitStore.changeFruitQuantity코드가 중복되는데 코드 개선을 해볼수있을까요 ?
- FruitStore내에 있는 fruits 프로퍼티의 네이밍이 외부에서 사용할때 자연스럽게 읽혀지는것도 같은데 fruits라는게 사실 과일들이라는 의미로 파악이되는데 과일과 수량을 다 포함하고있어서 이게 적절한네이밍일지 궁금합니다.
- 타입간 역할분리에대한 기준을 나누는것이 너무 어렵네요 ㅜㅜ 혹시 JuiceMaker와 FruitStore의 메서드를 구분하는데 역할 분리를 할 수 있는 기준을 만든다면 어떻게 생각해볼 수 있을까요 ?
- class가 struct의 사용목적을 학습했으나 현재로써 FruitStore를 struct로 바꿔도 동작에는 이상이 없었는데 class로 지정이되어있는 이유가 궁금하다.

# 문제해결

# 학습키워드
- Classes And Struture
- Initialization, Deinit
- Type Casting
- Erro Handling
