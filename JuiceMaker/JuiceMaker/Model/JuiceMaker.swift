//
//  JuiceMaker - JuiceMaker.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func makeJuice(_ juice: Juice) -> Bool {
        let checkedStock = fruitStore.checkStock(forRecipe: juice)
        guard handleStockError(checkedStockResult: checkedStock) != false else { return false }
        fruitStore.useFruit(forRecipe: juice)
        return true
    }
    
    func handleStockError(checkedStockResult: Result<Bool, JuiceMakeError>) -> Bool {
        switch checkedStockResult {
        case .success(let verifiedValue):
            return verifiedValue
            
        case .failure(_):
            return false
        }
    }
}
