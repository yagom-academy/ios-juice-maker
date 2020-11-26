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

enum StockCheckResult {
    case available
    case notAvailable
}

enum Result {
    case success
    case failure
}

typealias Recipe = [Fruit: Int]


//과일 수량
//FruitStock을 구조체로 선언한 이유는 값타입으로만 사용될 것 이라 생각하여 구조체를 사용했습니다.
struct FruitStock {
    private(set) var strawberry: Int
    private(set) var banana: Int
    private(set) var pineapple: Int
    private(set) var kiwii: Int
    private(set) var mango: Int
    
    //현재 보유한 과일 재고로 가능한가?
    private func canMakeJuice(with recipe: Recipe) -> StockCheckResult {
        for (fruit, fruitUsed) in recipe {
            switch fruit {
            case .banana:
                if banana < fruitUsed {return .notAvailable}
            case .kiwii:
                if kiwii < fruitUsed { return .notAvailable }
            case .mango:
                if mango < fruitUsed { return .notAvailable }
            case .pineapple:
                if pineapple < fruitUsed { return .notAvailable }
            case .strawberry:
                if strawberry < fruitUsed { return .notAvailable }
            }
        }
        return .available
    }
    
    mutating func useFruit(recipe: Recipe) -> Result {
        switch canMakeJuice(with: recipe) {
        case .available:
            for (fruit, fruitUsed) in recipe {
                switch fruit {
                case .strawberry:
                    strawberry = strawberry - fruitUsed
                case .banana:
                    banana = banana - fruitUsed
                case .kiwii:
                    kiwii = kiwii - fruitUsed
                case .mango:
                    mango = mango - fruitUsed
                case .pineapple:
                    pineapple = pineapple - fruitUsed
                }
            }
            return .success
        case .notAvailable:
            return .failure
        }
    }
    
    //과일 재고 추가
    mutating func changeStock(fruit: Fruit, stock: Int) {
        switch fruit {
        case .strawberry:
            strawberry = stock
        case .banana:
            banana = stock
        case .kiwii:
            kiwii = stock
        case .mango:
            mango = stock
        case .pineapple:
            pineapple = stock
        }
    }
}

//주스 만들기
//JuiceMaker를 class로 선언한 이유는 나중에 JuiceMaker라는 인스턴스를 가지고
//재고를 늘리거나 음료를 만들 때 참조 타입으로 내부의 값을 변경시켜주는 것이 맞다고 생각하여 class를 사용.
class JuiceMaker {
    private(set) var fruitStock: FruitStock
    
    //JuiceMaker 인스턴스 생성 시 초기 과일 재고 입력.
    init(stock: FruitStock) {
        fruitStock = FruitStock(strawberry: stock.strawberry,
                                banana: stock.banana,
                                pineapple: stock.pineapple,
                                kiwii: stock.kiwii,
                                mango: stock.mango)
        
    }
    
    //어떤 과일을 몇개 써서 쥬스를 만들었나?
    func makeJuice(with recipe: Recipe) -> Result {
        return fruitStock.useFruit(recipe: recipe)
    }
    
    func updateStock(fruit: Fruit, stock: Int) {
        fruitStock.changeStock(fruit: fruit, stock: stock)
    }
}
