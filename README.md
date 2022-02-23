# 쥬스메이커 프로젝트 저장소
> 프로젝트 기간 2022.02.21 ~ 2022.03.11 <br/>
팀원 : [@grumpy-sw](https://github.com/grumpy-sw) [@cathy171](https://github.com/cathy171)

- [쥬스 메이커](#쥬스-메이커)
- [STEP 1](#쥬스-메이커-타입-정의)
    + [기능 구현](#step-1-기능-구현)
    + [고민했던 것](#step-1-고민했던-것들)
    + [배운 개념](#step-1-배운-개념)
    + [PR 후 개선사항](#step-1-pr-후-개선사항)

## 쥬스 메이커

## [STEP 1] 쥬스 메이커 타입 정의
- FruitStore.swift 파일에 과일의 재고를 관리하는 FruitStore 타입을 정의합니다
- JuiceMaker.swift 파일에 다음의 조건을 충족하는 JuiceMaker 타입을 정의합니다
- (Optional) 필요한 경우 오류처리(throw, try-catch)를 구현합니다


## STEP 1 기능 구현
- ```FruitStore```
    - ```Fruit```: 과일의 종류를 담고 있는 열거형
    - ```defaultStock```: 과일들의 초기 재고 
    - ```fruits```: 과일들의 종류와 재고 상황을 담고 있는 딕셔너리
    - ```increaseStock(fruit, amount)```: ```amount```만큼 ```fruit```의 재고를 증가시키는 함수
    - ```decreaseStock(fruit, amount)```: ```amount```만큼 ```fruit```의 재고를 감소시키는 함수

    
- ```JuiceMaker``` 
    - ```fruitStore```: JuiceMaker가 소유하고 있는 FruitStore
    - ```JuiceRecipe``` : dictionary를 선언하는 typealias사용
    - ```Juice```: 주스의 종류를 담고 있는 열거형으로 표현, recipe 함수로 필요한 재료들의 개수를 반환
    - ```makeJuice```: 재료가 있는지 확인하여 에러처리를 하거나 주스를 만드는 함수
    - ```hasEnoughFruitStock```: 재고가 충분한지 확인하는 함수
    - ```consumeFruitStock```: 레시피를 따라 필요한 재료를 소모하는 함수

- ```JuiceError```
    - ```notEnoughStock```: 재고가 부족한 경우의 에러
    
## STEP 1 고민했던 것들
1. JuiceMaker의 타입이 구조체이고 FruitStore의 타입이 클래스인 이유
2. 함수의 Naming이 적절한지
3. Juice의 recipe의 반환 타입을 튜플로 할 것인지, 딕셔너리로 할 것인지
4. FruitStore 생성 시 과일 딕셔너리 fruits의 초기화 방법
5. 재고 부족 외에 처리할 에러가 없는지
6. 열거형을 정의할 위치(사용자 타입 내부/외부)


## STEP 1 배운 개념
- struct와 class
- MVC 구조
- typeAlias
- Error Handling
- 열거형과 Caseiterable 프로토콜
- 배열과 튜플, 딕셔너리

## STEP 1 PR 후 개선사항
