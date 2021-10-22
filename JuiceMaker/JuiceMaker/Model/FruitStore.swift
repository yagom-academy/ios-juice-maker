import Foundation

enum FruitName {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

struct Fruit {
    var name: FruitName
    var count: Int = 10
}

class FruitStore {
    
    private enum FruitStoreError: LocalizedError {
        case inValidFruitChoice
        case lackOfStock(stockNeeded: Int)
        
        var description: String {
            switch self {
            case .inValidFruitChoice:
                return "유효하지 않은 선택입니다."
            case .lackOfStock(let stockNeeded):
                return "재료가 \(stockNeeded)개 부족합니다. 재고를 확인해주세요."
            }
        }
    }
    
    private(set) var inventory: [Fruit] = [
        Fruit(name: .strawberry),
        Fruit(name: .banana),
        Fruit(name: .pineapple),
        Fruit(name: .kiwi),
        Fruit(name: .mango)
    ]
    
    private func findIndexFromInventory(with fruit: FruitName) throws -> Int {
        guard let indexOfFruit = inventory.firstIndex(where: { $0.name == fruit }) else {
            throw FruitStoreError.inValidFruitChoice
        }
        return indexOfFruit
    }
    
    func addStock(count: Int, to fruit: FruitName) {
        do {
            let indexOfFruit = try findIndexFromInventory(with: fruit)
            inventory[indexOfFruit].count += count
        } catch FruitStoreError.inValidFruitChoice {
            print(FruitStoreError.inValidFruitChoice.description)
        } catch {
            print(error)
        }
    }
    
    private func checkEnoughStock(from index: Int, for count: Int) throws {
        guard inventory[index].count >= count else {
            throw FruitStoreError.lackOfStock(stockNeeded: count - inventory[index].count)
        }
    }
    
    func subtractStock(count: Int, from fruit: FruitName) {
        do {
            let indexOfFruit = try findIndexFromInventory(with: fruit)
            try checkEnoughStock(from: indexOfFruit, for: count)
            inventory[indexOfFruit].count -= count
        } catch FruitStoreError.inValidFruitChoice {
            print(FruitStoreError.inValidFruitChoice.description)
        } catch FruitStoreError.lackOfStock(let count) {
            print(FruitStoreError.lackOfStock(stockNeeded: count).description)
        } catch {
            print(error)
        }
    }
}
