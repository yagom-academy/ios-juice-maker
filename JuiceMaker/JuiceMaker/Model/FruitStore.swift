//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var strawBerryStock: Int
    private var bananaStock: Int
    private var pineAppleStock: Int
    private var kiwiStock: Int
    private var mangoStock: Int
    
    var requiredFruitQuantity: RequiredFruitQuantity = RequiredFruitQuantity()
    
    init(strawBerryStock: Int = 10, bananaStock: Int = 10, pineAppleStock: Int = 10, kiwiStock: Int = 10, mangoStock: Int = 10) {
        self.strawBerryStock = strawBerryStock
        self.bananaStock = bananaStock
        self.pineAppleStock = pineAppleStock
        self.kiwiStock = kiwiStock
        self.mangoStock = mangoStock
    }
    
    private func increaseFruitStock(_ fruitName: FruitName, _ stock: Int) {
        switch fruitName {
        case .strawBerry :
            self.strawBerryStock += stock
        case .banana:
            self.bananaStock += stock
        case .pineApple:
            self.pineAppleStock += stock
        case .kiwi:
            self.kiwiStock += stock
        case .mango:
            self.mangoStock += stock
        }
    }
    
    private func decreaseFruitStock(_ fruitName: FruitName, _ stock: Int) {
        switch fruitName {
        case .strawBerry:
            self.strawBerryStock -= stock
        case .banana:
            self.bananaStock -= stock
        case .pineApple:
            self.pineAppleStock -= stock
        case .kiwi:
            self.kiwiStock -= stock
        case .mango:
            self.mangoStock -= stock
        }
    }
    
    func removeFruit(_ juiceName: JuiceName) {
        switch juiceName {
        case .strawBerryJuice:
            self.strawBerryStock -= requiredFruitQuantity.strawBerry
        case .bananaJuice:
            self.bananaStock -= requiredFruitQuantity.banana
        case .kiwiJuice:
            self.kiwiStock -= requiredFruitQuantity.kiwi
        case .pineAppleJuice:
            self.pineAppleStock -= requiredFruitQuantity.pineApple
        case .strawBerryBananaJuice:
            self.strawBerryStock -= requiredFruitQuantity.strawBerry
            self.bananaStock -= requiredFruitQuantity.banana
        case .mangoJuice:
            self.mangoStock -= requiredFruitQuantity.mango
        case .mangoKiwiJuice:
            self.mangoStock -= requiredFruitQuantity.mango
            self.kiwiStock -= requiredFruitQuantity.kiwi
        }
    }
    
    func checkFruitStock(_ juiceName: JuiceName) throws {
        switch juiceName {
        case .strawBerryJuice:
            requiredFruitQuantity.change(juiceName)
            guard self.strawBerryStock >= requiredFruitQuantity.strawBerry else {
                throw FruitStoreError.lackOfStockError
            }
        case .bananaJuice:
            requiredFruitQuantity.change(juiceName)
            guard self.bananaStock >= requiredFruitQuantity.banana else {
                throw FruitStoreError.lackOfStockError
            }
        case .kiwiJuice:
            requiredFruitQuantity.change(juiceName)
            guard self.kiwiStock >= requiredFruitQuantity.kiwi else {
                throw FruitStoreError.lackOfStockError
            }
        case .pineAppleJuice:
            requiredFruitQuantity.change(juiceName)
            guard self.pineAppleStock >= requiredFruitQuantity.pineApple else {
                throw FruitStoreError.lackOfStockError
            }
        case .strawBerryBananaJuice:
            requiredFruitQuantity.change(juiceName)
            guard self.strawBerryStock >= requiredFruitQuantity.strawBerry, self.bananaStock >= requiredFruitQuantity.banana else {
                throw FruitStoreError.lackOfStockError
            }
        case .mangoJuice:
            requiredFruitQuantity.change(juiceName)
            guard self.mangoStock >= requiredFruitQuantity.mango else {
                throw FruitStoreError.lackOfStockError
            }
        case .mangoKiwiJuice:
            requiredFruitQuantity.change(juiceName)
            guard self.mangoStock >= requiredFruitQuantity.mango, self.kiwiStock >= requiredFruitQuantity.kiwi else {
                throw FruitStoreError.lackOfStockError
            }
        }
    }
}
