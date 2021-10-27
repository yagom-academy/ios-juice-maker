
struct JuiceMaker {

    let fruitStore: FruitStore
    
    init() {
        fruitStore = FruitStore.shared
    }
    
    enum Juice {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberrybanana
        case mango
        case mangokiwi
        
        fileprivate var recipe : [Fruits:Int] {
            switch self {
            case .strawberry: return [.strawberry: 16]
            case .banana: return [.banana: 2]
            case .kiwi: return [.kiwi: 3]
            case .pineapple: return [.pineapple: 2]
            case .strawberrybanana: return [.strawberry: 10, .banana: 1]
            case .mango: return [.mango: 3]
            case .mangokiwi: return [.mango: 2,.kiwi: 1]
            }
        }
    }
    
    private func checkStock(juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            guard fruitStore.hasEnoughFruit(which: fruit, on: amount) == true else {
                throw FruitStockError.outOfStock
            }
        }
        
    }
    
    func makeJuice(juice: Juice) throws {
        try checkStock(juice: juice)
        for (fruit, amount) in juice.recipe {
            fruitStore.useFruit(fruit: fruit, amount: amount)
        }
    }
}


