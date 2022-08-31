class FruitStore {
    private var fruitList: [Fruits: Int] = [:]
    
    init(fruitAmount: Int = 10) {
        for fruit in Fruits.allCases {
            fruitList[fruit] = fruitAmount
        }
    }
    
    func changeAmountOfFruits(fruit: Fruits, amount: Int) {
        fruitList[fruit] = amount
    }
    
    func subtractAmount(of fruit: Fruits, by amount: Int) throws {
        guard let numberOfFruits = fruitList[fruit] else {
            throw ErrorHandling.notExistFruits
        }
        
        if numberOfFruits - amount < 0 {
            throw ErrorHandling.underFlowOfAmount
        }
        
        fruitList[fruit] = numberOfFruits - amount
    }
}
