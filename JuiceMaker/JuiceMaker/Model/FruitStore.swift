import Foundation


// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    let defaultStock = 10
    var fruits: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            fruits[fruit] = defaultStock
        }
    }
    
    func increaseStock(fruit: Fruit, amount: Int) {
        guard let currentStock = fruits[fruit] else { return }
        fruits.updateValue(currentStock + amount, forKey: fruit)
    }
    
    func decreaseStock(fruit: Fruit, amount: Int) {
        guard let currentStock = fruits[fruit] else { return }
        fruits.updateValue(currentStock - amount, forKey: fruit)
    }
}

