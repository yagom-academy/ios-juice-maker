//
//  JuiceMaker - JuiceMaker.swift
//  Created by 써니쿠키, SummerCat
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    func makeJuice(_ juice: Juice, total: Int) {
        do {
            try checkFruitStore(for: juice, total: total)
        } catch let error as JuiceMakerError {
            print(error.errorDescription)
            return
        } catch {
            print("\(error)")
            return
        }
        
        useFruit(juice, total: total)
        
        print("\(juice.juiceName) \(total)잔 완성")
    }
    
    private func checkFruitStore(for juice: Juice, total: Int) throws {
        for (ingredient, quantity) in juice.recipe {
            try FruitStore.sharedFruitStore.checkStockOf(ingredient, total: quantity * total)
        }
    }
    
    private func useFruit(_ juice: Juice, total: Int) {
        for (ingredient, quantity) in juice.recipe {
            FruitStore.sharedFruitStore.changeStockOf(fruit: ingredient, by: -quantity * total)
        }
    }
}
