//
//  JuiceMaker - JuiceMaker.swift
//  Created by Wonbi, woong
//

struct JuiceMaker {
    enum Juice: String {
        case strawberryJuice = "딸기 주스"
        case bananaJuice = "바나나 주스"
        case kiwiJuice = "키위 주스"
        case pineappleJuice = "파인애플 주스"
        case mangoJuice = "망고 주스"
        case strawberryBananaJuice = "딸바 주스"
        case mangoKiwiJuice = "망키 주스"
        
        fileprivate var name: String {
            self.rawValue
        }
        
        fileprivate var recipe: [Fruits] {
            switch self {
            case .strawberryJuice:
                return [Fruits(name: .strawberry, count: 16)]
            case .bananaJuice:
                return [Fruits(name: .banana, count: 2)]
            case .kiwiJuice:
                return [Fruits(name: .kiwi, count: 3)]
            case .pineappleJuice:
                return [Fruits(name: .pineapple, count: 2)]
            case .mangoJuice:
                return [Fruits(name: .mango, count: 3)]
            case .strawberryBananaJuice:
                return [Fruits(name: .strawberry, count: 10), Fruits(name: .banana, count: 1)]
            case .mangoKiwiJuice:
                return [Fruits(name: .mango, count: 2), Fruits(name: .kiwi, count: 1)]
            }
        }
    }
    
    private let stockManager = FruitStore.stockManager
    
    func makeJuice(_ juice: Juice) {
        guard stockManager.canSupplyRequest(juice.recipe) else { return }
        print("\(juice.name) 완성")
    }
}
