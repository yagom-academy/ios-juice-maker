import Foundation

extension Notification.Name {
    static let didChangeStock = Notification.Name("Stock Changed")
}

enum FruitName: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

struct Fruit {
    let name: FruitName
    var count: Int = 10
}

class FruitStore {
    
    static let shared: FruitStore = FruitStore()
    
    private(set) var inventory: [Fruit] = []
    
    private func initializeInventory() {
        for fruit in FruitName.allCases {
            inventory.append(Fruit(name: fruit))
        }
    }
    
    private init() {
        initializeInventory()
    }
    
    private func findIndexFromInventory(with fruit: FruitName) throws -> Int {
        guard let indexOfFruit = inventory.firstIndex(where: { $0.name == fruit }) else {
            throw FruitStoreError.invalidFruitChoice
        }
        return indexOfFruit
    }
    
    func addStock(count: Int, to fruit: FruitName) throws {
        let indexOfFruit = try findIndexFromInventory(with: fruit)
        inventory[indexOfFruit].count += count
        NotificationCenter.default.post(name: .didChangeStock, object: nil, userInfo: ["changedFruit": fruit])
    }
    
    private func checkEnoughStock(from index: Int, for count: Int) throws {
        guard inventory[index].count >= count else {
            throw FruitStoreError.lackOfStock(neededStock: count - inventory[index].count)
        }
    }
    
    func subtractStock(count: Int, from fruit: FruitName) throws {
        let indexOfFruit = try findIndexFromInventory(with: fruit)
        try checkEnoughStock(from: indexOfFruit, for: count)
        inventory[indexOfFruit].count -= count
        NotificationCenter.default.post(name: .didChangeStock, object: nil, userInfo: ["changedFruit": fruit])
    }
}
