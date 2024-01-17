//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore()
    }
    
    func makeJuice(juiceName: String) -> (String, [String: Int]) {
        var ingredients = [String: Int]()
        
        switch juiceName {
        case "딸기쥬스":
            ingredients["딸기"] = 16
        case "딸바쥬스":
            ingredients["딸기"] = 10
            ingredients["바나나"] = 1
        case "바나나쥬스":
            ingredients["바나나"] = 2
        case "키위쥬스":
            ingredients["키위"] = 3
        case "파인애플쥬스":
            ingredients["파인애플"] = 2
        case "망고쥬스":
            ingredients["망고"] = 3
        case "망고키위쥬스":
            ingredients["망고"] = 2
            ingredients["키위"] = 1
        default:
            return ("지원하지않는 쥬스입니다.", ingredients)
        }
        
        checkStorage(juiceName: juiceName, ingredients: ingredients)
        
        return (juiceName, ingredients)
    }
    
    func checkStorage(juiceName: String, ingredients: [String: Int]) {
        for(fruits, quantity) in ingredients {
            let selectedFruits = fruitStore.showFruitAmount(fruitName: fruits)
            if (selectedFruits >= quantity) {
                fruitStore.deductFruit(fruitName: fruits, quantity: quantity)
            } else {
                return print("재고가 없습니다")
            }
        }
        print("\(juiceName) 를 만들었습니다")
    }
    
    func useFruits(juiceName: String, ingredients: [String: Int]) {
        for (fruits, quantity) in ingredients {
            fruitStore.deductFruit(fruitName: fruits, quantity: quantity)
        }
        print("\(juiceName)를 만들었습니다.")
    }
}
