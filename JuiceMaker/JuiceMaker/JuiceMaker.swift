import Foundation

enum KindOfFruit {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}

enum KindOfMenu {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    case strawberryAndBanana
    case mangoAndKiwi
}

enum makeJuiceResult {
    case success
    case fail
}

private struct Fruit {
    private let name: KindOfFruit
    private(set) var stock: Int
    
    init(name: KindOfFruit, count: Int) {
        self.name = name
        self.stock = count
    }
    
    mutating func add(count :Int) {
        self.stock += count
    }
    
    mutating func subtract(count: Int) {
        self.stock -= count
    }
}

private struct FruitManager {
    private var fruits = [KindOfFruit: Fruit]()
    
    mutating func appendFruit(name: KindOfFruit, stock amount: Int) {
        fruits[name] = Fruit(name: name, count: amount)
    }
    
    mutating func supplyFruit(name: KindOfFruit, amount: Int) {
        if var fruit = fruits[name] {
            fruit.add(count: amount)
        } else {
            return
        }
    }
    
    mutating func consumeFruit(name: KindOfFruit, amount: Int) {
        if var fruit = fruits[name] {
            fruit.subtract(count: amount)
        } else {
            return
        }
    }
    
    func isEnough(name: KindOfFruit, amount: Int) -> Bool {
        if let fruit = fruits[name] {
            if fruit.stock >= amount {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func stockOfFruit(name: KindOfFruit) -> Int {
        if let fruit = fruits[name] {
            return fruit.stock
        } else {
            return 0
        }
    }
}

class JuiceMaker {
    private var fruitManager = FruitManager()
    
    init(stock: Int = 10) {
        fruitManager.appendFruit(name: .strawberry, stock: stock)
        fruitManager.appendFruit(name: .banana, stock: stock)
        fruitManager.appendFruit(name: .kiwi, stock: stock)
        fruitManager.appendFruit(name: .pineapple, stock: stock)
        fruitManager.appendFruit(name: .mango, stock: stock)
    }
    
    func makeJuice(memu: KindOfMenu) -> makeJuiceResult {
        switch memu {
        case .strawberry:
            return makeStrawberryJuice()
        case .banana:
            return makeBananaJuice()
        case .kiwi:
            return makeKiwiJuice()
        case .pineapple:
            return makePineappleJuice()
        case .mango:
            return makeMangoJuice()
        case .strawberryAndBanana:
            return makeStrawberryAndBananaJuice()
        case .mangoAndKiwi:
            return makeMangoAndKiwiJuice()
        }
    }
    
    private func makeStrawberryJuice() -> makeJuiceResult {
        let strawberryConsumtion = 16
        if fruitManager.isEnough(name: .strawberry, amount: strawberryConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: strawberryConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeBananaJuice() -> makeJuiceResult {
        let bananaConsumtion = 2
        if fruitManager.isEnough(name: .banana, amount: bananaConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: bananaConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeKiwiJuice() -> makeJuiceResult {
        let kiwiConsumtion = 3
        if fruitManager.isEnough(name: .strawberry, amount: kiwiConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: kiwiConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makePineappleJuice() -> makeJuiceResult {
        let pineappleConsumtion = 2
        if fruitManager.isEnough(name: .strawberry, amount: pineappleConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: pineappleConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeMangoJuice() -> makeJuiceResult {
        let mangoConsumtion = 3
        if fruitManager.isEnough(name: .strawberry, amount: mangoConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: mangoConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeStrawberryAndBananaJuice() -> makeJuiceResult {
        let strawberryConsumtion = 10
        let bananaConsumtion = 1
        if fruitManager.isEnough(name: .strawberry, amount: strawberryConsumtion) && fruitManager.isEnough(name: .banana, amount: bananaConsumtion){
            fruitManager.consumeFruit(name: .strawberry, amount: strawberryConsumtion)
            fruitManager.consumeFruit(name: .banana, amount: bananaConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeMangoAndKiwiJuice() -> makeJuiceResult {
        let mangoConsumtion = 2
        let kiwiConsumtion = 1
        if fruitManager.isEnough(name: .mango, amount: mangoConsumtion) && fruitManager.isEnough(name: .kiwi, amount: kiwiConsumtion){
            fruitManager.consumeFruit(name: .mango, amount: mangoConsumtion)
            fruitManager.consumeFruit(name: .kiwi, amount: kiwiConsumtion)
            return .success
        } else {
            return .fail
        }
    }
}
