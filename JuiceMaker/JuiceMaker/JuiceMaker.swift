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

class JuiceMaker {
    private var inventory: [Fruit:Int] = [Fruit.strawberry: 0, Fruit.banana: 0, Fruit.pineapple: 0, Fruit.kiwi: 0, Fruit.mango: 0]
    
    init(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        inventory[Fruit.strawberry] = strawberry
        inventory[Fruit.banana] = banana
        inventory[Fruit.pineapple] = pineapple
        inventory[Fruit.kiwi] = kiwi
        inventory[Fruit.mango] = mango
    }
    
    var fruitInventory:[Fruit:Int] {
        get {
            return inventory
        }
    }
    
    func deductInventory(name:Juice){
        switch name {
        case Juice.strawberry:
            inventory[Fruit.strawberry]! -= DeductionCount.strawberryOfStrawberryJuice
        case Juice.banana:
            inventory[Fruit.banana]! -= DeductionCount.bananaOfBananaJuice
        case Juice.kiwi:
            inventory[Fruit.kiwi]! -= DeductionCount.kiwiOfKiwiJuice
        case Juice.pineapple:
            inventory[Fruit.pineapple]! -= DeductionCount.pineappleOfPineappleJuice
        case Juice.strawberryBanana:
            inventory[Fruit.strawberry]! -= DeductionCount.strawberryOfstrawberryBananaJuice
            inventory[Fruit.banana]! -= DeductionCount.bananaOfstrawberryBananaJuice
        case Juice.mango:
            inventory[Fruit.mango]! -= DeductionCount.mangoOfMangoJuice
        case Juice.mangoKiwi:
            inventory[Fruit.mango]! -= DeductionCount.mangoOfMangoKiwiJuice
            inventory[Fruit.kiwi]! -= DeductionCount.kiwiOfMangoKiwiJuice
        default:
            break
        }
    }
    
    func makeFruitJuice(name: Juice) {
        let firstName: Fruit = name.fruitCount.firstName
        let firstCount: Int = name.fruitCount.firstCount
        let secondName : Fruit? = name.fruitCount.secondName
        let secondCount : Int? = name.fruitCount.secondCount
        
        if firstCount > inventory[firstName]! {
            return
        }
        
        if secondCount != nil && secondName != nil && secondCount! > inventory[secondName!]! {
            return
        }
        
        deductInventory(name: name)
    }
    
    func addFruit(name: Fruit , count: Int) {
        switch name {
        case Fruit.strawberry:
            inventory[name]! += count
        case Fruit.banana:
            inventory[name]! += count
        case Fruit.pineapple:
            inventory[name]! += count
        case Fruit.kiwi:
            inventory[name]! += count
        case Fruit.mango:
            inventory[name]! += count
        default:
            break
        }
    }
}
