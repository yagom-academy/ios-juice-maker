//
//  JuiceMaker - JuiceMaker.swift
//  Created by BaekGom,Kay
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    func makeJuice(juiceName: JuiceKind) throws {
        do{
            try fruitStore.subtractFruitAmount(juiceRecipe: juiceName.recipe)
        } catch ErrorCategory.zeroError {
            throw ErrorCategory.zeroError
        } catch ErrorCategory.cannotError {
            throw ErrorCategory.cannotError
        }
    }

    func fruitCount(fruitName: FruitKind) -> String {
        let fruitCount = fruitStore.retrieveStock()
        if let selectedFruitCount = fruitCount[fruitName] {
            return String(selectedFruitCount)
        } else {
            return String(StockCount.empty.amountInIntegerType)
        }
    }
    
    func updateAmount(fruitName: FruitKind, fruitAmount: Int) {
        fruitStore.changeFruitAmount(fruitName: fruitName, amount: fruitAmount)
    }
    
    func updateTotalAmount(editedStock: Dictionary<FruitKind, Int>) {
        fruitStore.changeAllFruitAmount(latestStock: editedStock)
    }
}
