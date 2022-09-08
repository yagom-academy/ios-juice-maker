struct FruitStore {
    private var fruitList: [Fruits: Int] = [:]
    
    init(fruitCount: Int = 10) {
        for fruit in Fruits.allCases {
            changeCount(of: fruit, count: fruitCount)
        }
    }
    
    func requestFruitList() -> [Fruits: Int] {
        return fruitList
    }
    
    mutating private func changeCount(of fruit: Fruits, count: Int) {
        fruitList[fruit] = count
    }
    
    mutating func use(_ fruit: Fruits, of count: Int) throws {
        guard let countOfFruit = fruitList[fruit] else {
            throw JuiceMakerError.notExistFruits
        }
        
        if countOfFruit - count < 0 {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        fruitList[fruit] = countOfFruit - count
    }
    
    mutating func use(
        firstFruit: Fruits,
        firstCount: Int,
        secondFruit: Fruits,
        secondCount: Int
    ) throws {
        guard let countOfFruit1 = fruitList[firstFruit],
              let countOfFruit2 = fruitList[secondFruit] else {
            throw JuiceMakerError.notExistFruits
        }
        
        if countOfFruit1 - firstCount < 0 || countOfFruit2 - secondCount < 0 {
            throw JuiceMakerError.underFlowOfAmount
        }
        
        fruitList[firstFruit] = countOfFruit1 - firstCount
        fruitList[secondFruit] = countOfFruit2 - secondCount
    }
}
