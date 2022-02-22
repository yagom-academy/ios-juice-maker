import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
        
        func recipe() -> [[Fruit:Int]] {
            switch self {
            case .strawberryJuice:
                return [[Fruit.strawberry : 16]]
            case .bananaJuice:
                return [[Fruit.banana : 2]]
            case .kiwiJuice:
                return [[Fruit.kiwi : 3]]
            case .pineappleJuice:
                return [[Fruit.pineapple : 2]]
            case .strawberryBananaJuice:
                return [[Fruit.strawberry : 10], [Fruit.banana : 1]]
            case .mangoJuice:
                return [[Fruit.mango : 3]]
            case .mangoKiwiJuice:
                return [[Fruit.mango : 2], [Fruit.kiwi : 1]]
            }
        }
    }
    
    // 재고가 충분한지 확인하는 함수
//    func aaa(juice: Juice) -> Bool {
//        let recipe: [(Fruit, Int)] = Juice.recipe(Juice.strawberryBananaJuice)()  // [(딸기, 10), (바나나, 1)]
//        for ingredient in recipe {
//            guard let currentStock = fruitStore.fruits[ingredient.0] else { return false }
//            if currentStock < ingredient.1 {
//                return false
//            }
//        }
//        return true
//    }
    
    // 재고가 충분한지 확인하는 함수
    func hasEnoughFruitStock(juice: Juice) -> Bool {
        let recipe: [[Fruit : Int]] = Juice.recipe(Juice.strawberryBananaJuice)()  // [[딸기, 10], [바나나, 1]]
        for index in 0..<recipe.count {
            let ingredient = recipe[index]
            guard let fruit = ingredient.keys.first else { return false }
            guard let amount = ingredient[fruit] else { return false }
            guard let currentStock = fruitStore.fruits[fruit] else { return false }
            if currentStock < amount {
                return false
            }
        }
        return true
    }
    
    // 주스를 만드는 함수
    func makeJuice(juice: Juice) {
        if !hasEnoughFruitStock(juice: juice) {
            return
        }
        let recipe: [[Fruit : Int]] = Juice.recipe(Juice.strawberryBananaJuice)()
        for index in 0..<recipe.count {
            let ingredient = recipe[index]
            guard let fruit = ingredient.keys.first else { return }
            guard let amount = ingredient[fruit] else { return }
            
            fruitStore.decreaseStock(fruit: fruit, amount: amount)
        }
        
    }
    
}
