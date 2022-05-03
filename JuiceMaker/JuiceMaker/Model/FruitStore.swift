class FruitStore {
    private var fruitStock: [Fruit: Int] = [:]
    
    func subtractQuantity(fruit: Fruit, by number: Int) throws {
        guard let quantity = fruitStock[fruit] else {
            return
        }
        
        if quantity < number {
            throw JuiceMakerError.outOfStock
        }
        
        fruitStock[fruit] = quantity - number
    }

    func modifyStock(fruit: Fruit, to number: Int) {
        fruitStock[fruit] = number
    }
    
    func stockAsString(fruit: Fruit) -> String {
        guard let stock = fruitStock[fruit] else {
            return "0"
        }
        
        return String(stock)
    }
    
    func stockAsDouble(fruit: Fruit) -> Double {
        guard let stock = fruitStock[fruit] else {
            return 0.0
        }
        
        return Double(stock)
    }
    
    init(quantity: Int) {
        for fruit in Fruit.allCases {
            fruitStock.updateValue(quantity, forKey: fruit)
        }
    }
}


