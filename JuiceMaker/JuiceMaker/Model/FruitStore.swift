
final class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    private var defaultStock = 10
    var fruitStorage : Dictionary<Fruit, Int>
    private let allFruits : Array<Fruit>
    private let stock : Array<Int>
    
    init() {
        allFruits = Fruit.allCases
        stock = Array(repeating: defaultStock, count: allFruits.count)
        fruitStorage = Dictionary(uniqueKeysWithValues: zip(allFruits, stock))
    }
    
    func hasEnoughFruit(which fruit: Fruit, on amount: Int) -> Bool {
        guard let inventory = fruitStorage[fruit], inventory >= amount else {
            return false
        }
        
        return true
    }
    
    func useFruit(fruit: Fruit, amount: Int) {
        if var inventory = fruitStorage[fruit] {
            inventory -= amount
            fruitStorage[fruit] = inventory
        }
    }
    
    func stockUpFruit(which fruit: Fruit, on amount: Int) throws {
        guard var inventory = fruitStorage[fruit] else {
            throw FruitStockError.invalidValue
        }
        inventory += amount
        fruitStorage[fruit] = inventory
    }
}
