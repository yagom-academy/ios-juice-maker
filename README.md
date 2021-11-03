# 쥬스 메이커 프로젝트

## 프로젝트 소개
1. 과일을 관리하는 FruitStore와 해당 과일로 레시피에 따라 과일쥬스를 제조하는 JuiceMaker가 있습니다.
1. FruitStore의 관리 대상 과일의 종류는 딸기, 바나나, 파인애플, 키위, 망고입니다. 초기 재고는 모두 10개입니다.
1. '쥬스 주문' View에서 '재고 수정' 버튼을 탭하면, '재고 추가' View로 이동 (Modal 적용)합니다.
1. '쥬스 주문' View에서 '쥬스 주문' 버튼을 탭하면, 현재 과일의 재고에 따라 Alert를 표시합니다.
1. 만약 과일 재고가 부족하면 JuiceMaker에서 쥬스를 제조할 수 없습니다. 과일 재고 부족 시 표시되는 Alert의 버튼을 통해 '재고 추가'View로 이동 (Modal 적용)합니다.
1. '재고 추가' View에서 Stepper를 통해 각 과일의 수량을 변경할 수 있습니다. 변경된 재고량은 Label에 반영합니다.
1. '재고 추가' View에서 '닫기' 버튼을 탭하면, '쥬스 주문' View로 이동 (Modal 적용)합니다.
1. Auto Layout을 통해 여러 기기에서 사용이 가능합니다.

### 그라운드 룰
   - 공식문서 읽기 : 매일 10시~12시
   - 회의 시간 : 13시~23시 30분
   - 스크럼 (공식문서 읽고 코드에 적용할 내용 공유)
   - 커밋 메시지 컨벤션 : 카르마 스타일 
   - Git 커밋 템플릿 및 Git Issue 활용

### 프로젝트 참여자
   - 팀원 : 아샌 @ICS-Asan, 애플사이다 @just1103
   - 리뷰어 : 그린 @GREENOVER

### 프로젝트 일정
* 1주차 - STEP1
   - 10/18 (월) 스크럼, 프로젝트 확인, 진행 이전 세부사항 설정
   - 10/19 (화) 스크럼, 짝 프로그래밍
   - 10/20 (수) 스크럼, 짝 프로그래밍, PR 요청
* 2주차 - STEP2
   - 10/25 (월) 스크럼, 프로젝트 확인, Alert 및 ViewController 공식문서 읽기
   - 10/26 (화) 스크럼, 화면 전환 구현, Xcode 오류 해결
   - 10/27 (수) 스크럼, Label/Alert 구현
   - 10/28 (목) 스크럼, 최종 수정 및 PR 요청
* 3주차 - STEP3
   - 11/01 (월) 스크럼, Stepper 적용, Label에 재고 반영
   - 11/02 (화) 스크럼, 최종 수정 및 PR 요청

## STEP1
### 구현 내용
   - 과일의 특성을 관리하는 Fruit 구조체, 과일의 재고를 관리하는 FruitStore 클래스 생성
   - 과일쥬스의 특성을 관리하는 Juice 구조체, 과일쥬스를 제조하는 JuiceMaker 구조체 생성
   - 유효하지 않은 과일/쥬스를 선택하거나, 쥬스 제조 시 과일 재고가 부족할 때 발생하는 오류를 처리함

### 고려사항
* 주요 프로퍼티
   - inventory : FruitStore의 과일 재고를 저장함. Fruit 타입의 배열로 선언함
   - recipe : 쥬스 종류에 따라 쥬스 레시피를 저장하기 위해 [Juice.JuiceName: [ingredient]] 타입의 딕셔너리로 선언함

* 주요 메서드
   - addStock 및 subtractStock : 유효한 선택인지 확인하고, 유효하면 n개의 재고 수량을 변경함 (subtractStock 메서드에서 재고가 부족할 경우, 오류가 발생함)
   - make : 사용자가 원하는 종류의 쥬스를 레시피에 따라 제조함. 유효한 메뉴가 아니면 오류가 발생함

### 키워드 
   - Class/Structure/Enum, Access Control, Computed Property, LocalizedError, Dictionary/Array, Initializer

## STEP2
### 구현 내용
   - "쥬스 주문" View에서 "재고 수정" 버튼을 탭하면 "재고 추가" View로 이동
   - 각각의 쥬스 주문을 터치하면 해당 쥬스를 제조
     1) 과일 재고가 있는 경우, 소모한 재고를 레이블에 반영하고 Alert를 통해 성공 메시지 표시
     2) 과일 재고가 없는 경우, 재고 수정 Alert을 표시하고, "재고 추가" View로 이동하는 버튼과 취소 버튼 표시
   - 추가로 구현한 기능 : 재고 수정 Alert 메시지에서 부족한 재고량을 보여줌

