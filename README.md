# 쥬스메이커 프로젝트
> 프로젝트 기간 2022.02.22 ~ 2022.
팀원 : [@malrang](https://github.com/kinggoguma) [@doogie97](https://github.com/doogie97) / 리뷰어 : [@yoo-kie](https://github.com/yoo-kie)

- [프로젝트 팀 규칙](#프로젝트-팀-규칙)
- [UML](#uml)
- [STEP 1 기능 구현](#step-1-기능-구현)
+ [고민했던 것들](#고민했던-것들)
+ [배운 개념](#배운-개념)
+ [PR 후 개선사항](#pr-후-개선사항)

## 프로젝트 팀 규칙
**Ground Rules**
- 프로젝트에 집중하는 시간: 10:00 ~ 19:00
- 밥먹는 시간: 13:00 ~ 14:00
- Commit Message Style: Karma Style
- 의견 눈치보지 말고 얘기하기

**프로젝트 수행이 어려운 시간**
- Doogie: 수: 18:00 이후, 금: 18:00 이후
- malrang: 상관없음

## UML
![UML](https://user-images.githubusercontent.com/82325822/155452091-a370b687-2da7-413a-9b05-436a29170d40.png)

## STEP 1 기능 구현
- JuiceMaker 타입 구현
- 주스 제작 함수(makeJuice)
- 재고 관리 함수(manageStock)
-> do - catch 문을 이용한 에러 관리.

- FruitStore 타입 구현
- 재고 비교 함수(checkStock) : 쥬스 타입에서 리턴되는 딕셔너리를 for구문을 통해 현재 재고와 필요 재료를 비교하는 기능
- 재고 계산 함수(calculateStock): 재고를 n개만큼 더하거나 뺄수 있는 기능

- Fruit 타입 구현
- enum 을 컬렉션 타입으로 활용(CaseIterable)

- CalculationType

- Juice 타입 구현
- 쥬스의 종류를 case 로 구현, 연산프로퍼티를 활용해 쥬스의 재료를 딕셔너리로 반환

- ErrorCase 타입 구현

## 고민했던 것들
1. 에러가 날 수 없는 경우
```swift
func calculateStock(fruit: Fruits, amount: Int, calculationType: CalculationType) throws {
guard let stock = fruitList[fruit] else {
throw FruitStoreError.invalidSelection
}
```
위 코드에서 매개변수 *`fruit`* 는 잘못 선택될 일이 없고 단순히 *`fruitList[fruit]`* 의 값이 nil일 경우는 없을 것이라고 생각하는데 옵셔널 바인딩을 위해 guard let을 사용하게 될 경우 else 내부에 어떤 내용을 적어줘야 하는지 고민.
(일단은 에러 중 하나인 *`invalidSelection`* 으로 던지긴 했지만 return을 사용한다거나 혹은 다른 방법이 있는지...)

2. Error 프로토코콜을 채택한 열거형의 네이밍을 무엇으로 할지 고민

3. *`JuiceMaker는 FruitStore를 소유하고 있습니다`* 라는 말의 뜻을 어떻게 해석해야할지 고민.
일단은, *`JuiceMaker`* 안에서 *`FruitStore`* 의 인스턴스를 생성하는 것으로 해석 했는데 
이런 경우 *`(A 클래스 안에 B 클래스의 인스턴스를 생성한 경우)`* A 클래스를 B클래스의 부모로 볼 수 있는지 의문.

## 배운 개념
### Error Handling
- Swift에서 에러는 `Error protocol`을 채택하여 표현됩니다. 
- `Error protocol` 은 에러를 처리하는 것에 대해 사용될 수 있음을 나타냅니다. 
```swift
enum VendingMachineError: Error {
case invalidSelection
case insufficientFunds(coinsNeeded: Int)
case outOfStock
}
```
- 에러가 발생할 수 있는 함수, 메서드 는 파라미터 뒤에 `throws` 키워드를 작성합니다.
- 함수, 메서드가 반환타입이 지정되어 있다면 `throws` 키워드는 반환 화살표 (->) 전에 작성합니다.
```swift
func canThrowErrors() throws {}
func canThrowErrors() throws -> String {}
```
- `if, guard` 등 을 사용해 특정 조건에 `Error` 프로토콜을 채택한 열거형의 `case`를 던져줄수 있습니다.
```swift
guard item.price <= coinsDeposited else {
throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
}
```
위의 예시는 가진돈 보다 상품의 가격이 높을때 `endingMachineError.insufficientFunds` error를 던질수 있도록 작성된 코드

#### Handling Errors Using Do-Catch
- `do-catch` 구문을 사용하여 코드의 블럭을 실행하여 에러를 처리합니다.
- `do` 절에서 error 가 발생되면 발생된 `error` 를 `catch` 절 에서 비교하여 어떻게 처리해줄지 결정 합니다.
```swift
do {
try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
print("Invalid Selection.")
```
위의 예시에서 `do` 절의 `try`는 `buyFavoriteSnack` 함수,메서드 가 `error` 를 던질수 있다는것을 의미합니다.
`buyFavoriteSnack` 에서 던져진 error 가 `VendingMachineError.invalidSelection` 일 경우 `print("Invalid Selection.")`를 실행 하라는 뜻으로 해석 할수 있다.

## PR 후 개선사항
