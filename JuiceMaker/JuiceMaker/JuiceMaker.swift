//
//  JuiceMaker - JuiceMaker.swift
//  Created by taetae.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu: String {
    case strawberryJuice = "딸기 쥬스"
    case bananaJuice = "바나나 쥬스"
    case strawberryBananaJuice = "딸바 쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case kiwiJuice = "키위 쥬스"
    case mangoJuice = "망고 쥬스"
    case mangoKiwiJuice = "망고키위 쥬스"
}

class JuiceMaker {
    static let common = JuiceMaker()
    private init() {}
    let stockManager = StockManager()
    let messenger = Messenger()
    
    func makeJuice(selectedJuiceName: Menu) throws {
        guard stockManager.isEnoughToMake(selectedJuice: selectedJuiceName) else {
            messenger.printAlertMessage(alertCase: .outOfStock)
            throw AlertCase.outOfStock
        }
        stockManager.useJuiceIngredients(selectedJuiceName: selectedJuiceName)
        messenger.printSuccessMade(orderedJuiceName: selectedJuiceName)
    }
}
