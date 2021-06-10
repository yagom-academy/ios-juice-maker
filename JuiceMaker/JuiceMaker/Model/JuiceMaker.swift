import Foundation

struct JuiceMaker {
    var fruits = FruitStore()

    enum JuiceMakerError: Error {
        case countUnderZero
    }

    func strawberryJuice() throws {
        try fruits.decreaseStock(amount: 16, fruit: self.fruits.strawberry)
    }
    func bananaJuice() throws {
        try fruits.decreaseStock(amount: 2, fruit: fruits.banana)
    }
    func kiwiJuice() throws {
        try fruits.decreaseStock(amount: 3, fruit: fruits.kiwi)
    }
    func pineappleJuice() throws {
        try fruits.decreaseStock(amount: 2, fruit: fruits.pineapple)
    }
    func mangoJuice() throws {
        try fruits.decreaseStock(amount: 3, fruit: fruits.mango)
    }
    func strawberryBananaJuice() throws {
        try fruits.decreaseStock(amount: 10, fruit: fruits.strawberry)
        try fruits.decreaseStock(amount: 1, fruit: fruits.banana)
    }
    func mangoKiwiJuice() throws {
        try fruits.decreaseStock(amount: 2, fruit: fruits.mango)
        try fruits.decreaseStock(amount: 1, fruit: fruits.kiwi)
    }
}
