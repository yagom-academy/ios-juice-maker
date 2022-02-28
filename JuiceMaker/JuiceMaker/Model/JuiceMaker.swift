import Foundation

struct JuiceMaker {
   func makeJuice(by order: Juice) {
        let juiceRecipe = order.recipe
        
        do {
            try FruitStore.shared.decreaseFruitStock(by: juiceRecipe)
        } catch {
            print(error.localizedDescription)
        }
    }
}

