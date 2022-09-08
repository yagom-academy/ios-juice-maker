//
//  Created by Baem, Jeremy
//
//
import Foundation

class FruitStore: NSObject {
    @objc dynamic var stock: [String: Int] = [
        "딸기": 10,
        "바나나": 10,
        "파인애플": 10,
        "키위": 10,
        "망고": 10
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
