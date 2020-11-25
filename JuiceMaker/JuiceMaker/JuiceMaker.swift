//그린
// 쥬스 메이커 타입

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
}

struct FruitAmountForJuice {
    fileprivate let strawberryForStrawberryJuice: UInt = 16
    fileprivate let bananaForBananaJuice: UInt = 2
    fileprivate let pineappleForPineappleJuice: UInt = 2
    fileprivate let kiwiForKiwiJuice: UInt = 3
    fileprivate let mangoForMangoJuice: UInt = 3
    fileprivate let strawberryForStrawberryBananaJuice: UInt = 10
    fileprivate let bananaForStrawberryBananaJuice: UInt = 1
    fileprivate let mangoForMangoKiwiJuice: UInt = 2
    fileprivate let kiwiForMangoKiwiJuice: UInt = 1
}
       
class JuiceMaker {
    fileprivate(set) var strawberryStock: UInt
    fileprivate(set) var bananaStock: UInt
    fileprivate(set) var pineappleStock: UInt
    fileprivate(set) var kiwiStock: UInt
    fileprivate(set) var mangoStock: UInt
    
    private var amountOfNeed = FruitAmountForJuice()
    
    init(strawberryStock: UInt = 10, bananaStock: UInt = 10, pineappleStock: UInt = 10, kiwiStock: UInt = 10, mangoStock: UInt = 10) {
        self.strawberryStock = strawberryStock
        self.bananaStock = bananaStock
        self.pineappleStock = pineappleStock
        self.kiwiStock = kiwiStock
        self.mangoStock = mangoStock
    }
    
    func make(juice: Juice) {
        switch juice {
        case .strawberryJuice:
            strawberryStock -= amountOfNeed.strawberryForStrawberryJuice
        case .bananaJuice:
            bananaStock -= amountOfNeed.bananaForBananaJuice
        case .pineappleJuice:
            pineappleStock -= amountOfNeed.pineappleForPineappleJuice
        case .kiwiJuice:
            kiwiStock -= amountOfNeed.kiwiForKiwiJuice
        case .mangoJuice:
            mangoStock -= amountOfNeed.mangoForMangoJuice
        case .strawberryBananaJuice:
            strawberryStock -= amountOfNeed.strawberryForStrawberryBananaJuice
            bananaStock -= amountOfNeed.bananaForStrawberryBananaJuice
        case .mangoKiwiJuice:
            mangoStock -= amountOfNeed.mangoForMangoKiwiJuice
            kiwiStock -= amountOfNeed.kiwiForMangoKiwiJuice
        }
    }

    func manage(fruitStock: inout Int, amount: Int) {
        fruitStock += amount
    }
}
