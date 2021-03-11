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
            return FruitInfo(firstName:Fruit.strawberry, firstCount: DeductionCount.strawberryOfStrawberryJuice, secondName: nil, secondCount: nil)
        case .banana:
            return FruitInfo(firstName:Fruit.banana, firstCount: DeductionCount.bananaOfBananaJuice, secondName: nil, secondCount: nil)
        case .pineapple:
            return FruitInfo(firstName:Fruit.pineapple, firstCount: DeductionCount.pineappleOfPineappleJuice, secondName: nil, secondCount: nil)
        case .kiwi:
            return FruitInfo(firstName:Fruit.kiwi, firstCount: DeductionCount.kiwiOfKiwiJuice, secondName: nil, secondCount: nil)
        case .mango:
            return FruitInfo(firstName:Fruit.mango, firstCount: DeductionCount.mangoOfMangoJuice, secondName: nil, secondCount: nil)
        case .strawberryBanana:
            return FruitInfo(firstName:Fruit.strawberry, firstCount: DeductionCount.strawberryOfstrawberryBananaJuice, secondName: Fruit.banana, secondCount: DeductionCount.bananaOfstrawberryBananaJuice)
        case .mangoKiwi:
            return FruitInfo(firstName:Fruit.mango, firstCount: DeductionCount.mangoOfMangoKiwiJuice, secondName: Fruit.kiwi, secondCount: DeductionCount.kiwiOfMangoKiwiJuice)
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
    
    var fruitInventory: [Fruit:Int] {
        get {
            return inventory
        }
    }
    
    func deductFruit(name: Fruit, count: Int){
        guard let oldValue = inventory[name] else {
            return
        }
        inventory.updateValue(oldValue - count, forKey: name)
    }
    
    func addFruit(name: Fruit, count: Int){
        guard let oldValue = inventory[name] else {
            return
        }
        inventory.updateValue(oldValue + count, forKey: name)
    }
    
    func deductInventory(name: Juice) {
        switch name {
        case Juice.strawberry:
            deductFruit(name: Fruit.strawberry, count: DeductionCount.strawberryOfStrawberryJuice)
        case Juice.banana:
            deductFruit(name: Fruit.banana, count: DeductionCount.bananaOfBananaJuice)
        case Juice.kiwi:
            deductFruit(name: Fruit.kiwi, count: DeductionCount.kiwiOfKiwiJuice)
        case Juice.pineapple:
            deductFruit(name: Fruit.pineapple, count: DeductionCount.pineappleOfPineappleJuice)
        case Juice.strawberryBanana:
            deductFruit(name: Fruit.strawberry, count: DeductionCount.strawberryOfstrawberryBananaJuice)
            deductFruit(name: Fruit.banana, count: DeductionCount.bananaOfstrawberryBananaJuice)
        case Juice.mango:
            deductFruit(name: Fruit.mango, count: DeductionCount.mangoOfMangoJuice)
        case Juice.mangoKiwi:
            deductFruit(name: Fruit.mango, count: DeductionCount.mangoOfMangoKiwiJuice)
            deductFruit(name: Fruit.kiwi, count: DeductionCount.kiwiOfMangoKiwiJuice)
        default:
            break
        }
    }
    
    func makeFruitJuice(name: Juice) {
        let firstName: Fruit = name.fruitCount.firstName
        let firstCount: Int = name.fruitCount.firstCount
        let secondName: Fruit? = name.fruitCount.secondName
        let secondCount: Int? = name.fruitCount.secondCount
        
        if firstCount > inventory[firstName]! {
            return
        }
        
        if secondCount != nil && secondName != nil && secondCount! > inventory[secondName!]! {
            return
        }
        
        deductInventory(name: name)
    }
    
}
