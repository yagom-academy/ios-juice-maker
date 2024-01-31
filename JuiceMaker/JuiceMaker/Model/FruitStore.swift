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
    var fruits: [FruitCategory: Int]
    
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
                print("\(fruitName.koreanName)(이)가 부족합니다.")
                throw FruitStoreError.outOfStock
            }
            print("\(fruitName.koreanName)(이)가 충분합니다.")
        }
    }
    
    func consumeStock(recipe: [JuiceMenu]) throws {
        for fruitForRecipe in recipe {
            try consumeFruitStock(fruitForRecipe: fruitForRecipe)
        }
    }
    
    func consumeFruitStock(fruitForRecipe: JuiceMenu) throws {
        switch fruitForRecipe {
        case .recipe(let fruitName, let number):
            guard var fruitNumber = fruits[fruitName] else {
                throw FruitStoreError.invalidFruitName
            }
            fruitNumber -= number
            fruits[fruitName] = fruitNumber
        }
    }
    
    func showFruitStock() -> [FruitCategory: Int] {
        return self.fruits
    }
}
