# 🥭 웨그랩의 쥬스메이커 🍹
<br>

## 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [클래스 다이어그램](#4.)
5. [실행 화면(기능 설명)](#5.)
6. [트러블 슈팅](#6.)
7. [참고 링크](#7.)
8. [팀 회고](#8.)


<a id="1."></a>
## 1. 소개 

<br>

<a id="2."></a>
## 2. 팀원
| [qoocrab 🦄](https://github.com/qoocrab) | [Whales 🐋](https://github.com/WhalesJin) |
| :--------: | :--------: |
| <Img src = "https://avatars.githubusercontent.com/u/104251652?v=4" width="150"/>| <Img src = "https://i.imgur.com/wnhhCv9.jpg" width="150"/>|

<br>

<a id="3."></a>
## 3. 타임라인
**2023.05.08**
- 과일 종류, 쥬스 종류, 에러 열거형 생성
- 재고 수량 체크 함수와 변경 함수 생성
- 주문 받는 함수 생성

**2023.05.09**
- 주문 받는 함수 수정
- main 에러 수정
- 컨벤션 수정

**2023.05.10**
- 피드백 이후 전면 수정 다시 시작
- 과일과 쥬스 열거형 타입 생성
- 과일 재고 늘리고 줄이는 함수 각각 생성
- 레시피 북 생성

**2023.05.11**
- 과일과 쥬스 열거형 타입을 struct로 수정
- 에러 타입 생성
- 재고량 받아오는 함수, 재고 비교하는 함수 생성
- 레시피 북 제거
- 주문 받는 함수 생성
- FruitStore 구조체를 클래스로 변경
- 조건문 키워드 수정
- 쥬스 완성 출력문 중복 출력 수정
- 배치, 컨벤션 수정

**2023.05.12**
- 로직 수정으로 인한 재고 비교 함수 네이밍 변경

<br>

<a id="4."></a>
## 4. 클래스 다이어그램

<br>

<a id="5."></a>
## 5. 실행 화면(기능 설명)

<br>

<a id="6."></a>
## 6. 트러블 슈팅
### 🔥 전반적인 그림에 대한 고민
- 사실 아직은 앱을 만드는 부분이나 UI부분이 낯설어서 step을 진행하며 전처럼 요구사항만 읽고 로직을 짜는데 집중했습니다. 그러다보니 진행하면서 넣을까 말까 고민하는 기능들, 넣고나니 더 꼬이기만 하는 기능들, 충돌되던 컨셉들을 발견하며 탁탁 막히는 느낌을 받았습니다.
- 프로젝트를 진행하며 `Main.storyboard`라는 부분을 보게 되었는데 이제까지 하던 고민이 결국 이로 이어지는 고민들이라는 것을 깨닫게 되었습니다. 이미 구성되어 있는 화면을 보며 타입 안에 필요한 프로퍼티나 메서드 등을 고민하고 구현 과정을 계획했다면 갈팡질팡 했던 긴 고민의 시간이 줄었을 것 같다는 생각을 했고, 앞으로 그런 방향도 같이 고려해서 로직을 짠다면 좀 더 효율적이고 완성도가 높은 코드를 구현하는데 큰 도움이 될 것 같다는 깨달음을 얻었습니다.
- (스토리보드를 미리 봤다면 고민의 시간이 줄었을 수 있는 부분)을 📱로 체크

### 🔥 class vs struct
- 처음에 코드를 새로 짤 때, 미션 파일에 `JuiceMaker`는 `struct`로, `FruitStore`는 `class`로 깔려있었는데 참조하거나 상속할 일이 없으니 class를 struct로 변경해서 진행했습니다.
- 완성 후 테스트를 돌려보는데
    ![](https://hackmd.io/_uploads/H1hMoEjN2.png)
    `qoocrab` 안에 `whales` 과일 가게가 있는데 `whales`에 있는 `fruitInventory`와 `qoocrab`에 있는 `fruitInventory`가 출력이 다르게 나오는 걸 보고 뭔가 잘못되었음을 깨달았습니다.
- 같은 재고를 가지고 있어야는데 `struct`를 써서 값 참조로 복사가 되었기 때문에 연동이 안됨을 찾아서 `FruitStore`를 `class`로 다시 바꿔서 해결했습니다.
- 프로젝트를 진행할 때마다 `class`와 `struct`에 대해서 좀 더 고민을 해보고 진행을 하면 좋겠다 라는 걸 직접 느끼게 되는 부분이었습니다.
- 📱
    
### 🔥 객체의 역할
- 클래스 (혹은 구조체)의 각 역할을 어디까지 부여하고 서로 어떤 방식으로 통신할지에 대해서 많은 고민을 했습니다. 처음에는 `StoreManager` 클래스를 두어서 주문을 받는 클래스를 따로 설정하고 여러가지 기능을 추가하고, `JuiceMaker`는 오로지 쥬스를 제조하기만 하는 역할로 두는 것을 생각했습니다. 그러나 차후 스텝들에서 프로그램의 목적이 쥬스를 제조하는 그 자체에 좀 더 초점이 있는 것 같아서 (버튼을 누르는 형태로 쥬스를 주문함) 이 두 가지 클래스를 분리하지 않고 합치는 것으로 합의를 보았습니다.
- 쥬스나 과일을 `struct`로 두어서 파일을 분리하는 것으로 합의를 보았습니다. 처음에는 쥬스나 과일에도 종류를 추가할 수 있는 확장성을 생각해서 이런 결정을 하였으나, 본 프로젝트의 의도는 정해진 과일과 쥬스 내에서 구현되는 것이라 이 부분은 수정을 하였습니다.
- `FruitStore`의 재고 관리를 `StoreManager`나 `JuiceMaker`에서 관리하는 것으로 처음에는 이야기가 되었으나, 이는 객체지향적으로 올바른 구현이 아니라고 생각이 되어 수정을 하였습니다.
- 📱

### 🔥 JuiceRecipeBook
- `JuiceRecipeBook`이란 개념으로 쥬스 메이커가 이 레시피 북을 메모리에 관리하는 형태로 처음에 컨셉을 잡았었습니다. 그러나 이것이 메모리 낭비가 있고, 이후 테스트 코드를 작성할 시에 다양한 테스트를 하는 것을 막기 때문에 이 부분을 수정하는 것으로 합의하고 `JuiceRecipeBook`은 삭제 하였습니다.
    
### 🔥 static 키워드
- 체인점의 개념을 생각했을 때, 모두의 레시피가 동일해야하고 한 군데의 레시피가 변경되면 다같이 바꾸기 위해서 static이라는 키워드를 떠올려보았습니다.
- `static` 변수는 여러 곳에서 공유하며 참조의 형태로 한 곳에서 변경되면 다같이 변경되는 특성을 가지고 있습니다.
- 단점은 프로그램이 종료될 때까지 메모리에 남아있어서 과도하게 사용하면 불필요한 메모리 소모가 발생될 수 있고, 여려 곳에서 공유하기 때문에 의도치 않게 변경될 수 있습니다.
- 추상화의 중요성을 느꼈습니다. 지금 우리가 구현해야하는 부분과 상관없는 고민임을 깨닫고 구현하지는 않았지만 덕분에 새로운 키워드를 공부하게 되었습니다.
- 📱
    
### 🔥 Hashable 프로토콜 준수
- `Juice`라는 타입을 만들며 프로퍼티로 쥬스의 레시피를 `Dictionary`로 구현하였습니다. `Dictionary`가 `key-value` 값을 저장하는 해시 테이블로 구현이 되어있어서 그 `key`로 쓰여지는 타입은 `Hashable` 프로토콜을 준수해야 합니다. 그래서 `Fruit` 타입은 `Hashable` 프로토콜을 준수하도록 만들었습니다.

### 🔥 확장성을 고려하는 시각 차이
- 확장성이라는 피드백을 받고 스토어를 관리하는 사장이 쥬스의 종류나 과일의 종류를 새롭게 추가할 수 있는 확장성을 생각하였습니다. 그에 따라 고려할 사항이 많아지면서 다양한 시도를 해보았습니다.
- 여기서의 확장성이란 기획자가 '메론쥬스 추가해줘'라고 했을 때 개발자가 다른 코드들은 크게 건드리지 않고 추가할 수 있는, 코드적인 측면에서의 확장성이라는 추가 설명을 듣고 코드들을 다시 수정하였습니다.
- 📱
    
### 🔥 네이밍
- 변수 네이밍 중 특히 `get`의 사용을 고민했다거나, 동사가 빠져있다거나 하는 경우가 많았었습니다. 그래서 이를 대체하는 동사를 고민을 많이 했습니다.
- `get`과 같은 예약어들은 사용처가 정해져 있기에 대체 단어가 있다면 피하는 게 좋고 make로 시작하는 `method`들은 보는 사람으로 하여금 `factory method`를 떠올리게 할 수 있어 피하는게 좋다.

<br>

<a id="7."></a> 
## 7. 참고 링크
- [API Design Guideline - Strive for Fluent Usage](https://www.swift.org/documentation/api-design-guidelines/#promote-clear-usage)
- [블로그 - Hashable](https://babbab2.tistory.com/149)

<br>

<a id="8."></a>
## 8. 팀 회고
### 👏🏻 우리팀이 잘한 점
- 

### 👊🏻 우리팀 개선할 점
- 

### 💜 서로에게 좋았던 점 피드백
- Dear. qoocrab 🦄
    - 
    
- Dear. Whales 🐋
    - 
