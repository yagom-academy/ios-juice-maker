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
        if strawberry.count >= 16 {
            strawberry.increment(amount: -16)
        } else {
            throw JuiceMakerError.countUnderZero
        }
    }
    func bananaJuice() throws {
        if banana.count >= 2 {
            banana.increment(amount: -2)
        } else {
            throw JuiceMakerError.countUnderZero
        }
    }
    func kiwiJuice() throws {
        if kiwi.count >= 3 {
            kiwi.increment(amount: -3)
        } else {
            throw JuiceMakerError.countUnderZero
        }
    }
    func pineappleJuice() throws {
        if pineapple.count >= 2 {
            pineapple.increment(amount: -2)
        } else {
            throw JuiceMakerError.countUnderZero
        }
    }
    func mangoJuice() throws {
        if mango.count >= 3 {
            mango.increment(amount: -3)
        } else {
            throw JuiceMakerError.countUnderZero
        }
    }
    func strawberryBananaJuice() throws {
        if strawberry.count >= 10 && banana.count >= 1 {
            strawberry.increment(amount: -10)
            banana.increment(amount: -1)
        } else {
            throw JuiceMakerError.countUnderZero
        }
    }
    func mangoKiwiJuice() throws {
        if mango.count >= 2 && kiwi.count >= 1 {
            mango.increment(amount: -2)
            kiwi.increment(amount: -1)
        } else {
            throw JuiceMakerError.countUnderZero
        }
    }
}
