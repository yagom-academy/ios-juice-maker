//
//  JuiceMaker - JuiceMaker.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(_ juiceMenu: JuiceMenu) {
        let receipe = juiceMenu.receipe
        
        do {
            for (fruit, stock) in receipe {
                try fruitStore.subtractStock(of: fruit, amount: stock)
            }
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch JuiceMakerError.fruitError {
            print("과일 선택 오류입니다.")
        } catch {
            print("알 수 없는 오류가 발생했습니다.")
        }
    }
    
    func currentFruitStock(of fruit: Fruits) -> String {
        guard let fruitStock = fruitStore.fruitStocks[fruit] else { return "" }
        return String(fruitStock)
    }
}

