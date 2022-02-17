## iOS-Juice-Maker

### 🌸 STEP1 - UML

![step1-UML](https://user-images.githubusercontent.com/39825738/154426606-df609c5e-a88f-4c7e-8c29-a06e9891501a.png)

---
#### 고려했던 부분

* 확장성
	1. `Fruit`이나 `Juice`의 종류가 추가될 때 많은 부분의 코드를 추가시키지 않아도 되도록 만듬

	  Enum을 만들고 그에 따른 필요 사항은 변수로 넣어놓아 추가될때 `Enum`만 건드리면 되도록 했고, Fruit.allCases를 통해 활용성을 더함
    
	2. 초기에 모두 10개가 아닌경우


	  초기에 10개가 아닐 수도 모두 다른 수를 가질 수 있음으로 init에서 그를 초기화 시켜줌
    
  
---
#### 고민했던 부분
* FruitStore.stocks를 어떻게 관리할 것인가
	1. dictonary로 하는 법
	2. [튜플]로 하는 법
	3. [새로운 struct]로 하는 법

  -> dictonary로 선택함: 주어진 view 특성상 순서가 중요하지 않고 특정 과일의 수의 수정이 용이하기 때문
  
* class인 이유와 struct인 이유
