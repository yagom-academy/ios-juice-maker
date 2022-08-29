//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    var juiceList: [String: Int] = ["strawberryJuice": 0, "bananaJuice": 0, "kiwiJuice": 0, "pineappleJuice": 0, "mangoJuice": 0, "strawBananaJuice": 0, "mangoKiwiJuice": 0]
    
    func makeFruitJuice(fruit: String) {
        switch fruit {
        case "strawberry":
            makeStrawberryJuice()
            //        case "banana"
            //        case "kiwi"
            //        case "pineapple"
        default:
            return
        }
    }
    
    func makeStrawberryJuice() {
        guard let a = fruitStore.fruitList["strawberry"] else {
            print("해당하는 과일이 없습니다.")
            return
        }
        
        if a < 16 {
            print("딸기가 최소 16개 있어야 합니다.")
            return
        }
        
    }
}
