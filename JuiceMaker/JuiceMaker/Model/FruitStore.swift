import Foundation

class FruitStore {
    private(set) var strawberry = Fruit()
    private(set) var banana = Fruit()
    private(set) var kiwi = Fruit()
    private(set) var pineapple = Fruit()
    private(set) var mango = Fruit()

    func increaseStock(amount: Int = 1, fruit: Fruit) {
        fruit.stock += amount
    }
    
    func decreaseStock(amount: Int = 1, fruit: Fruit) throws {
        if fruit.stock - amount >= 0 {
            fruit.stock -= amount
        } else {
            throw JuiceMaker.JuiceMakerError.insufficientFruit
        }
    }
}

class Fruit {
    var stock: Int
    init(stock: Int = 10) {
        self.stock = stock
    }
}
