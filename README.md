# 🥤 Juice Maker
* 과일재고값의 변경을 받아와 필요한 과일만큼을 소진해 과일주스를 만드는 프로젝트
1. 프로젝트 인원: [goatt](https://github.com/Goatt8), [Brody](https://github.com/seunghyunCheon)
2. 프로젝트 기간: 2023.01.02 - 23.01.20
3. Grouped Rules
    - 스크럼
        - 시작시간: 9:30
        - 식사시간: 1시간 30분
    - 계획
        - 기능구현에 초점을 둬서 완성하고 리팩토링을 반복
4. 폴더 구조

```
├── Controller
|   ├── JuiceMakeViewController
|   └── FruitStoreViewController
├── Model
|   ├── FruitStore
|   ├── JuiceMaker
|   └── Type
├── View
|   ├── Main
|   └── Assets
└── 
```

### 목차
- [타임라인](#타임라인)
- [순서도](#순서도)
- [기능 설명](#기능-설명)
- [키워드](#키워드)
- [트러블 슈팅](#트러블-슈팅)
- [팀회고](#팀회고)
- [참고 자료](#참고-자료)

----
    
## 타임라인
> 시간 순으로 프로젝트의 주요 진행 척도를 표시
> - 23.01.02(월): 참고자료 공식문서 읽기, STEP1 순서도 그리기
> - 23.01.03(화): STEP1 코드작성, STEP1 PR요청
> - 23.01.04(수): STEP1 진행속도 느릴 시 추가로 진행
> - 23.01.05(목): STEP2 진행 (재고 관리 viewcontroller까지 작업)
> - 23.01.06(금): STEP2 진행(과일 주스 재고 관리부분 완료)

> - 23.01.09(월): STEP2 PR 목표
> - 23.01.10(화): STEP2 PR 수정사항 반영
> - 23.01.11(수): -
> - 23.01.12(목): -
> - 23.01.13(금): -

> - 23.01.09(월): -
> - 23.01.10(화): -
> - 23.01.11(수): -
> - 23.01.12(목): -
> - 23.01.13(금): -

## 순서도 
<img src="https://i.imgur.com/8ph8vjV.png" width="800" height="840"/> 


## 기능 설명
* #### 과일재고 화면
과일재고 화면입니다. 처음 실행했을 때 과일값이 10으로 설정돼있으며 (-), (+) Stepper를 통해 과일재고를 변경할 수 있습니다.

<img src="https://i.imgur.com/TrgGDet.png" width="400"/>

--- 
* #### 과일재고 추가 및 감소 화면
과일재고stepper의 추가와 감소에 따라 정상적으로 재고값이 변경되는 모습입니다.

<img src="https://i.imgur.com/Y1BEzNj.png" width="400"/>

---


## 키워드
- `class`, `struct`
- `싱글톤`
- `Nested Types`, `enum`
- `dictionary`, `mapValues`
- `네이밍`
- `IBOutlet`, `IBAction`, `UIStepper`, `UILabel`
- `SizeToFit`



## 트러블 슈팅
 
#### 1. view의 stepper데이터를 기존FruitStore에 저장해둔(step1) 딕셔너리의 밸류값과 일치시키는 과정이 좀 문제가 많았습니다
* 과일들의 label 초기값이 10으로 시작해야함 -> FruitStore클래스를 전역으로(var currentFruitBasket) 받아와 setUpStepper함수를 통해 레이블과 딕셔너리의 밸류값을 일치시키는 작업을 진행해서 해결했습니다

```swift
//setUpStpper()
if let fruitValue = currentFruitBasket[.fruit]{
    fruitStepper.value = Double(fruitValue)
}
```

#### 2. label의 크기가, 숫자가 늘어남에 따라 같이 커지지않고 숫자가 일부 생략되는 오류가 생겨, setUpLabel()에 sizeToFit()기능을 구현해서 해결해주었습니다
```swfit
fruitLabel.sizeToFit()
```

#### 3. StepperChanged의 함수 크기
* stpperChanged함수가 sender에 UIStepper가 담겨서 실행되었을때 sender는 여러 개 stepper 중 하나의 stepper가 담길 수 있도록 하나에 함수에 여러개 Stepper 이벤트를 연결했습니다.
* 하지만 이로인해 함수 내부에서 switch case를 통해 분기별로 처리해줘야 하는 일이 생겼고 이는 결국 StepperChanged함수가 상당한 양의 코드를 갖게 만들었습니다.
* 이를 해결하기 위해 현재 sender로 들어온 Stepper가 어떤 과일에 대한 Stepper인지 알 수 있게 stepper를 파라미터로 넣으면 과일을 리턴해주는 함수를 만들었습니다.
```swift
 func stepperTarget(_ stepper: UIStepper)  -> Fruit? {
        switch stepper {
        case strawberryStepper:
            return Fruit.strawberry
        case bananaStepper:
            return Fruit.banana
        case pineappleStepper:
            return Fruit.pineapple
        case kiwiStepper:
            return Fruit.kiwi
        case mangoStepper:
            return Fruit.mango
        default:
            return nil
        }
    }
```
- 가져온 fruit을 기반으로 case별로 처리가 되었던 부분이 교체가 되어 많은 양의 코드를 제거할 수 있었습니다.
```swift
@IBAction func stepperChanged(_ sender: UIStepper) {
        guard let targetFruit = stepperTarget(sender) else {
            return
        }
        guard let fruitCount = currentFruitBasket[targetFruit] else {
            return
        }
        
        if Int(sender.value) > fruitCount {
            fruitStore.addOne(of: targetFruit)
            currentFruitBasket[targetFruit]! += 1
        } else {
            fruitStore.reduceOne(of: targetFruit)
            currentFruitBasket[targetFruit]! -= 1
        }
        
        let fruitLabel = fruitLabel(targetFruit)
        fruitLabel.text = currentFruitBasket[targetFruit]?.description
        fruitLabel.sizeToFit()
    }
```



## 참고 자료
[API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)

### 9. 팀회고

