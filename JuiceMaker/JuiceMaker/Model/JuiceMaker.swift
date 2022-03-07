import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(by order: Juice) throws {
        let juiceRecipe = order.recipe
        try fruitStore.decreaseFruitStock(by: juiceRecipe)
    }
    
    func getFruitsStock() -> [Int] {
        var fruitStockArray: [Int] = []
        
        fruitStockArray = Fruit.allCases.compactMap { fruitStore.inventory[ $0 ] }
        
        return fruitStockArray
    }
}

