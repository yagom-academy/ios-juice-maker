import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()

    enum JuiceMakerError: Error {
        case insufficientFruit
    }

    func makeStrawberryJuice() throws {
        try fruitStore.decreaseStock(amount: 16, fruit: fruitStore.strawberry)
    }
    func makeBananaJuice() throws {
        try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.banana)
    }
    func makeKiwiJuice() throws {
        try fruitStore.decreaseStock(amount: 3, fruit: fruitStore.kiwi)
    }
    func makePineappleJuice() throws {
        try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.pineapple)
    }
    func makeMangoJuice() throws {
        try fruitStore.decreaseStock(amount: 3, fruit: fruitStore.mango)
    }
    func makeStrawberryBananaJuice() throws {
        try fruitStore.decreaseStock(amount: 10, fruit: fruitStore.strawberry)
        try fruitStore.decreaseStock(amount: 1, fruit: fruitStore.banana)
    }
    func makeMangoKiwiJuice() throws {
        try fruitStore.decreaseStock(amount: 2, fruit: fruitStore.mango)
        try fruitStore.decreaseStock(amount: 1, fruit: fruitStore.kiwi)
    }
}
