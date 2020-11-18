import Foundation

/// 쥬스 메이커 타입
//과일 종류
enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwii
    case mango
}

//과일 수량
//FruitStock을 구조체로 선언한 이유는 값타입으로만 사용될 것 이라 생각하여 구조체를 사용했습니다.
struct FruitStock {
    //구조체의 프로퍼티들을 class에서 사용하기 위해 fileprivate를 사용해 주었습니다.
    fileprivate(set) var strawberry: Int
    fileprivate(set) var banana: Int
    fileprivate(set) var pineapple: Int
    fileprivate(set) var kiwii: Int
    fileprivate(set) var mango: Int
    
    init() {
        strawberry = 10
        banana = 10
        pineapple = 10
        kiwii = 10
        mango = 10
    }
    
    //과일 재고 추가
    //물량을 수정하는 것은 유저가 직접 -, + 를 사용하여 물량을 조절하는 것이라 생각하여 외부에서 재고를 수정할 수 있게 두었습니다.
    mutating func stockChanged(fruit: Fruit, stock: Int) {
        switch fruit {
        case .strawberry:
            self.strawberry = stock
        case .banana:
            self.banana = stock
        case .kiwii:
            self.kiwii = stock
        case .mango:
            self.mango = stock
        case .pineapple:
            self.pineapple = stock
        }
    }
}

//주스 만들기
//JuiceMaker를 class로 선언한 이유는 나중에 JuiceMaker라는 인스턴스를 가지고
//재고를 늘리거나 음료를 만들 때 참조 타입으로 내부의 값을 변경시켜주는 것이 맞다고 생각하여 class를 사용.
class JuiceMaker {
    var fruitStock: FruitStock
    
    init() {
        fruitStock = FruitStock()
    }
    
    //어떤 과일을 몇개 써서 쥬스를 만들었나?
    func makeJuice(with fruits: [Fruit: Int]) {
        for (fruitName, fruitUsed) in fruits {
            switch fruitName {
            case .banana:
                self.fruitStock.banana -= fruitUsed
            case .kiwii:
                self.fruitStock.kiwii -= fruitUsed
            case .mango:
                self.fruitStock.mango -= fruitUsed
            case .pineapple:
                self.fruitStock.pineapple -= fruitUsed
            case .strawberry:
                self.fruitStock.strawberry -= fruitUsed
            }
        }
    }
}
