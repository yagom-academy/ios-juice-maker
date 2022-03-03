import Foundation

struct JuiceMaker {
    typealias JuiceRecipe = [FruitType:Int]
    private(set) var fruitStore: FruitStore = FruitStore()
    enum JuiceType {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        func recipe() -> JuiceRecipe {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoJuice:
                return [.mango: 3]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
        
        func name() -> String {
            switch self {
            case .strawberryJuice:
                return "딸기쥬스"
            case .bananaJuice:
                return "바나나쥬스"
            case .kiwiJuice:
                return "키위쥬스"
            case .pineappleJuice:
                return "파인애플쥬스"
            case .strawberryBananaJuice:
                return "딸기바나나쥬스"
            case .mangoJuice:
                return "망고쥬스"
            case .mangoKiwiJuice:
                return "망고키위쥬스"
            }
        }
    }
    
    func makeJuice(juice: JuiceType) throws -> JuiceType {
        let recipe: JuiceRecipe = JuiceType.recipe(juice)()
        try checkEnoughFruitStock(fruitTypes: recipe.keys.map({ $0 }), amounts: recipe.values.map({ $0 }))
        try consumeFruitStock(fruitTypes: recipe.keys.map({ $0 }), amounts: recipe.values.map({ $0 }))
        return juice
    }
    
    private func checkEnoughFruitStock(fruitTypes: [FruitType], amounts: [Int]) throws {
        for index in 0..<amounts.count {
            let currentStock = fruitStore.numberOfStock(fruit: fruitTypes[index])
            if currentStock < amounts[index] {
                throw JuiceMakerError.notEnoughStock
            }
        }
    }
    
    private func consumeFruitStock(fruitTypes: [FruitType], amounts: [Int]) throws {
        for index in 0..<amounts.count {
            try fruitStore.decreaseStock(fruit: fruitTypes[index], amount: amounts[index])
        }
    }
}
