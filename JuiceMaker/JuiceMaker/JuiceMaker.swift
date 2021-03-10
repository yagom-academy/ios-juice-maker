import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum DeductionCount {
    static let strawberryOfStrawberryJuice = 16
    static let bananaOfBananaJuice = 2
    static let kiwiOfKiwiJuice = 3
    static let pineappleOfPineappleJuice = 2
    static let strawberryOfstrawberryBananaJuice = 10
    static let bananaOfstrawberryBananaJuice = 1
    static let mangoOfMangoJuice = 3
    static let mangoOfMangoKiwiJuice = 2
    static let kiwiOfMangoKiwiJuice = 1
}

enum Juice {
    case strawberry, banana, pineapple, kiwi, mango, strawberryBanana, mangoKiwi
    var fruitCount : FruitInfo {
        switch self {
        case .strawberry:
            return FruitInfo(firstName:Fruit.strawberry, firstCount: 16, secondName: nil, secondCount: nil)
        case .banana:
            return FruitInfo(firstName:Fruit.banana, firstCount: 2, secondName: nil, secondCount: nil)
        case .pineapple:
            return FruitInfo(firstName:Fruit.pineapple, firstCount: 2, secondName: nil, secondCount: nil)
        case .kiwi:
            return FruitInfo(firstName:Fruit.kiwi, firstCount: 3, secondName: nil, secondCount: nil)
        case .mango:
            return FruitInfo(firstName:Fruit.mango, firstCount: 3, secondName: nil, secondCount: nil)
        case .strawberryBanana:
            return FruitInfo(firstName:Fruit.strawberry, firstCount: 10, secondName: Fruit.banana, secondCount: 1)
        case .mangoKiwi:
            return FruitInfo(firstName:Fruit.mango, firstCount: 2, secondName: Fruit.kiwi, secondCount: 1)
        default:
            break
        }
    }
}

struct FruitInfo {
    let firstName: Fruit, firstCount: Int, secondName: Fruit?, secondCount: Int?
}
