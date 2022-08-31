struct FruitStore {
    private var fruitList: [Fruits: Int] = [:]
    
    init(fruitAmount: Int = 10) {
        for fruit in Fruits.allCases {
            changeAmount(of: fruit, amount: fruitAmount)
        }
    }
    
    mutating func changeAmount(of fruit: Fruits, amount: Int) {
        fruitList[fruit] = amount
    }
    
    mutating func use(_ fruit: Fruits, of amount: Int) throws {
        guard let numberOfFruit = fruitList[fruit] else {
            throw JuiceMakerError.notExistFruits
        }
        
        if numberOfFruit - amount < 0 {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        fruitList[fruit] = numberOfFruit - amount
    }
    
    mutating func use(
        firstFruit: Fruits,
        firstAmount: Int,
        secondFruit: Fruits,
        secondAmount: Int
    ) throws {
        guard let numberOfFruit1 = fruitList[firstFruit],
              let numberOfFruit2 = fruitList[secondFruit] else {
            throw JuiceMakerError.notExistFruits
        }
        
        if numberOfFruit1 - firstAmount < 0 || numberOfFruit2 - secondAmount < 0 {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        fruitList[firstFruit] = numberOfFruit1 - firstAmount
        fruitList[secondFruit] = numberOfFruit2 - secondAmount
    }
}
