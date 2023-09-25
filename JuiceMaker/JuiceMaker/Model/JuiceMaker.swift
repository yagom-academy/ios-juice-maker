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
        
        try recipe.forEach { (fruit, quantity) in
            try fruitStore.decreaseStock(of: fruit, by: quantity)
        }
    }
}
