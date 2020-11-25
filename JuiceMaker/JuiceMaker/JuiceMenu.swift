//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

enum JuiceMenu: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case ddalbaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망고키위쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    
    func recipe() -> [String : Int] {
        
        var requiredFruits = [String : Int]()
        
        switch(self) {
        case .strawberryJuice:
            requiredFruits["strawberry"] = 16
        case .bananaJuice:
            requiredFruits["banana"] = 2
        case .ddalbaJuice:
            requiredFruits["strawberry"] = 10
            requiredFruits["banana"] = 1
        case .mangoJuice:
            requiredFruits["mango"] = 3
        case .mangoKiwiJuice:
            requiredFruits["mango"] = 2
            requiredFruits["kiwi"] = 1
        case .kiwiJuice:
            requiredFruits["kiwi"] = 3
        case .pineappleJuice:
            requiredFruits["pineapple"] = 2
        }
        return requiredFruits
    }
}

