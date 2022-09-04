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
    
    fileprivate var ingredient: [Fruit] {
        switch self {
        case .strawberryJuice:
            return [.strawberry]
        case .bananaJuice:
            return [.banana]
        case .kiwiJuice:
            return [.kiwi]
        case .pineappleJuice:
            return [.pineapple]
        case .mangoJuice:
            return [.mango]
        case .strawberryBananaJuice:
            return [.strawberry, .banana]
        case .mangoKiwiJuice:
            return [.mango, .kiwi]
        }
    }
    
    fileprivate var ingredientCount: [Int] {
        switch self {
        case .strawberryJuice:
            return [16]
        case .bananaJuice:
            return [2]
        case .kiwiJuice:
            return [3]
        case .pineappleJuice:
            return [2]
        case .mangoJuice:
            return [3]
        case .strawberryBananaJuice:
            return [10, 1]
        case .mangoKiwiJuice:
            return [2, 1]
        }
    }
}

struct JuiceMaker {
    private var store: FruitStore
    
    init(store: FruitStore) {
        self.store = store
    }
    
    func makeJuice(_ juice: Juice) {
        guard store.canSupplyRequest(fruits: juice.ingredient,
                                     counts: juice.ingredientCount)
        else {
            return
        }
        print("\(juice.name) 완성")
    }
}
