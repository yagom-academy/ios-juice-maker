# 🧃 JuiceMaker

## 목차
[소개](#소개)
[팀원](#팀원)
[프로젝트 구조](#프로젝트-구조)
[타임라인](#타임라인)
[트러블 슈팅](#트러블-슈팅)
[참고 링크](#참고-링크)
[2팀 회고](#2팀-회고)

## 소개
### 프로젝트 기간: 23.01.02 ~ 23.01.20
* 각 주스의 현재 재고량을 보여준다.
* 주스 만들기 버튼을 누르면 해당 주스의 재고가 충분히 있다면 완료를 띄워주며 재료를 감소시킨다.
* 만약 주스의 재고가 부족하다면 alert에서 재고를 수정하러 이동하거나 alert창을 닫는다
* 재고수정 버튼을 눌러 재고 수정 화면으로 가서 재고를 수정한다.

## 팀원

|⭐️Vetto|⭐️레옹아범|
| :--------: | :--------: |
|<img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="180" height="180">|<img height="180px" src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg">|

### 팀 규칙
#### 코드 컨벤션
* 짝 프로그래밍
* commit단위는 기능
* 순번이 돌 때마다, 회의가 필요한 경우 회의(20~30분)
* 함수명은 상의하여 정하기

#### Commit 컨벤션
* feat : 기능 구현, 수정
* docs : 문서 추가, 수정
* refactor : 변수 네이밍 수정
* fix : 사용자가 사용하는 부분에서 bug 수정
* style : 코드의 형식 수정 (ex. 세미콜론 추가 등)
* chore : 별로 중요하지 않은 사항
```git
<type>(제목)

<body>(본문)

<footer>

예시
fix: 열거형 추가

묵찌빠 열거형, 가위바위보 열거형 추가

fix
```

## 프로젝트 구조
<details>
    <summary><big>순서도</big></summary>
    작성 예정
</details>

## 프로젝트 수행 중 핵심 경험
<details>
    <summary><big>STEP 1</big></summary>

* Swift API Design Guide에 따른 이름짓기
* 소스코드에 불필요한 코드 및 코멘트 남기지 않기
* 메서드의 기능단위 분리
* 요구사항에 따른 타입의 정의
* 타입의 캡슐화/은닉화
* 상황에 알맞은 상수/변수의 올바른 선택

</details>
    
<details>
    <summary><big>STEP 2</big></summary>    

* 내비게이션 바 및 바 버튼 아이템의 활용
* 얼럿 컨트롤러 활용
* Modality의 활용
* 화면 사이의 데이터 공유
    
</details>

## 타임라인

#### STEP 1 [2023.01.02] ~ [2023.01.05]
|날짜|타임라인|
| :-------: | :-------: |
|23.1.2.(월)|Fruit, JuiceMenu등 기본적인 타입 생성 및 FruitStore, JuiceMaker내의 메소드 생성|
|23.1.3.(화)|JuiceMaker내 makeJuice 버그 fix, 메소드와 프로퍼티 은닉화|
|23.1.4.(수)|메소드 이름과 파라미터 argument Label등을 사용하여 읽기 편하게 리팩토링|
|23.1.5.(목)|JuiceMaker내에 do-catch문 수정, FruitStore 이니셜라이저 수정|

#### STEP 2 [2023.01.05] ~ [2023.01.06]

## 트러블슈팅

<details open>
    <summary><big>Step1</big></summary>

### 재료가 두개 들어간 쥬스 제조시 두번째 재료가 부족한 경우 첫번째 재료가 소진되는 문제
#### 문제점
```swift
func makeJuice(juice: JuiceMenu) {
    let recipe = juice.recipe

    for (fruit, num) in recipe {
        do {
            try fruitStore.checkFruit(fruit: fruit, number: num)
            fruitStore.decreaseFruit(fruit: fruit, number: num)
         print(fruitStore.fruits)
        } catch FruitStoreError.noExistInventory {
            print("해당 과일 존재하지 않음")
        } catch FruitStoreError.lackedInventory {
            print("\(fruit.name)과일 재고 부족")
        } catch {
            print(error)
        }
```

* 기존 재료가 두개 들어가는 쥬스를 제조시 첫 재료의 재고 확인 후 재료를 사용하고 다음 재료 재고를 확인하여 사용하는 형태로 구성하였음.
* 이럴 경우 딸바쥬스(딸기, 바나나) 제조 시 딸기는 충분하지만 바나나가 부족한 상황에서 딸기는 소모되고 쥬스는 제조되지 않는 현상 발생

#### 해결법
```swift
private func checkFruitInStore(_ juice: Juice) -> Bool {
    for (fruit, num) in juice.recipe {
        do {
            try fruitStore.checkFruit(fruit, by: num)
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    return true
}
```
* checkFruitInStore라는 메소드를 생성하여 여러개의 재료를 받을 경우 두개의 재료가 전부 다 있을 경우 true / 두개 중 하나의 재료라도 없을 시 false를 반환하게 만들어 makeJuice메소드에서 true값일 경우 쥬스를 생성할 수 있게 만들었습니다.

</details>

## 참고링크
[swift-Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
[swift-Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
