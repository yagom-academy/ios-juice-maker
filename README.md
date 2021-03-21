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
- Step 1 PR review 코멘트 확인
### 3/15
- Notification Center, addObserver, 딕셔너리, 매개변수 학습
### 3/16
- Step 1 PR review 추가 코멘트 확인
### 3/17
- Step 2 코드 작성
### 3/18
- 생명주기 활동학습
- Step 2 PR 보냄
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
![juiceMaker](https://user-images.githubusercontent.com/35272802/111892136-e71be280-8a3b-11eb-9224-2fa6dd0f1525.gif)
- 우측 상단의 재고 수정 버튼을 클릭하면 아래의 재고 추가 화면으로 이동
- Segue의 Show(Push) 방식으로 화면 전환


- 닫기 버튼 클릭할 시 처음의 주문 화면으로 돌아감
- UIButton을 활용하여 StockAddViewController에서 이전의 뷰 컨트롤러를 호출 적용

- 재고가 있어서 주문이 성공적으로 이뤄졌을 때의 alert


- UIAlertController를 활용하여 재고 부족시 추가할지 아닐지 선택할 수 있는 alert 표시
- '예'를 선택시 재고 수정 화면으로 이동
- HIG에 근거하여 cancel 버튼 좌측에 위치


- UIStepper를 활용하여 +, - 를 누르면 재고가 각각 1개씩 증가 혹은 감소함

## 피드백 및 고민해볼 점
### 옵셔널 강제 추출 지양하기
재고가 없을때 종료가 되진 않음. 그러나 키 .strawberry에 해당하는 value를 못 찾았는 경우가 발생할 수도 있음.

### 네이밍
1. 메서드
- @IBAction func touchUpCloseButton(_ sender: UIButton) 
- IBAction 메서드를 여기처럼 이벤트를 설명하는 방식으로 지을 수도 있지만, 일반적인 메서드 명을 지을때처럼 메서드의 동작을 설명하는 이름으로 짓기도 함. 
- 예를 들어 여기서는 "재고 화면을 닫는다" 정도가 됨.
- checkStock "And" MakeJuice 메서드 명에 And가 들어간다는 건 좋지는 않음. 좀 더 포괄해서 설명할 수 있는 이름을 고민해볼 것.
- Bool 타입의 메서드는 보통 prefix로 is 또는 has 등등을 붙입니다. (예시, isStockAvailable)
2. 뷰컨트롤러
- 기본으로 생성되는 ViewController도 현재 화면을 잘 설명할 수 있는 이름으로 바꿔보기.

### private 적용
- ViewController에서 갖고 있는 프로퍼티들도 외부에서 접근하지 못하게 private으로 숨겨 주는게 좋음.

### 함수 기능 별로 분리하기
- 하나의 함수에서 쥬스 제공 알림창 띄우기, 재고 부족 경고창 띄우기 두 가지 일을 하고 있음.
- 하나의 함수에서 여러 일을 하게 된다면, 읽는 사람 입장에서는 두 가지 목적을 가진 코드가 혼재되어 있어 이해하는 데에 좀 더 시간을 소요하게 됨. 
- 또한 쥬스 제공 알림창과 재고 부족 경고창은 alert라는 공통점 외에는 로직적으로도 서로 연관되어 있지 않음.

### 하나의 액션에 여러 버튼을 처리하는 방법
- 추상화한 쥬스 타입을 만들고, 세분화하여 각각의 쥬스 타입들을 만들기.
- 버튼도 추상화하고 각 쥬스 버튼 타입들을 만들기.
- IBOutlet Collection을 이용해서 버튼을 배열로 관리.

- (이제부터가 중요) 각 세부 버튼에 해당되는 쥬스를 연결. 
- switch 문 사용 등의 분기처리 없이 할 수 있음.
- 세분화된 쥬스 타입의 인스턴스를 어디서 생성할지가 요점.

### if 문자열 비교 지양하기 
- 작은 실수로도 오동작하기 쉽고, 실수한 결과도 (컴파일 타임이 아닌) 런타임에 나타나며, 사용 측면에서도 긴 문자열을 입력해야 해서 사용성이 떨어짐. 
- 이럴 때 해결하는 방법은 함수가 여러 일을 하지 않는지 체크하고, 만약 그렇다면 분리
- 함수의 파라미터 타입을 enum으로 만들어 입력을 제한.

### 기타: 화면을 구현했을 땐 스크린샷을 코멘트에 함께 첨부하기 
- 리뷰어의 이해도를 높여줘서 빠르고 정확한 피드백을 받을 수 있음
