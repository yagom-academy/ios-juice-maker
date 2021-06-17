import Foundation

class FruitStore {
    private(set) var strawberry = Fruit()
    private(set) var banana = Fruit()
    private(set) var kiwi = Fruit()
    private(set) var pineapple = Fruit()
    private(set) var mango = Fruit()
    
    func decreaseStock(amount: Int = 1, fruit: Fruit) throws {
        if fruit.stock - amount >= 0 {
            fruit.stock -= amount
        } else {
            throw JuiceMakerError.insufficientFruit
        }
    }
    
    func increaseStock(amount: Int = 1, fruit: Fruit) throws {
        if fruit.stock + amount >= 0 {
            fruit.stock += amount
        } else {
            throw JuiceMakerError.insufficientFruit
        }
    }
    
    func decreaseStock(firstFruitAmount: Int, firstFruit: Fruit, secondFruitAmount: Int, secondFruit: Fruit) throws {
        if firstFruit.stock - firstFruitAmount >= 0 && secondFruit.stock - secondFruitAmount >= 0 {
            firstFruit.stock -= firstFruitAmount
            secondFruit.stock -= secondFruitAmount
        } else {
            throw JuiceMakerError.insufficientFruit
        }
    }
}

class Fruit {
    var stock: Int 
    init(stock: Int = 10) {
        self.stock = stock
    }
}
