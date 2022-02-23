# ⛺️iOS 커리어 스타터 캠프

## 목차
- [쥬스 메이커 프로젝트 ](#️-쥬스-메이커-프로젝트)
    - [UML](#uml)
    - [실행 영상](#-실행-화면)
- [키워드](#키워드)
- [구현 내용](#로직구현--구현-내용)
   - [로직 구현](#로직구현--구현-내용 )
   - [Step1](#고민한점---step1)
     - [고민했던점](#고민한점---step1 )
     - [배운개념](#배운-개념)
- [피드백 수정](#피드백-받아서-수정하고-개선-한점)

</br>
</br>


## ⛺️ 쥬스 메이커 프로젝트 
🗓 기간 : 2022.02.21 ~ 2022.02.24(4d)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [Eddy](https://github.com/kimkyunghun3)</br>
🗓 리뷰어 : [도미닉](https://github.com/AppleCEO)</br>
📝 설명 : 맛있는 주스를 만들고, 재고 관리까지 해주는 app  (console app)</br>
</br>


 

</br>

### UMl

![](https://i.imgur.com/4EOUmDQ.png)

###  실행 화면
</br>


## 키워드 
- 초기화
- result
- do cath
- enum
- TypeCasting
- NestedTypes

</br>

### 로직구현 & 구현 내용 
- `JuiceMakerError`  에러타입  enum 구현
- `countFruit`  과일의 수를 세는 함수 구현 
- `FruitsTypes` 과일의 타입을 구현
-  `recipe`  쥬스 레시피 switch로  각 레시피 별로 과일 수량 구현 
-  `fruits` 과일 초기화 구현 


</br>




  

### 고민한점  & Step1

1. `makeJuice` 함수 에서 에러 처리에서  `do catch` 문으로 처리를 했는데  이걸  `result` 라는 함수 참거짓을 판별 하는 함수라는 게 있어서 이 함수를 어떻게 적용을 시켜서 사용을 많이 할까 고민을 했습니다 
2. 역시나  네이밍은  항상  어렵고  힘드네요 .. ㅠㅠ🤣🤣
```swift=
 result를 안쓰고 한 경우 
 func makeJuice(fruitJuice: FruitsTypes) {
        let recipe = fruitJuice.recipe
        do  {
            try fruitStore.countFruit(recipe: recipe)
        } catch JuiceMakerError.outOfStock {
            print("재고가 없습니다")
        } catch {}
    }

```
</br>

result를 쓰고 한 경우인데  아직은 result에 대한 공부가 부족해서 
do catch문으로 코드를 구현해서 pr을 요청드립니다

```swift=
 func make(fruitJuice: Int) -> Result<Bool, JuiceMakerError>{
    
        guard fruitJuice > 10 else {
            return .failure(.outOfStock)
        }
        return .success(true)
```
</br>

3. 처음 UML 작성처럼 기능을 클래스 단위로 분리해서 코드를 구현해볼까 고민해봤습니다. 그래서 가장 슈퍼클래스에서 이들을 상속받아서 하려고 했으나, 찾아보았더니 다중상속을 swift는 지원을 하지 않는 것으로 알게 되었습니다. 그래서 기능을 다른 클래스에서 상속받아서 연달아 사용하는 방식(마치 함수들을 연결짓기 위해 매개변수를 활용하는 방식)을 생각했는데, 이렇게 되면 초기화 함수 같은 것을 구현했을 떄 매번 사용할 떄 불편할 뿐만 아니라 이렇게 기능단위로 클래스 구분이 맞는가 의심이 되었습니다. 작은 단위로 기능을 구현하는 것도 좋지만 한 클래스 안에 속할 수 있는 기능은 클래스 하나로 묶어서 하는 것이 저는 더 맞는 구현 방향이라고 생각하는데 이에 대한 조언을 듣고 싶습니다.

4. UML에서 저희가 상속을 사용하지 않고 예를 들어 구조체로 구현한 것을 인스턴스하여 사용하거나 enum을 하나의 딕셔너리를 초기화할 떄 사용하는 식으로 했는데 이런 경우에는 어떻게 연결관계를 해야할지 고민이 되었습니다. 단순히 연관이 있다고 해서 현재에는 선을 통해서 표현했는데, UML Class diagram 같은 경우에는 클래스의 상속 등과 같은 객체적 연관관계와 이에 따른 화살표 모양이 존재하는데 구조체같은 경우에는 이처럼 선으로만해서 이를 사용하고 있다고 봐도 될까요? 상속이 아닌 인스턴스 만드는 것이라 저는 그부분이 맞다고 생각이 들었었습니다.


### 브랜치 전략 
- main: 완성된 프로젝트를 보관하는 브랜치
- develop: pr, 리뷰를 받고 개선한 코드를 보관하는 브랜치
- step1,2,3: 각 스텝의 요구사항을 구현하는 / 평소 코드를 작성하는 브랜치

 ![](https://i.imgur.com/RyPTGCQ.jpg)
 
### 학습 키워드
- CustomSTringConvertible
- enum - associated value
- namespace
- git flow
- MVC

### 배운 개념 
- 에러 메세지를 출력할 때 사용할 수 있는 다양한 방법
- 코딩 컨벤션을 정할 때 이유와 근거를 생각해보는 방법
- 전역변수를 사용할 때 다른 타입에서 접근할 수는 없는지 고려해보자.
- git flow 


### 피드백 받아서 수정하고 개선 한점
