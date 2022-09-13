//
//  JuiceMaker - JuiceMaker.swift
//  Created by 써니쿠키, SummerCat
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    func makeJuice(_ juice: Juice, total: Int) -> Result<String, Error> {
        do {
            try checkFruitStore(for: juice, total: total)
            useFruit(juice, total: total)
            return .success("\(juice.juiceName) 나왔습니다! 맛있게 드세요!")
        } catch let error as JuiceMakerError {
            return .failure(error)
        } catch {
            return .failure(error)
        }
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