### 고려사항
* 기능
   - 오류 처리 
     Model의 do-catch문을 오류를 throw하도록 수정하고, ViewController에서 오류를 catch하여 처리함
   - 화면 이동방식 
     "쥬스 주문" View => "재고 추가" View (엄밀히는 두번째 NavigationController으로 이동함. 따라서 Modal로 이동했지만 Navigation Bar Button을 사용 가능함)
        1) "쥬스 주문" View에서 "재고 수정" 버튼을 탭하면 "재고 추가" View로 이동할 때 : Segue를 통한 Modal로 화면 전환
        2) "쥬스 주문" View에서 Alert에서 재고수정 버튼을 탭하면 "재고 추가" View로 이동할 때 : present 메서드를 통한 Modal로 화면 전환 
        - Modal로 구현한 이유는    
            첫째, 1번과 2번이 동일한 화면이므로 일관성 있게 Modal로 통일하는 것이 좋으며,    
            둘째, "쥬스 주문" 및 "재고 수정" 기능이 정보 흐름이 깊어지는 형태가 아니라, 임시로 화면을 띄워 재고 수정 작업을 실행하기 때문
   - FruitStore 클래스에 Singleton 적용
   - NotificationCenter를 적용하여 재고가 변경된 과일의 Label만 수정함(post 메서드의 userInfo 매개변수 활용)

* OrderJuiceViewController의 주요 프로퍼티
   - 스토리보드의 UILabel을 제어하기 위해 @IBOutlet 변수 생성

* OrderJuiceViewController의 주요 메서드
   - 각각의 쥬스 주문 버튼에 연결된 @IBAction 함수 생성
   - initializeLabel : Label에 전체 과일 재고를 반영함
   - refreshStockLabel : Notification의 userInfo 매개변수로 받은 과일에 해당하는 레이블을 변경
   - makeJuice : 오류 처리를 위해 do-catch문을 사용했고, 상황에 맞는 Alert를 표시함

### 키워드
   - UIAlert, UILabel, Modality, Navigation Bar/Bar Button, Error Handling, Storyboard Unrecognized selector 오류 해결, Singleton Pattern, NotificationCenter

## STEP3
### 구현 내용
   - '재고 추가' View에서 Stepper를 통해 각 과일의 수량을 변경
   - 변경된 재고량은 Label에 반영함
   - IBOutlet Collection을 사용하여 여러 개의 UI요소에 동일한 효과 (과일 재고를 Label에 일괄 반영, Stepper의 value 프로퍼티 값을 일괄 변경)를 적용
   - 추가로 구현한 기능 : 재고 수정 Alert 메시지에서 부족한 재고량 및 과일 종류를 보여줌 

### 고려사항
* 기능
   - FruitStoreError의 lackOfStock case에 연관값을 2개 (fruitName, neededStock) 지정하여, Alert 메시지를 보다 명확하게 표현함 (ex. "딸기"(이)가 10개 부족합니다. 재고를 확인해주세요.")
   - Stepper의 minimumValue 프로퍼티 값을 0으로 설정하여 과일 재고가 0 미만의 값이 되지 않도록 방지함
   - Steppper의 value 프로퍼티 값을 현재 과일 재고로 초기화하고, @IBAction 함수를 통해 사용자가 Stepper를 탭할 때마다 valueChange 이벤트를 발생시켜 변경된 재고량을 Label에 즉각 반영함

* EditStockViewController의 주요 프로퍼티
   - 스토리보드의 UILabel을 제어하기 위해 @IBOutlet 변수 생성
   - 스토리보드의 UIStepper를 제어하기 위해 @IBOutlet 변수 생성
   - 여러 개의 UI요소에 동일한 효과를 적용하기 위해 @IBOutlet Collection 변수 생성

* EditStockViewController의 주요 메서드
   - 각각의 Stepper에 연결된 @IBAction 함수 생성
   - initializeUIElements : 현재 과일 재고를 Label의 텍스트 및 Stepper의 value 프로퍼티에 반영
   - editStock : Stepper에서 valueChange 이벤트가 발생했을 때, 변경된 Stepper의 value 프로퍼티의 값 (changedStock)에서 기존 과일 재고 (currentStock)를 뺀 값을 구함 (stockDifference). 그리고 이 값을 addStock 메서드의 매개변수로 전달하여 최종적으로 과일 재고를 수정함

* 디버깅
   - 2개의 재료를 사용하는 경우 (딸바 쥬스, 망키 쥬스), 레시피 상 2개의 재고 중 두번째 재고가 부족하더라도 첫번째 재고가 소모되는 버그가 발생하여 디버깅함
		 1) 재고의 갯수를 확인하는 함수와 재료를 사용하는 함수 분리
	   1) 함수의 간결성을 위해 함수로 되어 있던 부분을 연산 프로퍼티로 선언

### 키워드 
   - Outlet Collection, UIStepper, Auto Layout, Enum Associate Value
