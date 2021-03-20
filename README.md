# JuiceMaker
## 캠퍼
Sunny, Steven

## 기간
- 2021/03/08 ~ 2021/03/21

## 타임라인
### 3/8 
- 플로우 차트, 클래스 다이어 그램 그리기
- step1 코드 작성 
### 3/9
- playground 코딩 배우기 1(조건문, 반복문, 함수) 공부
### 3/10
- playground 코딩 배우기 2(타입, 인스턴스, 프로퍼티, 메소드, 클래스, 구조체)
### 3/11
- 클래스, enum, 옵셔널, 이니셜라이져, 매게변수 학습
- step1 코드 수정 후 PR 보냄
### 3/12
- step1 PR review 코멘트 확인
### 3/15
- Notification Center, addObserver, 딕셔너리, 매개변수 학습
### 3/16
- step1 PR review 추가 코멘트 확인
### 3/17
- step2 코드 작성
### 3/18
- 생명주기 활동학습
- step2 PR 보냄
- 코드 리펙토링(재고 확인과 주스 만들기를 하나의 함수로 합침)
### 3/19
- viewcontroller간에 데이터 전송 공부 및 프로젝트에 적용(과일 재고에 적용)
- stepper 공부 및 구현
- view 생명주기 공부

# Step 1
## FlowChart
![flowchart_(1)](https://user-images.githubusercontent.com/35272802/110903308-94ab3980-834a-11eb-9151-713eec617746.png)

## Class diagram
![classDiagram](https://user-images.githubusercontent.com/35272802/110903528-f075c280-834a-11eb-9851-03067d4ddea6.jpeg)

## 피드백 및 개선 내용 (1)
- 과일을 어떤 타입으로 할지 고민하다가 결국에는 enum을 선택
- enum을 선택한 이유: 프로젝트 요구 사항에 새로운 종류의 과일이 추가 되는 것이 없음.
- 문제점: 과일 타입에서 rawValue를 사용하고 싶은 경우가 생김
- JuiceMaker의 프로터피로 fruitStocks 라는 과일의 수량을 배열을 선언 후 rawValue를 사용해서 인덱스로 접근
- 과일 타입 안에 index를 선언해서 rawValue를 리턴 (코드 9-15줄 참고)

-  Fruit이 rawValue로 Int를 사용하지 않도록 개선
-  이유: rawValue를 사용하며 은닉화에 좋지 않음
-  배열을 딕셔너리로 바꿔줌
-  fruitStock을 숫자로 표현하지 않고 [Fruit: Int] 타입으로 구현 
-  checkStock 메서드에서도 인덱스로 접근하지 않고 과일 자체를 키로 넣어서 확인 가능

## 피드백 및 개선 내용 (2)
- 메서드는 호출하는 쪽 기준으로 어떻게 사용되는지도 고려해서 이름 짓기
- checkStock(fruit: Fruit)을 juiceMaker.checkStock(of: .kiwi)으로 수정

## 피드백 및 개선 내용 (3)
- 메서드 호출하는 쪽 기준으로 생각할 때 단어 반복 지양하기 
- makeFruitJuice(juice: FruitJuice) -> Juice라는 단어가 두 번 반복
- 스위프트에서는 argument label도 함수 이름에 포함된다는 걸 고려해서 작성하기
- argument label을 쓰지 않는게 적합하다고 생각하여 _를 사용해서 생략함

# Step 2
## Storyboard
<img width="1075" alt="Screen Shot 2021-03-20 at 1 49 18 PM" src="https://user-images.githubusercontent.com/70262005/111859299-3b16c080-8983-11eb-892d-2671eb3059b0.png">

## 실행 화면
![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-03-20 at 17 52 06](https://user-images.githubusercontent.com/70262005/111864773-4cbd8f80-89a6-11eb-851c-c1fb00a0d843.png)
- 우측 상단의 재고 수정 버튼을 클릭하면 아래의 재고 추가 화면으로 이동
- Segue의 Show(Push) 방식으로 화면 전환

![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-03-20 at 17 52 14](https://user-images.githubusercontent.com/70262005/111864805-770f4d00-89a6-11eb-9861-047798748ef8.png)
- 닫기 버튼 클릭할 시 처음의 주문 화면으로 돌아감
- UIButton을 활용하여 StockAddViewController에서 이전의 뷰 컨트롤러를 호출 적용

![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-03-20 at 17 52 33](https://user-images.githubusercontent.com/70262005/111864866-dc633e00-89a6-11eb-9e00-435f4ece142a.png)
- 재고가 있어서 주문이 성공적으로 이뤄졌을 때의 alert

![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-03-20 at 17 52 43](https://user-images.githubusercontent.com/70262005/111864889-ff8ded80-89a6-11eb-92ea-5be7876412a9.png)
- UIAlertController를 활용하여 재고 부족시 추가할지 아닐지 선택할 수 있는 alert 표시
- '예'를 선택시 재고 수정 화면으로 이동
- HIG에 근거하여 cancel 버튼 좌측에 위치

![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-03-20 at 17 53 00](https://user-images.githubusercontent.com/70262005/111864919-2ba96e80-89a7-11eb-8fa8-b50e392b6670.png)
- UIStepper를 활용하여 +, - 를 누르면 재고가 각각 1개씨 증가 혹은 감소함


