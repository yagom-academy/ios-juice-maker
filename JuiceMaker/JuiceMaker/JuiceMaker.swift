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
    init(initialStock: UInt = 10) {
        strawberry = initialStock
        banana = initialStock
        pineapple = initialStock
        kiwi = initialStock
        mango = initialStock
    }
    
    //MARK: - giveIngredients
    func useStrawberryJuiceIngredients() {
        strawberry -= recipe.strawberryOfStrawberryJuice
    }
    
    func useStrawberryBananaJuiceIngredients() {
        strawberry -= recipe.strawberryOfStrawberryBananaJuice
        banana -= recipe.bananaOfStrawberryBananaJuice
    }
    
    func useeBananaJuiceIngredients() {
        banana -= recipe.bananaOfBananaJuice
    }
    
    func useKiwiJuiceIngredients() {
        kiwi -= recipe.kiwiOfKiwiJuice
    }
    
    func usePineappleJuiceIngredients() {
        pineapple -= recipe.pineappleOfPineappleJuice
    }
    
    func useMangoJuiceIngredients() {
        mango -= recipe.mangoOfMangoJuice
    }
    
    func useMangoKiwiJuiceIngredients() {
        mango -= recipe.mangoOfMangoKiwiJuice
        kiwi -= recipe.kiwiOfMangoKiwiJuice
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
    
    // MARK: - IsEnoughIngredients
    func IsEnough(juice: Menu) {
        
        switch juice {
        case .strawberryJuice:
            guard strawberry >= recipe.strawberryOfStrawberryJuice else {
                messenger.printOutOfStock()
                return
            }
        case .bananaJuice:
            guard banana >= recipe.bananaOfBananaJuice else {
                messenger.printOutOfStock()
                return
            }
        case .strawberryBananaJuice:
            guard strawberry >= recipe.strawberryOfStrawberryBananaJuice &&
                    banana >= recipe.bananaOfStrawberryBananaJuice else {
                messenger.printOutOfStock()
                return
            }
        case .pineappleJuice:
            guard pineapple >= recipe.pineappleOfPineappleJuice else {
                messenger.printOutOfStock()
                return
            }
        case .kiwiJuice:
            guard kiwi >= recipe.kiwiOfKiwiJuice else {
                messenger.printOutOfStock()
                return
            }
        case .mangoJuice:
            guard mango >= recipe.mangoOfMangoJuice else {
                messenger.printOutOfStock()
                return
            }
        case .mangoKiwiJuice:
            guard mango >= recipe.mangoOfMangoKiwiJuice &&
                    kiwi >= recipe.kiwiOfMangoKiwiJuice else {
                messenger.printOutOfStock()
                return
            }
        }
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
        messenger.printSuccessMade(juice: Menu.strawberryBananaJuice.rawValue)
        
    }
    
    func makeBananaJuice() {
        guard stockManager.banana >= 2 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useeBananaJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.bananaJuice.rawValue)
    }
    
    func makeKiwiJuice() {
        guard stockManager.kiwi >= 3 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useKiwiJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.kiwiJuice.rawValue)
    }
    
    func makePineappleJuice() {
        guard stockManager.pineapple >= 2 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.usePineappleJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.pineappleJuice.rawValue)
    }
    
    func makeMangoJuice() {
        guard stockManager.mango >= 3 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useMangoJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.mangoJuice.rawValue)
    }
    
    func makeMangoKiwiJuice() {
        guard stockManager.mango >= 2 && stockManager.kiwi >= 1 else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useMangoKiwiJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.mangoKiwiJuice.rawValue)
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
    let strawberryOfStrawberryJuice:UInt = 16
    let strawberryOfStrawberryBananaJuice:UInt = 10
    let bananaOfStrawberryBananaJuice:UInt = 1
    let bananaOfBananaJuice:UInt = 2
    let kiwiOfKiwiJuice:UInt = 3
    let pineappleOfPineappleJuice:UInt = 2
    let mangoOfMangoJuice:UInt = 3
    let kiwiOfMangoKiwiJuice:UInt = 1
    let mangoOfMangoKiwiJuice:UInt = 2
}
