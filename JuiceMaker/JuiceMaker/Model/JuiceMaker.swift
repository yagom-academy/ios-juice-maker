//
//  JuiceMaker - JuiceMaker.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func makeJuice(ordered juice: Juice) {
        let checkedStock = fruitStore.isStocked(juiceIngredients: juice.recipe)
        guard handleStockError(checkedStockResult: checkedStock) != false else { return }
        fruitStore.useFruit(juiceIngredients: juice.recipe)
        printCompleteMessage(menu: juice.name)
    }
    
    func handleStockError(checkedStockResult: Result<Bool, JuiceMakeError>) -> Bool {
        switch checkedStockResult {
        case .success(let verifiedValue):
            return verifiedValue
            
        case .failure(let error):
            print(error.errorMessage)
            return false
        }
    }
    
    func printCompleteMessage(menu: String) {
        print("주문하신 \(menu) 나왔습니다.")
    }
}
