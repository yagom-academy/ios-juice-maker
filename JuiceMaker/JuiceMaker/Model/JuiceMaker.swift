//
//  JuiceMaker - JuiceMaker.swift
//  Created by Wonbi, woong
//

struct JuiceMaker {
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
        
        var name: String {
            switch self {
            case .strawberryJuice:
                return "딸기 주스"
            case .bananaJuice:
                return "바나나 주스"
            case .kiwiJuice:
                return "키위 주스"
            case .pineappleJuice:
                return "파인애플 주스"
            case .mangoJuice:
                return "망고 주스"
            case .strawberryBananaJuice:
                return "딸바 주스"
            case .mangoKiwiJuice:
                return "망키 주스"
            }
        }
        
        var recipe: [Fruit: Int] {
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
    
    let stockManager = FruitStore.stockManager
    
    func bringFruit(number: Int, of fruit: Fruit) -> Int {
        let broughtNumberOfFruits = stockManager.handOver(of: fruit, quantity: number)
        return broughtNumberOfFruits
    }
    
    func makeJuice(_ juice: Juice) {
        for (fruit, numberOfFruits) in juice.recipe {
            let broughtNumberOfFruits = bringFruit(number: numberOfFruits, of: fruit)
            if broughtNumberOfFruits == 0 { return }
        }
        print("\(juice.name) 완성")
    }
}
