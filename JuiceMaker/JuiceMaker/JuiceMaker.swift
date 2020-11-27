//
//  JuiceMaker - JuiceMaker.swift
//  Created by taetae.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum AlertMessage: String {
    case outOfStock = "재고가 부족합니다. 재고를 수정할까요?"
    case wrongRequest = "잘못된 요청입니다. 재고 수량은 0미만으로 지정할 수 없습니다."
    case successMade = " 나왔습니다. 맛있게 드세요."
    case machineBreakdown = "관리자에게 문의하세요."
}

enum AlertCase: Error {
    case outOfStock
    case wrongRequest
    case successMade
}

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
    
    func makeStrawberryJuice() throws {
        guard stockManager.isEnoughToMakeJuice(juice: .strawberryJuice) else {
            messenger.printOutOfStock()
            throw AlertCase.outOfStock
        }
        stockManager.useStrawberryJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.strawberryJuice.rawValue)
    }
    
    func makeStrawberryBananaJuice() throws {
        guard stockManager.isEnoughToMakeJuice(juice: .strawberryBananaJuice) else {
            messenger.printOutOfStock()
            throw AlertCase.outOfStock
        }
        stockManager.useStrawberryBananaJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.strawberryBananaJuice.rawValue)
    }
    
    func makeBananaJuice() throws {
        guard stockManager.isEnoughToMakeJuice(juice: .bananaJuice) else {
            messenger.printOutOfStock()
            throw AlertCase.outOfStock
        }
        stockManager.useeBananaJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.bananaJuice.rawValue)
    }
    
    func makeKiwiJuice() throws {
        guard stockManager.isEnoughToMakeJuice(juice: .kiwiJuice) else {
            messenger.printOutOfStock()
            throw AlertCase.outOfStock
        }
        stockManager.useKiwiJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.kiwiJuice.rawValue)
    }
    
    func makePineappleJuice() throws {
        guard stockManager.isEnoughToMakeJuice(juice: .pineappleJuice) else {
            messenger.printOutOfStock()
            throw AlertCase.outOfStock
        }
        stockManager.usePineappleJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.pineappleJuice.rawValue)
    }
    
    func makeMangoJuice() throws {
        guard stockManager.isEnoughToMakeJuice(juice: .mangoJuice) else {
            messenger.printOutOfStock()
            throw AlertCase.outOfStock
        }
        stockManager.useMangoJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.mangoJuice.rawValue)
    }
    
    func makeMangoKiwiJuice() throws {
        guard stockManager.isEnoughToMakeJuice(juice: .mangoKiwiJuice) else {
            messenger.printOutOfStock()
            throw AlertCase.outOfStock
        }
        stockManager.useMangoKiwiJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.mangoKiwiJuice.rawValue)
    }
    
}
