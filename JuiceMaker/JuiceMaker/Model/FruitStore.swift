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
    
    mutating func subtractAmountOfOneIngridients(of fruit: Fruits, by amount: Int) throws {
        guard let numberOfFruit = fruitList[fruit] else {
            throw JuiceMakerError.notExistFruits
        }
        
        if numberOfFruit - amount < 0 {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        fruitList[fruit] = numberOfFruit - amount
    }
    
    mutating func subtractAmountOfTwoIngridients(
        _ fruit1: Fruits,
        _ amount1: Int,
        _ fruit2: Fruits,
        _ amount2: Int
    ) throws {
        guard let numberOfFruit1 = fruitList[fruit1],
              let numberOfFruit2 = fruitList[fruit2] else {
            throw JuiceMakerError.notExistFruits
        }
        
        if numberOfFruit1 - amount1 < 0 || numberOfFruit2 - amount2 < 0 {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        fruitList[fruit1] = numberOfFruit1 - amount1
        fruitList[fruit2] = numberOfFruit2 - amount2
    }
}
