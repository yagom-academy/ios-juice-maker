import Foundation

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}
// 과일 저장소 타입
class FruitStore {
    let defaultStock = 10
    var fruits: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            fruits[fruit] = defaultStock
        }
    }
    
    func adjustStock(fruit: Fruit, amount: Int) {
        guard let currentStock = fruits[fruit] else {
            return
        }
        fruits.updateValue(currentStock + amount, forKey: fruit)
    }
}

