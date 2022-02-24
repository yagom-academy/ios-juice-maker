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
        if !hasEnoughFruitStock(recipe: recipe) {
            throw ErrorType.notEnoughStock
        }
        consumeFruitStock(recipe: recipe)
    }
    
    private func hasEnoughFruitStock(recipe: JuiceRecipe) -> Bool {
        for ingredient in recipe {
            let fruit = ingredient.key
            let amount = ingredient.value
            guard let currentStock = fruitStore.fruits[fruit] else { return false }
            guard currentStock >= amount else {
                return false
            }
        }
        return true
    }
    
    private func consumeFruitStock(recipe: JuiceRecipe) {
        for ingredient in recipe {
            let fruit = ingredient.key
            let amount = ingredient.value
            
            do {
                try fruitStore.decreaseStock(fruit: fruit, amount: amount)
            } catch {
                print("재고 없음")
            }
        }
    }
}
