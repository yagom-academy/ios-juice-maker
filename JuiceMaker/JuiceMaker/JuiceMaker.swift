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
    fileprivate var strawberryStock: Int = 10
    fileprivate var bananaStock: Int = 10
    fileprivate var pineappleStock: Int = 10
    fileprivate var kiwiStock: Int = 10
    fileprivate var mangoStock: Int = 10
    
    var currentStrawberryStock: Int {
        get {
            return strawberryStock
        }
    }
    
    var currentBananaStock: Int {
        get {
            return bananaStock
        }
    }
    
    var currentPineappleStock: Int {
        get {
            return pineappleStock
        }
    }
    
    var currentKiwiStock: Int {
        get {
            return kiwiStock
        }
    }
    
    var currentMangoStock: Int {
        get {
            return mangoStock
        }
    }
    
    func makeJuice(juiceName: Juice) {
        switch juiceName {
        case .strawberryJuice:
            strawberryStock -= 16
        case .bananaJuice:
            bananaStock -= 2
        case .pineappleJuice:
            pineappleStock -= 2
        case .kiwiJuice:
            kiwiStock -= 3
        case .mangoJuice:
            mangoStock -= 3
        case .strawberryBananaJuice:
            strawberryStock -= 10
            bananaStock -= 1
        case .mangoKiwiJuice:
            mangoStock -= 2
            kiwiStock -= 1
        }
    }

    func supplyFruit(StockName fruit: inout Int, numberOfSupply number: Int) {
        fruit += number
    }
    
    func demandFruit(StockName fruit: inout Int, numberOfDemand number: Int) {
        fruit -= number
    }
}
