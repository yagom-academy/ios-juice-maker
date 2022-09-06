//
//  Created by Baem, Jeremy
//
//

enum Juice: String {
    case strawBerry = "strawBerry"
    case banana = "banana"
    case kiwi = "kiwi"
    case pineApple = "pineApple"
    case strawBerryBanana = "strawBerryBanana"
    case mango = "mango"
    case mangoKiwi = "mangoKiwi"
    
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


