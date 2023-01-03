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
        fruitStore.useFruit(recipe: juice.recipe)
        completeOrder(menu: juice.menuName)
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
    
    func completeOrder(menu: String) {
        print("주문하신 \(menu) 나왔습니다.")
    }
}
