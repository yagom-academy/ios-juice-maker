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
    let messenger = Messenger()
    let recipe = Recipe()
    
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
    func IsEnough(juice: Menu) -> Bool {
        
        switch juice {
        case .strawberryJuice:
            guard strawberry >= recipe.strawberryOfStrawberryJuice else {
                return false
            }
        case .bananaJuice:
            guard banana >= recipe.bananaOfBananaJuice else {
                return false
            }
        case .strawberryBananaJuice:
            guard strawberry >= recipe.strawberryOfStrawberryBananaJuice &&
                    banana >= recipe.bananaOfStrawberryBananaJuice else {
                return false
            }
        case .pineappleJuice:
            guard pineapple >= recipe.pineappleOfPineappleJuice else {
                return false
            }
        case .kiwiJuice:
            guard kiwi >= recipe.kiwiOfKiwiJuice else {
                return false
            }
        case .mangoJuice:
            guard mango >= recipe.mangoOfMangoJuice else {
                return false
            }
        case .mangoKiwiJuice:
            guard mango >= recipe.mangoOfMangoKiwiJuice &&
                    kiwi >= recipe.kiwiOfMangoKiwiJuice else {
                return false
            }
        }
        return true
    }
}

class JuiceMaker {
    let stockManager = StockManager()
    let messenger = Messenger()
    
    func makeStrawberryJuice() {
        guard stockManager.IsEnough(juice: .strawberryJuice) else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useStrawberryJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.strawberryJuice.rawValue)
    }
    
    func makeStrawberryBananaJuice() {
        guard stockManager.IsEnough(juice: .strawberryBananaJuice) else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useStrawberryBananaJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.strawberryBananaJuice.rawValue)
    }
    
    func makeBananaJuice() {
        guard stockManager.IsEnough(juice: .bananaJuice) else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useeBananaJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.bananaJuice.rawValue)
    }
    
    func makeKiwiJuice() {
        guard stockManager.IsEnough(juice: .kiwiJuice) else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useKiwiJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.kiwiJuice.rawValue)
    }
    
    func makePineappleJuice() {
        guard stockManager.IsEnough(juice: .pineappleJuice) else {
            messenger.printOutOfStock()
            return
        }
        stockManager.usePineappleJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.pineappleJuice.rawValue)
    }
    
    func makeMangoJuice() {
        guard stockManager.IsEnough(juice: .mangoJuice) else {
            messenger.printOutOfStock()
            return
        }
        stockManager.useMangoJuiceIngredients()
        messenger.printSuccessMade(juice: Menu.mangoJuice.rawValue)
    }
    
    func makeMangoKiwiJuice() {
        guard stockManager.IsEnough(juice: .mangoKiwiJuice) else {
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
