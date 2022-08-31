struct FruitStore {
    private var fruitList: [Fruits: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    init(fruitAmount: Int) {
        for fruit in fruitList.keys {
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
