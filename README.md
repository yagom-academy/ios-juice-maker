## iOS 커리어 스타터 캠프

### 쥬스 메이커 재고관리 저장소

# 목차

1. [제목](#제목)
2. [소개](#소개)
3. [팀원](#팀원)
4. [타임라인](#타임라인)
5. [프로젝트 구조](#프로젝트-구조)
6. [실행화면](#실행화면)
7. [트러블 슈팅](#트러블-슈팅)
8. [참고 링크](#참고-링크)
9. [개발 환경 및 라이브러리](#개발환경-및-라이브러리)

## 제목
- 쥬스 메이커

## 소개
- 원하는 쥬스의 버튼을 눌러서 쥬스를 주문하는 앱입니다.
- 재고수정을 통해서 재고를 수정할 수 있습니다.

## 팀원
| [Aaron](https://github.com/Hashswim) | [Ayaan](https://github.com/oneStar92) |
|:---:|:---:|
![](https://i.imgur.com/BL1PKGO.png)|![](https://i.imgur.com/Unq1bdd.png)


## 타임라인
- 2022.08.29
    - 프로젝트 진행에 필요한 내용 시전 학습진행
- 2022.08.30
    - Fruit타입 정의.
    - Juice타입 정의.
    - FruitStore타입 정의.
    - JuiceMaker타입 정의.
    - PR 요청.
    <img src="https://i.imgur.com/9mrQRbz.jpg" width="800" height="400"/>
- 2022.08.31
    - 1차 코멘트 내용에 대한 토의 후 Refactoring진행
    - Refactoring진행 사항 코멘트 작성 및 이해가 안되는 내용 질문.
    <img src="https://i.imgur.com/DIszdSa.png" width="800" height="400"/>
- 2022.09.01
    - 2차 코멘트 내용에 대한 토의 후 Refactoring진행
    - re PR 요청.
    <img src="https://i.imgur.com/9mrQRbz.jpg" width="800" height="400"/>
- 2022.09.02
    - Step2 진행을 위한 Swift UI학습.
    - README.md 작성
- 2022.09.05
    - 주문 버튼 이벤트 구현.
    - 싱글톤 패턴 및 tag를 사용하여 Model과 View의 데이터 처리.
    ![](https://i.imgur.com/FmvYO8O.png)
- 2022.09.06
    - alert 구현.
    - Modal방식 화면 전환 구현.
    - notificationCenter를 사용해 재고 변경 처리.
    - Step 2 PR
    ![](https://i.imgur.com/oopuqQf.png)
- 2022.09.07
    - 부족한 부분 공부!!!
- 2022.09.08
    - 리뷰 내용 Refactor
    ![](https://i.imgur.com/BF5phPe.png)
- 2022.09.12
    - Step 3 내용 사전 학습 (AutoLayout, delegate 패턴)
    - AutoLayout 구현.
    - segue를 통한 화면 전환 구현.
    - stepper 이벤트 구현.
    ![](https://i.imgur.com/SqhWwcn.png)
- 2022.09.13
    - delegate 패턴 구현.
    - AutoLayout 수정.
    - Step 3 PR
    ![](https://i.imgur.com/lGc4Epy.png)
- 2022.09.14
    - 부족한 부분 공부!!!
- 2022.09.15
    - 1차 리뷰 내용 Refactor
    ![](https://i.imgur.com/HrkDvmJ.png)
- 2022.09.16 
    - 2차 리뷰 내용 Refactor
    ![](https://i.imgur.com/Qi7i42E.png)

## 프로젝트 구조
- Model
![](https://i.imgur.com/xCLKJBB.png)
- Controller
 <img width="654" alt="스크린샷 2022-09-16 오후 3 23 21" src="https://user-images.githubusercontent.com/57447946/190570753-d8a25479-db1e-457f-aced-15621f0b1626.png">

- View
 <img width="834" alt="스크린샷 2022-09-16 오후 3 25 09" src="https://user-images.githubusercontent.com/57447946/190570915-d5c107fa-9c40-4393-8fe1-0df476e6b49f.png">
 
## 실행화면
- 쥬스 주문 View
    ![](https://i.imgur.com/GxYfuIv.png)
- 쥬스 주문 Alert
    ![](https://i.imgur.com/K7xKk8x.png)
- 재고 부족 Alert
    ![](https://i.imgur.com/olAoGmI.png)
- 재고 수정 View
    ![](https://i.imgur.com/KwzreWB.png)
- Stepper로 재고 수정
    ![](https://i.imgur.com/ySBfxiH.png)
- 재고 수정 결과 반영
    ![](https://i.imgur.com/BA2KvyZ.png)
- 실행 영상
    <img src="https://i.imgur.com/n8kDNls.gif" width="1000" height="500"/>



 
## 트러블 슈팅

- delegate 의존성.
delegate의 프로퍼티로 재고량을 넘겨주었습니다. 이러한 방식은 second View에서 fritst View의 delegate에 의존성이 높아지는 문제를 발생하였습니다.
second View의 프로퍼티에 first View가 값을 직접 주입해 주고, 주입된 값이 없으면 view가 인스턴스화 될때 초기화된 값을 사용하는 방법으로 해당 문제를 해결하였습니다.

    ```swift
    weak var juiceOrderViewControllerFruitStore: FruitStore?
    private var fruitStore: FruitStore = FruitStore()

    if let receivedFruitStore = juiceOrderViewControllerFruitStore {
        self.fruitStore = receivedFruitStore
    }
    ```
    ```swift
    modifyingInventoryVC.juiceOrderViewControllerFruitStore = juiceMaker.fruitStore
    //juiceOrderViewController에서 modifyingInventoryVC에 값을 직접 주입합니다.
    ```

- View간의 데이터 처리.
    1. singletone을 이용해 공용 데이터를 사용하는 방법을 사용하였습니다. 해당 방법은 단 하나의 인스턴스만 존재하는 경우를 제외하고는 많은 이슈를 나타내는 패턴임으로 2번 방법을 통해 데이터를 처리하였습니다.
    2. delegate를 통한 data 전달. 해당 방법은 delegate의 의존성이 높아지는 이슈를 발생하였습니다. 해당 문제를 3번 방법을 통해 해결하였습니다.
    3. 프로퍼티에 직접 접근해 data 전달. second View의 프로퍼티에 first View가 값을 직접 주입해 주고, 주입된 값이 없으면 view가 인스턴스화 될때 초기화된 값을 사용하는 방법으로 데이터를 처리해주었습니다.

- identyfier를 통한 ViewController 인스턴스화
코드를 통해 ViewController를 인스턴스화 시키기 위해선 해당 ViewController의 identyfier를 사용해야 했습니다. identyfier를 사용할때 매직 리터럴로 사용하여 해당 문자가 무엇을 의미하는지 파악하는데 어려움이 발생하는 이슈가 발생하였습니다.
VC에 Type 프로퍼티로 identyfier를 만들어 사용하는 방법과 VC의 identyfier가 VC의 타입이름과 같다는 컨벤션을 지켜 `String(describing:)`을 사용해 인스턴스화 시키는 방법 중 후자의 방법을 통해 해당 문제를 해결하였습니다.

- NavigationController에 연결된 ViewController로 화면 전환 방법.
    ```swift
    let navigationController = UINavigationController(rootViewController: modifyingInventoryVC)
    navigationController.modalPresentationStyle = .fullScreen

    present(navigationController,
                animated: true,
                completion: nil)
    ```
    화면 전환 방법에 있어 `NavigationController`에 segue를 연결하는 방식으로 구현했었지만 코드상에서 직관적으로 화면전환의 흐름을 알기 어렵다는 문제가 생겼습니다.
    `NavigtionController`의 객체를 생성후 `present` 함수를 사용해 코드상에서 화면 전환하도록 수정했습니다.

- Stepper 설정.
 Stepper의 경우 xib로 설정하는 방식은 협업에서 유지 및 보수에 이슈가 생길 수 있다는 것을 알게되었습니다.
 Stepper의 초기 설정을 코드를 통해서 설정하여 해당 문제를 해결하였습니다.

- Dictionary타입에 초기값할당 방법.
 Dictionary타입에 `Fruit Type`의 모든 case를 할당해야하는 기능구현 부분에서 어려움을 겪었습니다.
해당 어려움은 `CaseIterable Protocol`을 채택해서 해결하였습니다.
    ```swift
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    ```

- 재고 감소 메소드와 재고량이 충분한지 판단하는 메소드의 기능분리
 재고 감소 메소드를 구현할때 기능 분리를 확대해석해 재고량이 충분한지 검증하는 메소드를 재고 감소 메소드 밖에서 호출하도록 코드를 작성했습니다. 그로인해 재고 감소 메소드만 호출하게되면 재고량이 충분한지 검증하지 않고 메소드가 작동하는 문제가 발생했습니다.
해당 문제는 기능 분리를 확대해석해서 발생한 문제였으므로 재고 감소 메소드 내부에서 재고량의 충분 여부를 판단하도록 코드를 수정하여 해당 문제를 해결하였습니다.
    ``` swift
    func reduce(by amount: [Fruit: Int]) throws {
        try amount.forEach { (fruit: Fruit, amount: Int) in
            if !hasEnoughInventory(of: fruit, to: amount) {
                throw FruitStoreError.insufficientInventory
            }
        }

        amount.forEach { (fruit: Fruit, amount: Int) in
            if let inventory = inventoryList[fruit] {
                self.inventoryList.updateValue(inventory - amount, forKey: fruit)
            }
        }
    }
    ```
 
- Naming 관련
    - delegate Naming Convention
    delegate를 구현할때 지켜야할 Convention있는 사람을 알게되어 이를 바탕으로 네이밍을 수정하였습니다.
    
## 참고 링크
https://www.swift.org/documentation/api-design-guidelines/
https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
https://developer.apple.com/documentation/swift/caseiterable
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingMethods.html
https://developer.apple.com/documentation/swift/string/init(_:)-1ywfq
https://developer.apple.com/documentation/swift/using-delegates-to-customize-object-behavior
https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html
https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Singleton.html
https://developer.apple.com/documentation/swift/managing-a-shared-resource-using-a-singleton

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

