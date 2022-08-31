struct FruitStore {
    private var fruitList: [Fruits: Int] = [:]
    
    init(fruitAmount: Int = 10) {
        for fruit in Fruits.allCases {
            fruitList[fruit] = fruitAmount
        }
    }
    
    mutating func changeAmountOfFruits(fruit: Fruits, amount: Int) {
        fruitList[fruit] = amount
    }
    
    mutating func subtractAmount(of fruit: Fruits, by amount: Int) throws {
        guard let numberOfFruits = fruitList[fruit] else {
            throw ErrorHandling.notExistFruits
        }
        
        if numberOfFruits - amount < 0 {
            throw ErrorHandling.underFlowOfAmount
        }
        
        fruitList[fruit] = numberOfFruits - amount
    }
}
