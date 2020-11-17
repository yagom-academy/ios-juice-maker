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

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class JuiceMaker {
    var strawberryStock: Int = 10
    var bananaStock: Int = 10
    var pineappleStock: Int = 10
    var kiwiStock: Int = 10
    var mangoStock: Int = 10
    
    func makeJuice(_ juice: Juice) {
        switch juice {
        case .strawberryJuice:
            strawberryStock -= 3
        case .bananaJuice:
            bananaStock -= 3
        case .pineappleJuice:
            pineappleStock -= 3
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
    
    func addFruitStock(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberryStock += 1
        case .banana:
            bananaStock += 1
        case .pineapple:
            pineappleStock += 1
        case .kiwi:
            kiwiStock += 1
        case .mango:
            mangoStock += 1
        }
    }
    
    func removeFruitStock(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberryStock -= 1
        case .banana:
            bananaStock -= 1
        case .pineapple:
            pineappleStock -= 1
        case .kiwi:
            kiwiStock -= 1
        case .mango:
            mangoStock -= 1
        }
    }
}
