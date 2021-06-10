import Foundation

struct JuiceMaker {
    
    var strawberry = Strawberry()
    var banana = Banana()
    var kiwi = Kiwi()
    var pineapple = Pineapple()
    var mango = Mango()
    
    enum JuiceMakerError: Error {
        case countUnderZero
    }
    
    func strawberryJuice() throws {
        try strawberry.decreaseStock(amount: 16)
    }
    func bananaJuice() throws {
        try banana.decreaseStock(amount: 2)
    }
    func kiwiJuice() throws {
        try kiwi.decreaseStock(amount: 3)
    }
    func pineappleJuice() throws {
        try pineapple.decreaseStock(amount: 2)
    }
    func mangoJuice() throws {
        try mango.decreaseStock(amount: 3)
    }
    func strawberryBananaJuice() throws {
        try strawberry.decreaseStock(amount: 10)
        try banana.decreaseStock(amount: 1)
    }
    func mangoKiwiJuice() throws {
        try mango.decreaseStock(amount: 2)
        try kiwi.decreaseStock(amount: 1)
    }
}
