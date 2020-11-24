//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class JuiceMaker {
    private let sameInitialStock: UInt?
    private var fruitManagement: [Fruit: UInt]
    
    init(sameInitialStock: UInt?, strawberryStock: UInt?, bananaStock: UInt?, pineappleStock: UInt?, kiwiStock: UInt?, mangoStock: UInt?) {
        guard sameInitialStock != nil else {
            self.sameInitialStock = nil
            self.fruitManagement = [.strawberry: strawberryStock!, .banana: bananaStock!, .pineapple: pineappleStock!, .kiwi: kiwiStock!, .mango: mangoStock!]
            return
        }
        self.sameInitialStock = sameInitialStock!
        self.fruitManagement = [.strawberry: sameInitialStock!, .banana: sameInitialStock!, .pineapple: sameInitialStock!, .kiwi: sameInitialStock!, .mango: sameInitialStock!]
    }
    
    func checkFruitStock() {
        for fruit in fruitManagement {
            print("\(fruit.key)는 \(fruit.value)개 남아 있습니다.")
        }
    }
    
    func addNewKind(fruit: Fruit, fruitStock: UInt) {
        fruitManagement[fruit] = fruitStock
    }
    
    func makeJuiceUseOneKind(fruit: Fruit, requiredNumber: UInt) {
        guard let stock = fruitManagement[fruit], stock >= requiredNumber else {
            print("재고가 부족합니다. 현재 재고는 \(fruitManagement[fruit]!)개 입니다.")
            return
        }
        let stockAfterMakingJuice = stock - requiredNumber
        fruitManagement.updateValue(stockAfterMakingJuice, forKey: fruit)
    }
    
    func makeStrawberryAndBananaJuice() {
        guard let strawberryStock = fruitManagement[.strawberry], let bananaStock = fruitManagement[.banana], strawberryStock >= 10, bananaStock >= 1 else {
            print("재고가 부족합니다. 현재 딸기 재고는 \(fruitManagement[.strawberry]!)개 이고, 바나나 재고는 \(fruitManagement[.banana]!)개 입니다.")
            return
        }
        let strawberryStockAfterMakingJuice = strawberryStock - 10
        let bananaStockAfterMakingJuice = bananaStock - 1
        fruitManagement.updateValue(strawberryStockAfterMakingJuice, forKey: .strawberry)
        fruitManagement.updateValue(bananaStockAfterMakingJuice, forKey: .banana)
    }
    
    func makeMangoAndKiwiJuice() {
        guard let mangoStock = fruitManagement[.mango], let kiwiStock = fruitManagement[.kiwi], mangoStock >= 2, kiwiStock >= 1 else {
            print("재고가 부족합니다. 현재 망고 재고는 \(fruitManagement[.mango]!)개 이고, 키위 재고는 \(fruitManagement[.kiwi]!)개 입니다.")
            return
        }
        let mangoStockAfterMakingJuice = mangoStock - 2
        let kiwiStockAfterMakingJuice = kiwiStock - 1
        fruitManagement.updateValue(mangoStockAfterMakingJuice, forKey: .mango)
        fruitManagement.updateValue(kiwiStockAfterMakingJuice, forKey: .kiwi)
    }
    
    func addStock(fruit: Fruit) {
        guard let fruitStock = fruitManagement[fruit] else {
            return
        }
        fruitManagement.updateValue(fruitStock + 1, forKey: fruit)
    }
}
