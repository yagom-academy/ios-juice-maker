# 🥤 쥬스 메이커 프로젝트

## 📑 프로젝트 소개
- 여러가지의 과일 주스를 만들때마다 과일 창고의 재고를 관리하고, 이를 UI로 보여주는 앱입니다.

## 📍 목차
#### 1. [팀원](#🧑🏻‍💻-1-팀원)
#### 2. [순서도](#🔖-2-순서도)
#### 3. [타임라인](#⏱-3-타임라인)
#### 4. [실행 화면(기능 설명)](#💻-4-실행-화면기능-설명)
#### 5. [트러블 슈팅](#🚀-5-트러블-슈팅)
#### 6. [참고 링크](#📎-6-참고-링크)

## 🧑🏻‍💻 1. 팀원
|애쉬|미니|
|:----:|:----:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://user-images.githubusercontent.com/88357373/186843567-7b59d8c6-8f37-4858-8cf7-6c47d58ba9b0.png" alt="Ash" border="0" width="200">|<img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/ikEGO8k.jpg">|
|<a href="https://github.com/ash-youu"> <center>*@ash-youu*</center></a> | <a href="https://github.com/leegyoungmin"> <center>*@leegyoungmin*</center></a>|

## 🔖 2. 순서도
![flowCharts](https://i.imgur.com/r5klH3I.png)

## ⏱ 3. 타임라인
<!-- : 시간 순으로 프로젝트의 주요 진행 척도를 표시 -->
- **2022.08.29**
	- 공식문서 학습

- **2022.08.30**
    ![CommitList](https://i.imgur.com/DaHEL9t.png)

- **2022.08.31**
    - PR 발송 및 공식문서 학습

- **2022.09.01**
    - `README.md` 작성 및 공식문서 학습

## 💻 4. 실행 화면(기능 설명)
### 📌 STEP 1
- 쥬스메이커로 `makeJuice(juice:)` 함수 실행

    ![viewController_Code](https://i.imgur.com/IDm4RGe.png)

    ![viewController_Result](https://i.imgur.com/Dm5BJ4s.png)
- `makeJuice(juice:)` 및 `haveStock(of:, over:)`,`increaseStock(of:, by:)` 설명
    ```swift
    func makeJuice(juice: Juice) {
        let juiceNeedFruits = juice.needFruits
        let juiceNeedStocks = juice.needStocks
        
        do {
		try fruitStore.haveStock(of: juiceNeedFruits, over: juiceNeedStocks)
		fruitStore.increaseStock(of: juiceNeedFruits, by: juiceNeedStocks)
		print("주문하신 \(juice.description) 나왔습니다.")
        } catch StoreError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류가 발생하였습니다.")
        }
    }
    ```
    - 이 함수는 주스를 만드는 명령을 내리는 함수입니다.
    - 이 함수의 기능은 창고에 재고가 있는지 확인 후 있다고 판단했을 경우에만 창고의 재료를 가져와 음료를 만들 도록 설계하였습니다.
    - 만약, 재고가 없거나 부족한 경우에는 에러를 발생시키도록 하였습니다.
    
    ```swift
	func haveStock(of fruits: [Fruit], over stocks: [Int]) throws {
		for (fruit, stock) in zip(fruits, stocks)  {
			guard let remainStock = inventory[fruit], remainStock >= -stock else {
                throw StoreError.outOfStock
			}
		}
    }
	```
    - `haveStock(of:, over:)`은 주스를 만들기 위해서 필요한 재고가 있는지 확인하는 함수입니다.
    - 이 함수를 활용하여서 재고가 없는 경우에 에러를 발생시키도록 구현하였습니다.
    - 만약, 재고가 있다면 함수는 종료되게 되어, 에러를 발생시키지 않기 때문에 `makeJuice(juice:)`함수의 다음 구문이 실행되게 됩니다.
    
    ```swift
    func increaseStock(of fruits: [Fruit], by amounts: [Int]) {
        for (fruit, stock) in zip(fruits, amounts) {
            if let remainStock = inventory[fruit] {
                inventory.updateValue(remainStock + stock, forKey: fruit)
            }
        }
    }
    ```
    
    - `increaseStock(of:, by:)`은 재고가 있는 주스를 생성하기 위해서 재료를 꺼내오는 과정을 표현한 함수입니다.
    - 주스에 필요한 재료들과 양을 통해서 현재 창고의 재고를 줄이는 역할을 담당하게 됩니다.
    - 또한, 이는 양수의 값이 들어오게 되면, 재고를 증가시키는 함수로도 활용할 수 있습니다.



### 📌 STEP 2
### 📌 STEP 3
## 🚀 5. 트러블 슈팅
### 📌 STEP 1
### 📌 STEP 2
### 📌 STEP 3
## 📎 6. 참고 링크
[Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)

[Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)

[Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
