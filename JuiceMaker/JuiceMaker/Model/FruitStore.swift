import Foundation

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
    
    private(set) var inventory: [Fruit] = []
 
    func initializeInventory() {
        for fruit in FruitName.allCases {
            inventory.append(Fruit(name: fruit))
        }
    }
    
    private func findIndexFromInventory(with fruit: FruitName) throws -> Int {
        guard let indexOfFruit = inventory.firstIndex(where: { $0.name == fruit }) else {
            throw FruitStoreError.invalidFruitChoice
        }
        return indexOfFruit
    }
    
    func addStock(count: Int, to fruit: FruitName) throws {
//        do {
            let indexOfFruit = try findIndexFromInventory(with: fruit)
            inventory[indexOfFruit].count += count
//        } catch FruitStoreError.invalidFruitChoice {
//            print(FruitStoreError.invalidFruitChoice.description)
//        } catch {
//            print(error)
//        }
    }
    
    private func checkEnoughStock(from index: Int, for count: Int) throws {
        guard inventory[index].count >= count else {
            throw FruitStoreError.lackOfStock(neededStock: count - inventory[index].count)
        }
    }
    
    func subtractStock(count: Int, from fruit: FruitName) throws {
//        do {
            let indexOfFruit = try findIndexFromInventory(with: fruit)
            try checkEnoughStock(from: indexOfFruit, for: count)
            inventory[indexOfFruit].count -= count
//        } catch FruitStoreError.invalidFruitChoice {
//            print(FruitStoreError.invalidFruitChoice.description)
//        } catch FruitStoreError.lackOfStock(let count) {
//            print(FruitStoreError.lackOfStock(neededStock: count).description)
//        } catch {
//            print(error)
//        }
    }
    
    init() {
        initializeInventory()
    }
}
