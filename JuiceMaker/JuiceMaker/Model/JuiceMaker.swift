import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(by order: Juice) throws {
        let juiceRecipe = order.recipe
        try fruitStore.decreaseFruitStock(by: juiceRecipe)
    }
    
    func getFruitsStock() -> [Int] {
        var fruitStockArray: [Int] = []
        
        for fruit in Fruit.allCases {
            if let stock = fruitStore.inventory[fruit] {
                fruitStockArray.append(stock)
            }
        }
        
        return fruitStockArray
    }
}

