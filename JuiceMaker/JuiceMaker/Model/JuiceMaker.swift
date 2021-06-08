import Foundation

struct JuiceMaker {
    
    var strawberry = Strawberry()
    var banana = Banana()
    var kiwi = Kiwi()
    var pineapple = Pineapple()
    var mango = Mango()
    
    
    func strawberryJuice() {
        strawberry.increment(amount: -16)
    }
    func bananJuice() {
        banana.increment(amount: -2)
    }
    func kiwiJuice() {
        kiwi.increment(amount: -3)
    }
    func pineappleJuice() {
        pineapple.increment(amount: -2)
    }
    func mangoJuice() {
        mango.increment(amount: -3)
    }
    func strawberryBananaJuice() {
        strawberry.increment(amount: -10)
        banana.increment(amount: -1)
    }
    func mangoKiwiJuice() {
        mango.increment(amount: -2)
        kiwi.increment(amount: -1)
    }
    
}
