import Foundation

class FruitStock {
    public private(set) var fruits: Storage = [:]
    
    init(initAmount: Int) {
        for kindFruit in Fruits.allCases {
            fruits.updateValue(initAmount, forKey: kindFruit)
        }
    }
    
    func manageStorage(fruit kind: Fruits, amount: Int) {
        fruits.updateValue(fruits[kind]! + amount, forKey: kind)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "changeFruitAmount"), object: kind)
    }
}
