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
       
class JuiceMaker {
    fileprivate(set) var strawberryStock: UInt
    fileprivate(set) var bananaStock: UInt
    fileprivate(set) var pineappleStock: UInt
    fileprivate(set) var kiwiStock: UInt
    fileprivate(set) var mangoStock: UInt
    
    private let strawberryForStrawberryJuice: UInt = 16
    private let bananaForBananaJuice: UInt = 2
    private let pineappleForPineappleJuice: UInt = 2
    private let kiwiForKiwiJuice: UInt = 3
    private let mangoForMangoJuice: UInt = 3
    private let strawberryForStrawberryBananaJuice: UInt = 10
    private let bananaForStrawberryBananaJuice: UInt = 1
    private let mangoForMangoKiwiJuice: UInt = 2
    private let kiwiForMangoKiwiJuice: UInt = 1

    init(strawberryStock: UInt, bananaStock: UInt, pineappleStock: UInt, kiwiStock: UInt, mangoStock: UInt) {
        self.strawberryStock = strawberryStock
        self.bananaStock = bananaStock
        self.pineappleStock = pineappleStock
        self.kiwiStock = kiwiStock
        self.mangoStock = mangoStock
    }
    
    func makeJuice(name: Juice) {
        switch name {
        case .strawberryJuice:
            strawberryStock -= strawberryForStrawberryJuice
        case .bananaJuice:
            bananaStock -= bananaForBananaJuice
        case .pineappleJuice:
            pineappleStock -= pineappleForPineappleJuice
        case .kiwiJuice:
            kiwiStock -= kiwiForKiwiJuice
        case .mangoJuice:
            mangoStock -= mangoForMangoJuice
        case .strawberryBananaJuice:
            strawberryStock -= strawberryForStrawberryBananaJuice
            bananaStock -= bananaForStrawberryBananaJuice
        case .mangoKiwiJuice:
            mangoStock -= mangoForMangoKiwiJuice
            kiwiStock -= kiwiForMangoKiwiJuice
        }
    }

    func changeNumberOfFruit(stockName: inout Int, number: Int) {
        stockName += number
    }
}
