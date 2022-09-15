//
//  Created by Baem, Jeremy
//
//
import Foundation

class FruitStore {
    var stock: [String: Int] = [
        Fruit.strawBerry.rawValue: 10,
        Fruit.banana.rawValue: 10,
        Fruit.pineApple.rawValue: 10,
        Fruit.kiwi.rawValue: 10,
        Fruit.mango.rawValue: 10
    ]
    
    func checkStockAvailability(of juice: Juice) throws {
        for (fruitName, requiredamount) in juice.recipe {
            guard let stock = self.stock[fruitName.rawValue], stock >= requiredamount else {
                throw StockError.notEnoughFruit
            }
        }
    }
    
    func useStockForRecipe(of juice: Juice) {
        for (fruitName, requiredAmount) in juice.recipe {
            if let stock = self.stock[fruitName.rawValue] {
                self.stock.updateValue(stock - requiredAmount, forKey: fruitName.rawValue)
            }
        }
    }
}
