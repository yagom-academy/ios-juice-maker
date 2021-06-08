//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입

enum JuiceMenu {
    case strawberryJuice
    case kiwiJuice
    case bananaJuice
    case pineappleJuice
    case strawNanaJuice
    case mangoJucie
    case mangoKiwiJucie
}

struct JuiceMaker {
    
    let bananaStore = FruitStore(fruitName: "바나나")
    let strawberryStore = FruitStore(fruitName: "딸기")
    let kiwiStore = FruitStore(fruitName: "키위")
    let mangoSotre = FruitStore(fruitName: "망고")
    let pineappleStore = FruitStore(fruitName: "파인애플")
    
    private func makeBananaJuice() -> Bool {
        if bananaStore.getStatus().count > 2 {
            self.bananaStore.setCount(amount: -2)
            return true
        } else {
            return false
        }
    }
    
    private func makeStrawberryJuice() -> Bool {
        if strawberryStore.getStatus().count > 16 {
            self.strawberryStore.setCount(amount: -16)
            return true
        } else {
            return false
        }
    }
    
    private func makeKiwiJuice() -> Bool {
        if kiwiStore.getStatus().count > 3 {
            self.kiwiStore.setCount(amount: -3)
            return true
        } else {
            return false
        }
    }
    
    private func makePineappleJuice() -> Bool {
        if pineappleStore.getStatus().count > 2 {
            self.pineappleStore.setCount(amount: -2)
            return true
        } else {
            return false
        }
    }
    
    private func makeMangoJuice() -> Bool {
        if mangoSotre.getStatus().count > 3 {
            self.mangoSotre.setCount(amount: -3)
            return true
        } else {
            return false
        }
    }
    
    private func makeStrawNanaJuice() -> Bool {
        let strawberryLeftCount = strawberryStore.getStatus().count
        let bananaLeftCount = bananaStore.getStatus().count
        
        if strawberryLeftCount > 10, bananaLeftCount > 1 {
            strawberryStore.setCount(amount: -10)
            bananaStore.setCount(amount: -1)
            return true
        } else {
            return false
        }
    }
    
    private func makeMangoKiwiJucie() -> Bool {
        let mangoLeftCount = mangoSotre.getStatus().count
        let kiwiLeftCount = kiwiStore.getStatus().count
        
        if mangoLeftCount > 2, kiwiLeftCount > 1 {
            mangoSotre.setCount(amount: -2)
            kiwiStore.setCount(amount: -1)
            return true
        } else {
            return false
        }
    }
    
    public func makeJuice(menu type: JuiceMenu) -> Bool {
        var outcome: Bool
        
        switch type {
        case .strawberryJuice:
            outcome = makeStrawberryJuice()
        case .bananaJuice:
            outcome = makeBananaJuice()
        case .kiwiJuice:
            outcome = makeKiwiJuice()
        case .pineappleJuice:
            outcome = makePineappleJuice()
        case .mangoJucie:
            outcome = makeMangoJuice()
        case .strawNanaJuice:
            outcome = makeStrawNanaJuice()
        case .mangoKiwiJucie:
            outcome = makeMangoKiwiJucie()
        }
        
        return outcome
    }
}

