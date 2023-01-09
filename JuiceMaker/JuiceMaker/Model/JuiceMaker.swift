//
//  JuiceMaker - JuiceMaker.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    static let sharedJuiceMaker = JuiceMaker()
    
    private init() {}
    
    let fruitStore = FruitStore()
    
    func makeJuice(_ juiceMenu: JuiceMenu) -> Bool {
        do {
            try checkCurrentStock(juiceMenu)
            for (fruit, stock) in juiceMenu.receipe {
                try fruitStore.subtractStock(of: fruit, amount: stock)
            }
            return true
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
            return false
        } catch JuiceMakerError.fruitError {
            print("과일 선택 오류입니다.")
            return false
        } catch {
            print("알 수 없는 오류가 발생했습니다.")
            return false
        }
    }
    
    func checkCurrentStock(_ juiceMenu: JuiceMenu) throws {
        for fruit in juiceMenu.receipe.keys {
            guard let requiredAmount = juiceMenu.receipe[fruit] else {
                throw JuiceMakerError.fruitError
            }
            guard let currentStock = fruitStore.fruitStocks[fruit] else {
                throw JuiceMakerError.fruitError
            }
            if currentStock < requiredAmount {
                throw JuiceMakerError.outOfStock
            }
        }
    }
    
    func currentFruitStock(of fruit: Fruit) -> String {
        guard let fruitStock = fruitStore.fruitStocks[fruit] else { return "" }
        return String(fruitStock)
    }
}


