
# ⛺️iOS 커리어 스타터 캠프

## 목차
1. Ground Rules
2. 쥬스 메이커 프로젝트
3. 요구 사항
4. UML
5. 구현 내용

### ‼️ Ground Rules
---
매일 아침 10시, 디스코드에서 진행
어제의 활동 리뷰
오늘 활동 예정 사항 / 목표
자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
컨디션 😰
공유하고 싶은 이슈, 꿀팁 공유
진행시간은 최대 1시간을 넘기지 않기 ⏱
상황에 따라 조정 가능

### 🧋 쥬스 메이커 프로젝트
---
🗓 기간 : 2022.02.21 ~ 2022.03.11(18d)
🗓 팀원 : 두두, 원툴
📝 설명 : 쥬스 메이커 프로그램 (iOS App)

## [STEP 1]

### 구현 내용
---
#### struct JuiceMaker
`makeJuice()` : 쥬스를 만드는 함수  
`deleteStockFromRecipeRequired()` : 레시피에 적힌 만큼 재고에서 삭제하는 함수  
#### class FruitStore
`canMakeJuice()` : 레시피대로 쥬스를 만들수 있는지 재고를 확인하는 함수  
`changeFruitStock()` : fruit의 재고를 amount 만큼 낮추는 함수  


## [STEP 2]

### 구현 내용
---
`updateLabel()` : 과일의 재고를 Label에 표시해주는 함수  
`updateMultipleLabel()` : 과일들의 재고를 Label에 표시해주는 함수
`didTapStockEditButton()` : 재고 관리 버튼과 연결된 함수  
`moveToStockViewController()` : StockViewController를 modal로 띄워주는 함수  
`order()` : 쥬스 주문 시, 실행되는 함수  
`findJuice()` : 어떤 버튼이 눌렸는지, 판단해서 만들 Juice를 retun해주는 함수  
`showSotckErrorAlert()` :  쥬스 재고가 부족할때 alert을 띄우는 함수  
`showAlert()` : alert을 띄우는 함수 
`showErrorAlert()` : 확인 버튼만 존재하는 ErrorAlert을 띄우는 함수
`showCompleteAlert()` : 쥬스가 완성되었을 때 Alert을 띄우는 함수
`findLabel()` : 과일에 맞는 Label을 찾는 함수
`enum AlertMessage` : AlertController에 쓰이는 문자열들을 관리하기 위한 namespace  


