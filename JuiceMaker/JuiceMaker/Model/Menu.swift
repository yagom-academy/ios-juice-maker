//
//  Menu.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/04/27.
//

enum Menu: Int {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryAndBananaJuice
    case mangoAndKiwiJuice
    
    private var recipe: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryAndBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoAndKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    func needsForFruits() -> [Fruit: Int] {
        var countList = [Fruit: Int]()
        
        for (fruit, need) in self.recipe {
            countList.updateValue(need, forKey: fruit)
        }
        return countList
    }
}

extension Menu {
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .mangoAndKiwiJuice:
            return "망키쥬스"
        case .strawberryAndBananaJuice:
            return "딸바쥬스"
        }
    }
}
