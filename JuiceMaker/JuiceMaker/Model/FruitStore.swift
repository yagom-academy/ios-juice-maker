class FruitStore {
    var fruitList: [Fruits: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    init(fruitAmount: Int) {
        for fruit in fruitList.keys {
            fruitList[fruit] = fruitAmount
        }
    }
    
    func changeAmountOfFruits(fruit: Fruits, amount: Int) {
        fruitList[fruit] = amount
    }
    
    func subtractAmount(of fruit: Fruits, by amount: Int) {
        guard let numberOfFruits = fruitList[fruit] else {
            
            print("해당 과일이 없습니다.")
            return
        }
        
        if numberOfFruits - amount < 0 {
            print("재료가 부족합니다.")
            return
        }
        
        fruitList[fruit] = numberOfFruits - amount
        print(fruitList)
    }
}
