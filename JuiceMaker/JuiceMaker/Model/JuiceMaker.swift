//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kiseok, 쥬봉이. 
//  Copyright © yagom academy. All rights reserved.
// 


// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore.shared
    
    func makeJuice(menu: JuiceMenu) throws {
        let recipe: [Fruit: Int] = menu.recipe
        
        guard fruitStore.isValidStock(of: recipe) else {
            throw StockError.outOfStock
        }
        
        fruitStore.decreaseStock(of: recipe)
    }
}
