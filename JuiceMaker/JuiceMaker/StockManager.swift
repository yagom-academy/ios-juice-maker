//
//  Stockmanager.swift
//  JuiceMaker
//
//  Created by 김태형 on 2020/11/27.
//

import Foundation

class StockManager {
    let messenger = Messenger()
    let recipe = Recipe()
    
    private(set) var strawberryInventoryAmount: UInt
    private(set) var bananaInventoryAmount: UInt
    private(set) var pineappleInventoryAmount: UInt
    private(set) var kiwiInventoryAmount: UInt
    private(set) var mangoInventoryAmount: UInt
    
    //MARK: - initialStock
    init(initialStock: UInt = 10) {
        strawberryInventoryAmount = initialStock
        bananaInventoryAmount = initialStock
        pineappleInventoryAmount = initialStock
        kiwiInventoryAmount = initialStock
        mangoInventoryAmount = initialStock
    }
    
    //MARK: - giveIngredients
    func useJuiceIngredients(selectedJuiceName: Menu) {
        switch selectedJuiceName {
        case .strawberryJuice:
            strawberryInventoryAmount -= recipe.strawberryRequiredOfStrawberryJuice
        case .bananaJuice:
            bananaInventoryAmount -= recipe.bananaRequiredOfBananaJuice
        case .strawberryBananaJuice:
            strawberryInventoryAmount -= recipe.strawberryRequiredOfStrawberryBananaJuice
            bananaInventoryAmount -= recipe.bananaRequiredOfStrawberryBananaJuice
        case .pineappleJuice:
            pineappleInventoryAmount -= recipe.pineappleRequiredOfPineappleJuice
        case .mangoJuice:
            mangoInventoryAmount -= recipe.mangoRequiredOfMangoJuice
        case .kiwiJuice:
            kiwiInventoryAmount -= recipe.kiwiRequiredOfKiwiJuice
        case .mangoKiwiJuice:
            mangoInventoryAmount -= recipe.mangoRequiredOfMangoKiwiJuice
            kiwiInventoryAmount -= recipe.kiwiRequiredOfMangoKiwiJuice
        }
    }
    
    // MARK: - addStock
    func addStrawberryStock() {
        strawberryInventoryAmount += 1
    }
    
    func addBananaStock() {
        bananaInventoryAmount += 1
    }
    
    func addPineappleStock() {
        pineappleInventoryAmount += 1
    }
    
    func addMangoStock() {
        mangoInventoryAmount += 1
    }
    
    func addKiwiStock() {
        kiwiInventoryAmount += 1
    }
    
    // MARK: - substractStock
    func substractStrawberryStock() {
        guard strawberryInventoryAmount > 0 else {
            messenger.printAlertMessage(alertCase: .wrongRequest)
            return
        }
        strawberryInventoryAmount -= 1
    }
    
    func substractBananaStock() {
        guard bananaInventoryAmount > 0 else {
            messenger.printAlertMessage(alertCase: .wrongRequest)
            return
        }
        bananaInventoryAmount -= 1
    }
    
    func substractPineappleStock() {
        guard pineappleInventoryAmount > 0 else {
            messenger.printAlertMessage(alertCase: .wrongRequest)
            return
        }
        pineappleInventoryAmount -= 1
    }
    
    func substractMangoStock() {
        guard mangoInventoryAmount > 0 else {
            messenger.printAlertMessage(alertCase: .wrongRequest)
            return
        }
        mangoInventoryAmount -= 1
    }
    
    func substractKiwiStock() {
        guard kiwiInventoryAmount > 0 else {
            messenger.printAlertMessage(alertCase: .wrongRequest)
            return
        }
        kiwiInventoryAmount -= 1
    }
    
    // MARK: - showAllStock
    func showFruitStock() {
        print("딸기:\(strawberryInventoryAmount) 바나나:\(bananaInventoryAmount) 파인애플:\(pineappleInventoryAmount) 망고:\(mangoInventoryAmount) 키위:\(kiwiInventoryAmount)")
    }
    
    // MARK: - IsEnoughIngredients
    func isEnoughToMake(selectedJuice: Menu) -> Bool {
        
        switch selectedJuice {
        case .strawberryJuice:
            guard strawberryInventoryAmount >= recipe.strawberryRequiredOfStrawberryJuice else {
                return false
            }
        case .bananaJuice:
            guard bananaInventoryAmount >= recipe.bananaRequiredOfBananaJuice else {
                return false
            }
        case .strawberryBananaJuice:
            guard strawberryInventoryAmount >= recipe.strawberryRequiredOfStrawberryBananaJuice &&
                    bananaInventoryAmount >= recipe.bananaRequiredOfStrawberryBananaJuice else {
                return false
            }
        case .pineappleJuice:
            guard pineappleInventoryAmount >= recipe.pineappleRequiredOfPineappleJuice else {
                return false
            }
        case .kiwiJuice:
            guard kiwiInventoryAmount >= recipe.kiwiRequiredOfKiwiJuice else {
                return false
            }
        case .mangoJuice:
            guard mangoInventoryAmount >= recipe.mangoRequiredOfMangoJuice else {
                return false
            }
        case .mangoKiwiJuice:
            guard mangoInventoryAmount >= recipe.mangoRequiredOfMangoKiwiJuice &&
                    kiwiInventoryAmount >= recipe.kiwiRequiredOfMangoKiwiJuice else {
                return false
            }
        }
        return true
    }
}
