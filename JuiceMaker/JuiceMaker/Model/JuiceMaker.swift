import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(by order: Juice) {
        let juiceRecipe = order.recipe
        
        do {
            try fruitStore.decreaseFruitStock(by: juiceRecipe)
            print("\(order)가 완성되었습니다")
        } catch {
            print(error.localizedDescription)
        }
    }
}

