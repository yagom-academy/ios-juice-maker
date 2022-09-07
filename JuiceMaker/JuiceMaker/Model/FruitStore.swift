//
//  Created by Baem, Jeremy
//
//

class FruitStore {
    private(set) public var stock: [Fruit: Int] = [
        .strawBerry: 10,
        .banana: 10,
        .pineApple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    func checkStockAvailability(of juice: Juice) throws {
        for (fruitName, requiredamount) in juice.recipe {
            guard let stock = self.stock[fruitName], stock > requiredamount else {
                throw StockError.notEnoughFruit
            }
        }
    }
    
    func useStockForRecipe(of juice: Juice) {
        for (fruitName, requiredAmount) in juice.recipe {
            if let stock = self.stock[fruitName] {
                self.stock.updateValue(stock - requiredAmount, forKey: fruitName)
            }
        }
    }
}
