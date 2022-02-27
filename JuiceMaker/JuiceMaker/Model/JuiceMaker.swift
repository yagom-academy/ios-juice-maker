import Foundation

struct JuiceMaker {
    typealias JuiceRecipe = [FruitType:Int]
    private(set) var fruitStore: FruitStore = FruitStore()
    enum JuiceType: String {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case strawberryBananaJuice = "딸바쥬스"
        case mangoJuice = "망고쥬스"
        case mangoKiwiJuice = "망고키위쥬스"
        
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
    }
    
    func makeJuice(juice: JuiceType) throws {
        let recipe: JuiceRecipe = JuiceType.recipe(juice)()
        try checkEnoughFruitStock(fruitTypes: recipe.keys.map({ $0 }), amounts: recipe.values.map({ $0 }))
        try consumeFruitStock(fruitTypes: recipe.keys.map({ $0 }), amounts: recipe.values.map({ $0 }))
    }
    
    private func checkEnoughFruitStock(fruitTypes: [FruitType], amounts: [Int]) throws {
        for index in 0..<amounts.count {
            guard let currentStock = fruitStore.fruits[fruitTypes[index]] else { return }
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
