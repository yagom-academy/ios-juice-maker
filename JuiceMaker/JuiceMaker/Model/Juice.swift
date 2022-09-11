//
//  Created by Baem, Jeremy
//
//

enum Juice: String {
    case strawBerry = "딸기쥬스"
    case banana = "바나나쥬스"
    case kiwi = "키위쥬스"
    case pineApple = "파인애플쥬스"
    case strawBerryBanana = "딸바쥬스"
    case mango = "망고쥬스"
    case mangoKiwi = "망키쥬스"
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawBerry:
            return [.strawBerry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineApple:
            return [.pineApple: 2]
        case .strawBerryBanana:
            return [.strawBerry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}


