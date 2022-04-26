class FruitStore {
    var fruitStock: [Fruit: Int] = [:]
    
    func subtractQuantity(fruit: Fruit, by number: Int) throws {
        guard let quantity = fruitStock[fruit] else {
            return
        }
        
        if quantity < number {
            throw ThrowError.outOfStock
        }
        
        fruitStock[fruit] = quantity - number
    }
    
    func convertToString(fruit: Fruit) -> String {
        guard let stock = fruitStock[fruit] else {
            return "0"
        }
        
        return String(stock)
    }
    
    init(quantity: Int) {
        for fruit in Fruit.allCases {
            fruitStock.updateValue(quantity, forKey: fruit)
        }
    }
}


