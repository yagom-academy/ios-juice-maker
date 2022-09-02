//
//  JuiceMaker - JuiceMaker.swift
//  Created by Wonbi, woong
//

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
    
    fileprivate var recipe: [Recipe] {
        switch self {
        case .strawberryJuice:
            return [Recipe(name: .strawberry, count: 16)]
        case .bananaJuice:
            return [Recipe(name: .banana, count: 2)]
        case .kiwiJuice:
            return [Recipe(name: .kiwi, count: 3)]
        case .pineappleJuice:
            return [Recipe(name: .pineapple, count: 2)]
        case .mangoJuice:
            return [Recipe(name: .mango, count: 3)]
        case .strawberryBananaJuice:
            return [Recipe(name: .strawberry, count: 10), Recipe(name: .banana, count: 1)]
        case .mangoKiwiJuice:
            return [Recipe(name: .mango, count: 2), Recipe(name: .kiwi, count: 1)]
        }
    }
}

struct JuiceMaker {
    private var store: FruitStore
    
    init(store: FruitStore) {
        self.store = store
    }
    
    func makeJuice(_ juice: Juice) {
        guard store.canSupplyRequest(juice.recipe) else {
            return
        }
        print("\(juice.name) 완성")
    }
}
