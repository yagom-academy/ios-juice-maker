import Foundation

class Fruit {
    enum Name {
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
        let strawberry = 16
        return makeOneIngredientJuice(name: .strawberry, amount: strawberry)
    }
    
    private func makeBananaJuice() -> MakeJuiceResult {
        let banana = 2
        return makeOneIngredientJuice(name: .banana, amount: banana)
    }
    
    private func makeKiwiJuice() -> MakeJuiceResult {
        let kiwi = 3
        return makeOneIngredientJuice(name: .kiwi, amount: kiwi)
    }
    
    private func makePineappleJuice() -> MakeJuiceResult {
        let pineapple = 2
        return makeOneIngredientJuice(name: .pineapple, amount: pineapple)
    }
    
    private func makeMangoJuice() -> MakeJuiceResult {
        let mango = 3
        return makeOneIngredientJuice(name: .mango, amount: mango)
    }
    
    private func makeStrawberryAndBananaJuice() -> MakeJuiceResult {
        let strawberry = 10
        let banana = 1
        return makeTwoIngredientJuice(firstName: .strawberry, firstAmount: strawberry, secondName: .banana, secondAmount: banana)
    }
    
    private func makeMangoAndKiwiJuice() -> MakeJuiceResult {
        let mango = 2
        let kiwi = 1
        return makeTwoIngredientJuice(firstName: .mango, firstAmount: mango, secondName: .kiwi, secondAmount: kiwi)
    }
    
    private func makeOneIngredientJuice(name: Fruit.Name, amount: Int) -> MakeJuiceResult {
        if fruitManager.isEnough(name: name, amount: amount) {
            fruitManager.consumeFruit(name: name, amount: amount)
            return .success
        } else {
            return .fail
        }
    }
    
    private func makeTwoIngredientJuice(firstName: Fruit.Name, firstAmount: Int, secondName: Fruit.Name, secondAmount: Int) -> MakeJuiceResult {
        if fruitManager.isEnough(name: firstName, amount: firstAmount) && fruitManager.isEnough(name: secondName, amount: secondAmount) {
            fruitManager.consumeFruit(name: firstName, amount: firstAmount)
            fruitManager.consumeFruit(name: secondName, amount: secondAmount)
            return .success
        } else {
            return .fail
        }
    }
    
    func getStock(name: Fruit.Name) -> Int {
        fruitManager.stockOfFruit(name: name)
    }
}
