import Foundation

struct FruitStore {
    private var fruitList: [Fruits: Int] = [:] {
        didSet {
            NotificationCenter.default.post(
                name: Notification.Name("showFruitCount"),
                object: fruitList,
                userInfo: nil)
        }
    }
    
    init(fruitCount: Int = 10) {
        for fruit in Fruits.allCases {
            changeCount(of: fruit, count: fruitCount)
        }
    }
    
    func requestFruitList() -> [Fruits: Int] {
        return fruitList
    }
    
    func requestFruitCount(fruit: Fruits) -> Int? {
        return fruitList[fruit]
    }
    
    mutating func changeCount(of fruit: Fruits, count: Int) {
        fruitList[fruit] = count
    }
    
    mutating func use(_ fruit: Fruits, of count: Int) throws {
        guard let countOfFruit = fruitList[fruit] else {
            throw JuiceMakerError.notExistFruits
        }
        
        changeCount(of: fruit, count: countOfFruit - count)
    }
    
    func isFruitListStock(_ fruits: [Fruits: Int]) -> Bool {
        for (fruit, count) in fruits {
            guard let countOfFruit = fruitList[fruit] else { return false }
            
            if countOfFruit - count < 0 { return false }
        }
        return true
    }
}
