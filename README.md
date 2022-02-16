# <p align="center"> iOS Juice Maker 

## <p align="center"> [UML] </p>

<div align=center><img src="https://user-images.githubusercontent.com/69520548/154102765-a86f769d-8329-47ca-a362-9465c7d0f7ad.png" width="800" height="400"></div>

---

## [제약사항]
- 코드에 느낌표(!)를 사용하지 않기
- 메서드(or 함수) 내에서 코드 들여쓰기는 최대 1번
- 메서드(or 함수) 내부의 코드는 최대 10줄
- 메서드(or 함수)는 하나의 일만 하도록 구현
- 기능을 구현하기 전에 README.md에 UML을 작성하여 추가
- Swift API Design Guidelines을 지키기
- 코드에 문서화 주석만 남기기
- (RxSwift/RxCocoa 제외)외부 라이브러리를 사용 불가

<br>

---

## [STEP1] 쥬스 메이커 타입 정의

### 1. FruitStore 타입 정의
- 과일의 재고를 관리하는 타입
- FruitStore가 관리하는 과일의 종류
  - 딸기
  - 바나나
  - 파인애플
  - 키위
  - 망고
- 각 과일의 초기 재고 : 10개
- 각 과일의 수량 n개를 변경하는 기능
- 이 외에 더 필요한 기능, 특성, 타입이 있으면 자유롭게 추가

### 2. JuiceMaker 타입 정의
- FruitStore의 과일을 사용해 과일쥬스를 제조
  - 딸기쥬스 : 딸기 16개 소모
  - 바나나쥬스 : 바나나 2개 소모
  - 키위쥬스 : 키위 3개 소모
  - 파인애플 쥬스 : 파인애플 2개 소모
  - 딸바쥬스 : 딸기 10개 + 바나나 1개 소모
  - 망고 쥬스 : 망고 3개 소모
  - 망고키위 쥬스 : 망고 2개 + 키위 1개 소모
- 과일의 재고가 부족하면 과일쥬스 제조 불가
- 필요한 경우 오류처리(throw, try-catch)를 구현
  
<br>

---
