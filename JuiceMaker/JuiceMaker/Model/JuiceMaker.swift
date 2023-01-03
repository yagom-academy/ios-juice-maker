//
//  JuiceMaker - JuiceMaker.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func makeJuice(juice: Juice) {
        let checkedStock = fruitStore.isStocked(recipe: juice.recipe)
        guard handleStockError(input: checkedStock) != false else { return }
        
    }
    
    func handleStockError(input: Result<Bool, JuiceMakeError>) -> Bool {
        switch input {
        case .failure(let error):
            print(error.errorMessage)
            return false
        case .success(let result):
            return result
        }
    }
}
