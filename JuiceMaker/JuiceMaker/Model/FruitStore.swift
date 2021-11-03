
final class FruitStore {
    private var defaultStock = 10
    var fruitStorage : Dictionary<Fruits, Int>
    static let shared: FruitStore = FruitStore()
    
    private init() {
        let allFruits = Fruits.allCases
        let stock = Array(repeating: defaultStock, count: allFruits.count)
        fruitStorage = Dictionary(uniqueKeysWithValues: zip(allFruits, stock))
    }
    
    func hasEnoughFruit(which fruit: Fruits, on amount: Int) -> Bool {
        guard let inventory = fruitStorage[fruit], inventory >= amount else {
            return false
        }
        
        return true
    }
    
    func useFruit(fruit: Fruits, amount: Int) {
        if var inventory = fruitStorage[fruit] {
            inventory -= amount
            fruitStorage[fruit] = inventory
        }
    }
    
    func stockUpFruit(which fruit: Fruits, on amount: Int) throws {
        guard var inventory = fruitStorage[fruit] else {
            throw FruitStockError.invalidValue
        }
        inventory += amount
        fruitStorage[fruit] = inventory
    }
}
