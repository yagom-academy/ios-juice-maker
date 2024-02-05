enum FruitStoreError: Error {
    case outOfStock
    case invalidFruitName
}

enum FruitCategory: Int, CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    var koreanName: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .mango:
            return "망고"
        }
    }
}

class FruitStore {
    private var fruits: [FruitCategory: Int]
    
    init(fruits: [FruitCategory : Int]) {
        self.fruits = fruits
    }
    
    func isAvailable(menu: [JuiceMenu]) throws {
        for ingredients in menu {
            try isAvailable(fruit: ingredients)
        }
    }
    
    func isAvailable(fruit: JuiceMenu) throws {
        switch fruit {
        case .recipe(let fruitName, let number):
            if fruits[fruitName] == nil {
                throw FruitStoreError.invalidFruitName
            } else if fruits[fruitName] ?? 0 < number {
                throw FruitStoreError.outOfStock
            }
        }
    }
    
    func consumeStock(recipe: [JuiceMenu]) throws {
        for fruitForRecipe in recipe {
            try consumeFruitStock(fruitForRecipe: fruitForRecipe)
        }
    }
    
    func consumeFruitStock(fruitForRecipe: JuiceMenu) throws {
        switch fruitForRecipe {
        case .recipe(let fruitName, let fruitCountToUse):
            guard var fruitCount = fruits[fruitName] else {
                throw FruitStoreError.invalidFruitName
            }
            fruits[fruitName] = fruitCount - fruitCountToUse
        }
    }
    
    func showFruitStock() -> [FruitCategory: Int] {
        return self.fruits
    }
}
