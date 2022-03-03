import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore()
    func makeJuice(by order: Juice) -> Bool {
        let juiceRecipe = order.recipe
        guard let result = try? fruitStore.canDecreaseFruitStock(by: juiceRecipe) else {
            return false
        }
        
        return result
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

