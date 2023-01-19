//
//  JuiceMaker - JuiceMaker.swift
//  Created by Andrew, 혜모리 on 2023.01.02
//

struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    enum Juice: String {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case pineappleJuice = "파인애플 쥬스"
        case kiwiJuice = "키위쥬스"
        case strawberryBananaJuice = "딸바쥬스"
        case mangoJuice = "망고쥬스"
        case mangoKiwiJuice = "망고키위 쥬스"
        
        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .mangoJuice:
                return [.mango: 3]
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    private func checkFruitStore(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            let currentStock = try fruitStore.checkStock(fruit: fruit, amount: amount)

            guard currentStock >= amount else {
                throw JuiceMakerError.insufficientStock
            }
        }
    }
    
    private func useFruit(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitStore.substractFruit(fruit: fruit, amount: amount)
        }
    }
    
    func makeJuice(_ juice: Juice) -> Result<Juice, Error> {
        do {
            try checkFruitStore(for: juice)
            try useFruit(for: juice)
            return .success(juice)
        } catch let error {
            return .failure(error)
        }
    }
}
