import Foundation

class FruitStock {
    public private(set) var fruits: Storage = [:]
    
    init(initAmount: Int) {
        for kindFruit in Fruits.allCases {
            fruits.updateValue(initAmount, forKey: kindFruit)
        }
    }
    
    func manageStorage(fruit kind: Fruits, amount: Int) {
        guard let stock = fruits[kind] else {
            return NSLog(JuiceMakerError.invalidStock.localizedDescription)
        }
        fruits.updateValue(stock + amount, forKey: kind)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "changeFruitAmount"), object: kind)
    }
}
