//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum AlertMessage: String {
    case outOfStock = "재고가 부족합니다. 재고를 수정할까요?"
    case wrongRequest = "잘못된 요청입니다. 재고 수량은 0미만으로 지정할 수 없습니다."
    case successMade = " 나왔습니다. 맛있게 드세요."
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

class StockManager {
    var messenger = Messenger()
    var recipe = Recipe()
    
    private(set) var strawberry: UInt
    private(set) var banana: UInt
    private(set) var pineapple: UInt
    private(set) var kiwi: UInt
    private(set) var mango: UInt
    
    //MARK: - initialStock
    init() {
        let initialStock: UInt = 10
        strawberry = initialStock
        banana = initialStock
        pineapple = initialStock
        kiwi = initialStock
        mango = initialStock
    }
    
    //MARK: - giveIngredients
    func useStrawberryJuiceIngredients() {
        strawberry -= recipe.strawberryJuice🍓
    }
    
    func useStrawberryBananaJuiceIngredients() {
        strawberry -= recipe.strawberryBananaJuice🍓
        banana -= recipe.strawberryBananaJuice🍌
    }
    
    func useeBananaJuiceIngredients() {
        banana -= recipe.bananaJuice🍌
    }
    
    func useKiwiJuiceIngredients() {
        kiwi -= recipe.kiwiJuice🥝
    }
    
    func usePineappleJuiceIngredients() {
        pineapple -= recipe.pineappleJuice🍍
    }
    
    func useMangoJuiceIngredients() {
        mango -= recipe.mangoJuice🥭
    }
    
    func useMangoKiwiJuiceIngredients() {
        mango -= recipe.mangoKiwiJuice🥭
        kiwi -= recipe.mangoKiwiJuice🥝
    }
    
    // MARK: - addStock
    func addStrawberryStock() {
        strawberry += 1
    }
    
    func addBananaStock() {
        banana += 1
    }
    
    func addPineappleStock() {
        pineapple += 1
    }
    
    func addMangoStock() {
        mango += 1
    }
    
    func addKiwiStock() {
        kiwi += 1
    }
    
    // MARK: - substractStock
    func substractStrawberryStock() {
        guard strawberry > 0 else {
            messenger.printWrongRequest()
            return
        }
        strawberry -= 1
    }
    
    func substractBananaStock() {
        guard banana > 0 else {
            messenger.printWrongRequest()
            return
        }
        banana -= 1
    }
    
    func substractPineappleStock() {
        guard pineapple > 0 else {
            messenger.printWrongRequest()
            return
        }
        pineapple -= 1
    }
    
    func substractMangoStock() {
        guard mango > 0 else {
            messenger.printWrongRequest()
            return
        }
        mango -= 1
    }
    
    func substractKiwiStock() {
        guard kiwi > 0 else {
            messenger.printWrongRequest()
            return
        }
        kiwi -= 1
    }
    
    // MARK: - showAllStock
    func showFruitStock() {
        print("딸기:\(strawberry) 바나나:\(banana) 파인애플:\(pineapple) 망고:\(mango) 키위:\(kiwi)")
    }
}

class JuiceMaker {
    var stockManager = StockManager()
    var messenger = Messenger()
    
    func makeStrawberryJuice() {
        guard stockManager.strawberry >= 16 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useStrawberryJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.strawberryJuice.rawValue)
    }
    
    func makeStrawberryBananaJuice() {
        guard stockManager.strawberry >= 10 && stockManager.banana >= 1 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useStrawberryBananaJuiceIngredients()
        messenger.printSuccessMade(juice: "딸기바나나 쥬스")
        
    }
    
    func makeBananaJuice() {
        guard stockManager.banana >= 2 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useeBananaJuiceIngredients()
        messenger.printSuccessMade(juice: "바나나 쥬스")
    }
    
    func makeKiwiJuice() {
        guard stockManager.kiwi >= 3 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useKiwiJuiceIngredients()
        messenger.printSuccessMade(juice: "키위 쥬스")
    }
    
    func makePineappleJuice() {
        guard stockManager.pineapple >= 2 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.usePineappleJuiceIngredients()
        messenger.printSuccessMade(juice: "파인애플 쥬스")
    }
    
    func makeMangoJuice() {
        guard stockManager.mango >= 3 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useMangoJuiceIngredients()
        messenger.printSuccessMade(juice: "망고 쥬스")
    }
    
    func makeMangoKiwiJuice() {
        guard stockManager.mango >= 2 && stockManager.kiwi >= 1 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useMangoKiwiJuiceIngredients()
        messenger.printSuccessMade(juice: "망고키위 쥬스")
    }
    
}

class Messenger {
    func printOutOfStock() {
        print(AlertMessage.outOfStock.rawValue)
    }
    
    func printWrongRequest() {
        print(AlertMessage.wrongRequest.rawValue)
    }
    
    func printSuccessMade(juice: String) {
        print("\(juice)" + AlertMessage.successMade.rawValue)
    }
}

class Recipe {
    let strawberryJuice🍓:UInt = 16
    let strawberryBananaJuice🍓:UInt = 10
    let strawberryBananaJuice🍌:UInt = 1
    let bananaJuice🍌:UInt = 2
    let kiwiJuice🥝:UInt = 3
    let pineappleJuice🍍:UInt = 2
    let mangoJuice🥭:UInt = 3
    let mangoKiwiJuice🥝:UInt = 1
    let mangoKiwiJuice🥭:UInt = 2
}
