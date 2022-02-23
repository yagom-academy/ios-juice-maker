import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    typealias JuiceRecipe = [[FruitStore.Fruit:Int]]
    enum Juice {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
        
        func recipe() -> JuiceRecipe {
            switch self {
            case .strawberryJuice:
                return [[.strawberry : 16]]
            case .bananaJuice:
                return [[.banana : 2]]
            case .kiwiJuice:
                return [[.kiwi : 3]]
            case .pineappleJuice:
                return [[.pineapple : 2]]
            case .strawberryBananaJuice:
                return [[.strawberry : 10], [.banana : 1]]
            case .mangoJuice:
                return [[.mango : 3]]
            case .mangoKiwiJuice:
                return [[.mango : 2], [.kiwi : 1]]
            }
        }
    }
    
    // 주스를 만드는 함수
    func makeJuice(juice: Juice) throws {
        let recipe: JuiceRecipe = Juice.recipe(juice)()
        if !hasEnoughFruitStock(recipe: recipe) {
            throw JuiceError.notEnoughStock
        }
        consumeFruitStock(recipe: recipe)
    }
    
    // 재고가 충분한지 확인하는 함수
    func hasEnoughFruitStock(recipe: JuiceRecipe) -> Bool {
        for ingredient in recipe {
            guard let fruit = ingredient.keys.first else { return false }
            guard let amount = ingredient[fruit] else { return false }
            guard let currentStock = fruitStore.fruits[fruit] else { return false }
            if currentStock < amount {
                return false
            }
        }
        return true
    }
    
    func consumeFruitStock(recipe: JuiceRecipe) {
        for ingredient in recipe {
            guard let fruit = ingredient.keys.first else { return }
            guard let amount = ingredient[fruit] else { return }
            fruitStore.decreaseStock(fruit: fruit, amount: amount)
        }
    }
}
