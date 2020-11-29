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

typealias Recipe = [Fruit: Int]

class StockError: LocalizedError {
    var errorDescription: String?
    init(message: String) {
        errorDescription = message
    }
}


//과일 수량
class FruitStock {
    private(set) var strawberry: Int
    private(set) var banana: Int
    private(set) var pineapple: Int
    private(set) var kiwii: Int
    private(set) var mango: Int
    
    init(strawberry: Int, banana: Int, pineapple: Int, kiwii: Int, mango: Int) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwii = kiwii
        self.mango = mango
    }
    
    //현재 보유한 과일 재고로 가능한가?
    private func canMakeJuice(with recipe: Recipe) -> StockCheckResult {
        for (fruit, fruitUsed) in recipe {
            switch fruit {
            case .banana where banana < fruitUsed: return .notAvailable
            case .kiwii where kiwii < fruitUsed: return .notAvailable
            case .mango where mango < fruitUsed: return .notAvailable
            case .pineapple where pineapple < fruitUsed: return .notAvailable
            case .strawberry where strawberry < fruitUsed: return .notAvailable
            default:
                continue
            }
        }
        return .available
    }
    
    //Juice재작 시 사용하는 과일
    fileprivate func useFruit(recipe: Recipe, completionHandler: (Result<Any?, StockError>) -> Void) {
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
            completionHandler(.success("재작 가능합니다."))
        case .notAvailable:
            completionHandler(.failure(StockError(message: "재고가 부족합니다!")))
        }
    }
    
    //과일 재고 추가
    fileprivate func changeStock(fruit: Fruit, stock: Int) {
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
        fruitStock = stock
    }
    
    //어떤 과일을 몇개 써서 쥬스를 만들었나?
    func makeJuice(with recipe: Recipe, completionHandler: (Result<String, StockError>) -> Void) {
        fruitStock.useFruit(recipe: recipe) { (result) in
            switch result {
            case .success(_):
                completionHandler(.success(" 쥬스가 나왔습니다!"))
            case .failure(_):
                completionHandler(.failure(StockError(message: "재료가 모자라요. 재고를 수정할까요?")))
            }
        }
    }
    
    func updateStock(fruit: Fruit, stock: Int) {
        fruitStock.changeStock(fruit: fruit, stock: stock)
    }
}
