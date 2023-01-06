//
//  JuiceMaker - JuiceMaker.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore()
    var receipe: [Dictionary<Fruit, Int>.Element] = []
    
    mutating func makeJuice(_ juiceMenu: JuiceMenu) -> Bool {
        do {
            try checkCurrentStock(juiceMenu)
            for (fruit, stock) in receipe {
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
    
    mutating func checkCurrentStock(_ juiceMenu: JuiceMenu) throws {
        for fruit in juiceMenu.receipe.keys {
            if fruitStore.fruitStocks[fruit] == 0 {
                throw JuiceMakerError.outOfStock
            } else {
                receipe = juiceMenu.receipe.sorted { $0.1 > $1.1 }
            }
        }
    }
    
    func currentFruitStock(of fruit: Fruit) -> String {
        guard let fruitStock = fruitStore.fruitStocks[fruit] else { return "" }
        return String(fruitStock)
    }
}

