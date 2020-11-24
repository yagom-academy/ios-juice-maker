import Foundation

fileprivate class Fruit {
    fileprivate enum Name {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    private let name: Name
    private(set) var stock: Int
    
    init(name: Name, count: Int) {
        self.name = name
        self.stock = count
    }
    
    func add(count :Int) {
        self.stock += count
    }
    
    func subtract(count: Int) {
        self.stock -= count
    }
}

fileprivate struct FruitManager {
    private var fruits = [Fruit.Name: Fruit]()
    
    mutating func appendFruit(name: Fruit.Name, stock amount: Int) {
        fruits[name] = Fruit(name: name, count: amount)
    }
    
    mutating func supplyFruit(name: Fruit.Name, amount: Int) {
        guard let fruit = fruits[name] else {
            return
        }
        
        fruit.add(count: amount)
    }
    
    mutating func consumeFruit(name: Fruit.Name, amount: Int) {
        guard let fruit = fruits[name] else {
            return
        }
        
        fruit.subtract(count: amount)
    }
    
    func isEnough(name: Fruit.Name, amount: Int) -> Bool {
        guard let fruit = fruits[name] else {
            return false
        }
        
        if fruit.stock >= amount {
            return true
        }
        
        return false
    }
    
    func stockOfFruit(name: Fruit.Name) -> Int {
        guard let fruit = fruits[name] else {
            let none = 0
            return none
        }
        
        return fruit.stock
    }
}

class JuiceMaker {
    enum JuiceMenu {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
        case strawberryAndBanana
        case mangoAndKiwi
    }
    
    enum MakeJuiceResult {
        case success
        case fail
    }
    
    private var fruitManager = FruitManager()
    
    init(stock: Int = 10) {
        fruitManager.appendFruit(name: .strawberry, stock: stock)
        fruitManager.appendFruit(name: .banana, stock: stock)
        fruitManager.appendFruit(name: .kiwi, stock: stock)
        fruitManager.appendFruit(name: .pineapple, stock: stock)
        fruitManager.appendFruit(name: .mango, stock: stock)
    }
    
    func makeJuice(memu: JuiceMenu) -> MakeJuiceResult {
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
    
    private func makeStrawberryJuice() -> MakeJuiceResult {
        let strawberryConsumtion = 16
        if fruitManager.isEnough(name: .strawberry, amount: strawberryConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: strawberryConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeBananaJuice() -> MakeJuiceResult {
        let bananaConsumtion = 2
        if fruitManager.isEnough(name: .banana, amount: bananaConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: bananaConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeKiwiJuice() -> MakeJuiceResult {
        let kiwiConsumtion = 3
        if fruitManager.isEnough(name: .strawberry, amount: kiwiConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: kiwiConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makePineappleJuice() -> MakeJuiceResult {
        let pineappleConsumtion = 2
        if fruitManager.isEnough(name: .strawberry, amount: pineappleConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: pineappleConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeMangoJuice() -> MakeJuiceResult {
        let mangoConsumtion = 3
        if fruitManager.isEnough(name: .strawberry, amount: mangoConsumtion) {
            fruitManager.consumeFruit(name: .strawberry, amount: mangoConsumtion)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeStrawberryAndBananaJuice() -> MakeJuiceResult {
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
    
    private func makeMangoAndKiwiJuice() -> MakeJuiceResult {
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
