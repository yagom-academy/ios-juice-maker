# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소


### STEP1. 주스 메이커 타입 정의


### 1. 생성할 타입 - Fruits(enum), FruitJuice(enum), ErrorMessage, FruitStore(struct), JuiceMaker(struct)


### Fruits(enum):
딸기,바나나,파인애플,키위,망고


### FruitJuice(enum):
- 딸기주스,바나나주스,키위주스,파인애플주스,딸바주스,망고주스,망고키위주스
- 레시피 저장 변수 (연관값??)

### FruitStore(구조체)
- 프로퍼티: 과일 재고를 딕셔너리로 저장하는 변수, 기준을 정해놓은 변수
- 메서드: 수량 변경하는 함수, 기준을 정해놓고 그 개수만큼만 주문하도록 하는 함수
    

### JuiceMaker(구조체)
- 프로퍼티: 주문받을 메뉴를 저장할 변수, 주문 개수
- 메서드: 주문받는 함수, 주스를 제조하는 함수, 남은 재고로 만들 수 있는 과일주스 알려주는 함수

![Class Diagram](https://user-images.githubusercontent.com/102569735/165211439-7dc467d8-e6e7-4d3f-a1ed-e517b555cd38.png)
