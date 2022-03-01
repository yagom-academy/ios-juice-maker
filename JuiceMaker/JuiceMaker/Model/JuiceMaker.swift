import Foundation

struct JuiceMaker {
    func makeJuice(by order: Juice) -> Bool {
        let juiceRecipe = order.recipe
        
        guard let result = try? FruitStore.shared.canDecreaseFruitStock(by: juiceRecipe) else {
            return false
        }
        return result
    }
}

