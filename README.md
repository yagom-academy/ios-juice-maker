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
