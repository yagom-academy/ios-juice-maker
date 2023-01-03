//
//  JuiceMaker - JuiceMaker.swift
//  Created by Andrew, 혜모리 on 2023.01.02
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
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
    
    func makeJuice(juice: Juice) {
        for (fruit, amount) in juice.recipe {
            do {
                try fruitStore.subtractStock(fruit: fruit, amount: amount)
            } catch JuiceMakerError.insufficientStock {
                print("재고 부족")
            } catch {
                print(error)
            }
        }
    }
}
