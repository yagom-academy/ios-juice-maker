struct FruitStore {
    private(set) var fruitList: [Fruits: Int] = [:]
    
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
        guard let countOfFruit1 = fruitList[firstFruit],
              let countOfFruit2 = fruitList[secondFruit] else {
            throw JuiceMakerError.notExistFruits
        }
        
        if countOfFruit1 - firstAmount < 0 || countOfFruit2 - secondAmount < 0 {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        fruitList[firstFruit] = countOfFruit1 - firstAmount
        fruitList[secondFruit] = countOfFruit2 - secondAmount
    }
}
