//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kiseok, 쥬봉이. 
//  Copyright © yagom academy. All rights reserved.
// 


// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore.shared
    
    func makeJuice(menu: JuiceMenu) {
        let recipe: [Fruit: Int] = menu.recipe
        
        guard fruitStore.isDecreasedStock(recipe: recipe) else {
            print("\(menu)를 만들 수 없습니다.")
            return
        }
        print("\(menu)를 만들었습니다.")
    }
    
    
}




