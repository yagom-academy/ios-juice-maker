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
    
    var indexOfInventory: Int {
        switch self {
        case .strawberry: return 0
        case .banana: return 1
        case .pineapple: return 2
        case .kiwi: return 3
        case .mango: return 4
        }
    }
    
    var kor: String {
        switch self {
        case .strawberry: return "딸기"
        case .banana: return "바나나"
        case .pineapple: return "파인애플"
        case .kiwi: return "키위"
        case .mango: return "망고"
        }
    }
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
    
    func addStock(count: Int, to fruit: FruitName) {
        inventory[fruit.indexOfInventory].count += count
        NotificationCenter.default.post(name: .didChangeStock, object: nil, userInfo: ["changedFruit": fruit])
    }
    
    func checkEnoughStock(of fruit: FruitName, for count: Int) throws {
        guard inventory[fruit.indexOfInventory].count >= count else {
            throw FruitStoreError.lackOfStock(fruitName: fruit.kor, neededStock: count - inventory[fruit.indexOfInventory].count)
        }
    }
    
    func subtractStock(count: Int, from fruit: FruitName) {
        inventory[fruit.indexOfInventory].count -= count
        NotificationCenter.default.post(name: .didChangeStock, object: nil, userInfo: ["changedFruit": fruit])
    }
}
