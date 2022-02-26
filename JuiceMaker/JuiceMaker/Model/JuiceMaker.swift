import Foundation

struct JuiceMaker {
    typealias JuiceRecipe = [FruitType:Int]
    private let fruitStore: FruitStore = FruitStore()
    enum JuiceType {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
        
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
        try consumeFruitStock(fruitTypes: recipe.keys.map({ $0 }), amounts: recipe.values.map({ $0 }))
    }
    
    private func consumeFruitStock(fruitTypes: [FruitType], amounts: [Int]) throws {
        for index in 0..<amounts.count {
            try fruitStore.decreaseStock(fruit: fruitTypes[index], amount: amounts[index])
        }
    }
}
