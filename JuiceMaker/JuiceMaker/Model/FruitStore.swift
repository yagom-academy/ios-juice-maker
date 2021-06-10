import Foundation

class FruitStore {
    var strawberry = Fruit()
    var banana = Fruit()
    var kiwi = Fruit()
    var pineapple = Fruit()
    var mango = Fruit()

    func increaseStock(amount:Int = 1, fruit: Fruit){
        fruit.stock += amount
    }
    func decreaseStock(amount:Int = 1, fruit: Fruit) throws {
        if fruit.stock - amount >= 0{
            fruit.stock -= amount
        }else {
            throw JuiceMaker.JuiceMakerError.countUnderZero
        }
    }

}
class Fruit {
    var stock:Int
    init(stock:Int = 10) {
        self.stock = stock
    }
}
