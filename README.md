## 쥬스메이커 프로젝트 🍹

### 0. 목차
- [1. 소개](#1-introduction)  
- [2. 팀원](#2-team-members)  
- [3. UML](#3-uml)  
- [4. 타임라인](#4-timeline)  
- [5. 실행 화면](#5-run-screen)    
- [6. 트러블 슈팅](#6-trouble-shooting)    
- [7. 팀 회고](#7-team-retrospective)
  
<br>

<section id="1-introduction">

### 1. 소개
맛있는 과일 쥬스(딸기쥬스, 바나나쥬스, 파인애플쥬스, 키위쥬스, 망고쥬스, 딸기바나나쥬스, 망고키위쥬스)를 주문하면, 해당 과일 쥬스를 만드는 데에 필요한 과일의 재고를 파악한 후에 재고가 있다면 맛있는 쥬스를 만들어줍니다. 과일의 재고가 없다면, 재고가 부족하다는 것을 알려주고 과일 재고를 수정할 수 있는 기능을 제공합니다.

> 최근 2024.02.04 업데이트에서는 다음과 같은 개선 사항이 포함되었습니다
- **ViewController 인스턴스화 방식 변경**: `rootViewController`에서 `instantiateViewController`로 변경하여 더 유연한 ViewController 관리를 가능하게 했습니다.
- **FruitResultError 메시지 프로퍼티 추가**: 에러 핸들링 시 사용자에게 보다 명확한 메시지를 제공합니다.
- **FruitStore 싱글턴 패턴 적용**: 앱에서 과일 재고를 일관되게 관리합니다.
- **JuiceMenu 케이스 네이밍 변경**: 명확성을 높이기 위해 쥬스 메뉴의 이름을 변경했습니다.

</section>

<br>

<section id="2-team-members">

### 2. 팀원
| [HAMZZI](https://github.com/kkomgi) | [Danny](https://github.com/dannykim1215) |
| --- | --- |
| <img src="https://avatars.githubusercontent.com/u/65929788?v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/154333967?v=4" width="200"> |

</section>

<br>

<section id="3-uml">

### 3. UML
## 시퀀스 다이어그램
![KakaoTalk_Image_2024-02-01-17-43-42](https://github.com/dannykim1215/ios-juice-maker/assets/154333967/1483ab83-ebd7-46fe-9685-6407f0f05dd3)

## 클래스다이어그램
![KakaoTalk_Image_2024-02-02-09-34-46](https://github.com/dannykim1215/ios-juice-maker/assets/154333967/74b1863d-a9d5-4f08-9646-719d26461a2e)

</section>

<br>

<section id="4-timeline">

### 4. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.01.15(월) | 팀 그라운드 룰즈 및 프로젝트 요구사항 파악, FruitStore, JuiceMaker 타입 정의 및 은닉화 |
| 24.01.16(화) | updateValue를 사용한 과일 개수 변경 함수 생성, JuiceMaker init() 메소드를 추가, 쥬스메이커 함수 생성 - 딸기쥬스 생성 시, 카운트 |
| 24.01.17(수) | FruitStore, JuiceMaker 타입 재정의, 쥬스 생성하기 전 재고 체크 기능 추가, 필요없는 주석 제거 및 코드 정리  |
| 24.01.22(월) | 리뷰어 "Serena"의 1차 PR 답변 수신, 필요없는 주석 삭제, 약어 -> 풀네임으로 수정, if 조건 컨벤션 통일, viewController 이릅 변경, 함수명 기능 분리, JuiceMenu 객체로 분리(Enum 형태), Enum으로 에러 핸들링으로 변경 |
| 24.01.24(수) | Error Handdling 수정 진행 중, 함수 명칭 변경, JuiceMenu의 ingredients 속성 수정, JuiceMaker 구조체 내부에서 fruitStore 인스턴스 초기화(초기 과일 재고 수량 10), do, try-catch문 추가|
| 24.01.25(목) | Fruit Enum 객체 분리 차 파일 생성, Assets, AppDelegate, SceneDelegate 폴더 생성 및 해당 파일 분리, 쥬스메이커 프로젝트 폴더 정리 |
| 24.01.26(금) | 쥬스메이커 프로젝트 1차 ReadMe 작성 | 
| 24.02.02(금) | 리뷰어 "Serena"의 2차 PR 답변 수신, rootViewController 방식에서 instantiateViewController 로 변경, FruitResultError 에 message 프로퍼티 추가, FruitStore 를 싱글턴 패턴으로 변경, 에러 핸들링 수정, JuiceMenu 케이스 네이밍 변경 | 
| 24.02.04(토) | 쥬스메이커 프로젝트 2차 ReadMe 작성 | 

</section>

<br>

<section id="5-run-screen">

### 5. 실행 화면
https://github.com/dannykim1215/ios-juice-maker/assets/154333967/95d83f84-e5d0-4b47-bf08-860ecdf3574f

</section>

<br>

<section id="6-trouble-shooting">

### 6. 트러블 슈팅

> 2024.02.04 기준으로 작성되었습니다.

#### 1. FruitStore 싱글턴 패턴 적용

- **문제상황**: 여러 곳에서 `FruitStore` 인스턴스를 별도로 생성하게 되는 문제가 발생할 수 있었습니다.(과일 재고의 일관성 유지가 어려운 부분이라 생각했습니다)
- **이전 코드**:
    ```swift
    private var fruitStore: FruitStore = FruitStore()
    ```
- **변경된 코드**:
    ```swift
    private let fruitStore = FruitStore.shared
    ```
- **해결방안**: `FruitStore`를 싱글턴 패턴으로 변경하여 앱 전체에서 단 하나의 인스턴스만을 사용하도록 함으로써 과일 재고의 일관성을 보장하고 관리를 용이하게 했습니다.

#### 2. JuiceMenu 네이밍 변경

- **문제상황**: 쥬스 메뉴의 이름이 단순히 과일 이름으로 되어 있어, 이것이 쥬스를 나타내는 것인지 혼동이 있었습니다.
- **이전 코드**:
    ```swift
    enum JuiceMenu {
        case strawberry, banana, kiwi, pineapple, mango, strawberryBanana, mangoKiwi
    }
    ```
- **변경된 코드**:
    ```swift
    enum JuiceMenu {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
    }
    ```
- **해결방안**: 쥬스 메뉴의 이름 끝에 `Juice`를 추가하여 명확하게 쥬스 메뉴임을 나타내도록 네이밍을 변경했습니다.

#### 3. FruitResultError 메시지 프로퍼티 추가

- **문제상황**: 에러 발생 시 사용자에게 제공되는 메시지가 없어, 에러의 원인을 명확하게 알기 어려웠습니다.
- **이전 코드**:
    ```swift
    enum FruitResultError: Error {
        case outOfStock
    }
    ```
- **변경된 코드**:
    ```swift
    enum FruitResultError: Error {
        case outOfStockError
        case unexpectedError
        
        var message: String {
            switch self {
            case .outOfStockError:
                return "재고가 부족합니다. 재고를 채우시겠습니까?"
            case .unexpectedError:
                return "알 수 없는 에러가 발생하였습니다. 관리자에게 문의하여 주세요."
            }
        }
    }
    ```
- **해결방안**: `FruitResultError`에 `message` 프로퍼티를 추가하여 에러 종류에 따라 사용자에게 보다 상세한 정보를 제공할 수 있도록 했습니다.

</section>

<br>

<section id="7-team-retrospective">
    
### 7. 팀 회고
#### 우리팀이 잘한 점 😍
- 새로운 개념 또는 구현에 있어서 적극적으로 소통하면서 의견을 나눴습니다.
- 다양한 구현 방법을 생각하였습니다.(Ex. NavigationController, Modal의 활용 고민)
- 짝 프로그래밍을 준수하였습니다.
- 리뷰어의 코멘트를 중심으로 코드를 개선하였습니다.

#### 우리팀 개선할 점
- 초반에 저희는 클린한 코드를 지향하는 것보다 구현에 목적을 더 두었었습니다. 하지만 리뷰어와 야곰 선배님들의 조언에 따라 코드 개선에 많은 변화를 주었습니다. 앞으로의 코딩 방향성이 더 개선될 것이라고 생각이 듭니다.
</section>
