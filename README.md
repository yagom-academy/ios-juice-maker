## 목차

- [프로젝트 소개](#프로젝트-소개)
- [프로젝트 구조](#프로젝트-구조)
- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한점](#고민한-점)
    + [배운개념](#배운-개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한-점)
    + [배운개념](#배운-개념)

## 프로젝트 소개
야곰과 함께 음료수를 만듭시다.

<img src = "https://i.imgur.com/T4Y8NZb.gif" width="500px">

## 프로젝트 구조 
<img src = "https://i.imgur.com/LQpivZf.jpg" width="700px">


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## 키워드
`Modality` `Alert` `Navigation` `Stepper` `AutoLayout` `delegate` `Protocol` `CustomStringConvertible`
## [STEP 1]
[STEP 1 PR](https://github.com/yagom-academy/ios-juice-maker/pull/181)

### 고민한 점
- 초기값 설정에 관한 이슈
- 필요없는 값 VS 조건문 반복문 중첩
- for 문 안의 guard 사용에 대한 리뷰어님의 생각
- 클래스 내부의 열거형 접근에 관해
- 열거형의 위치에 따른 메모리적 차이
- MVC에 대한 각 개체의 기능의 범위
### 배운 개념
- 열거형 사용법
- 클래스와 구조체(참조타입과, 값타입)의 차이
- 값타입의 값 변경에 따른 메모리의 변화 및 mutating키워드
- 타입 초기화의 방법과 각 차이 및 프러퍼티의 초기화 시점에 대해
- nestType의 정의
- 함수와 파라미터 네이밍에 대해
- guarad문과 if문의 차이



## [STEP 2]
[STEP 2 PR](https://github.com/yagom-academy/ios-juice-maker/pull/200)
### 고민한 점
* 어려 버튼에 대한 액션을 하나의 IBAction으로 처리해줄 것인가
* 어떤 방식으로 에러 처리를 해줄 것인가
* 다른 상황에 보이는 얼럿에 대한 함수를 분리할 것인가? 통합할 것인가?
* 화면전환을 모달을 사용할 것인가 내비게이션을 사용할 것인가?

### 배운 개념
- 모달과 네비게이션의 차이 
- 싱글톤 패턴 
- 에러 핸들링 
- CustomStringConvertible
- Nasted Type 의 이점
- KVO, Notification center 의 사용법

## [STEP 3]
### 고민한 점
- 모달을 활용한 뷰 이동에서 중간 네비게이션컨트롤러 때문에, 만든 뷰 인스턴스와 실제 이동된 뷰의 인스턴스가 달랐던 문제
- 화면간 데이터 이동에 관한 문제

### 배운 개념


