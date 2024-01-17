//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore()
    }
    
//    func makeStrawberryJuice(amount: Int){
//        var strawberryAmount = fruitStore.showFruitAmount(fruitName: "딸기")
//
//        if(strawberryAmount < 16){
//            print("과일의 재고가 부족하여 쥬스를 제조할 수 없습니다.")
//        } else{
//            strawberryAmount -= amount * 16
//            print("\(amount) 개의 딸기쥬스를 만들었습니다.")
//        }
//    }
    
    func makeJuice(juiceName: String) -> (String, [String: Int]) {
        //var juiceName = ""
        var ingredients = [String: Int]()
        
        switch juiceName {
        case "딸기쥬스":
            ingredients["딸기"] = 16
            //juiceName = "딸기쥬스"
        case "딸바쥬스":
            ingredients["딸기"] = 10
            ingredients["바나나"] = 1
            //juiceName = "딸바쥬스"
        case "바나나쥬스":
            ingredients["바나나"] = 2
            //juiceName = "바나나"
        case "키위쥬스":
            ingredients["키위"] = 3
            //juiceName = "키위"
        case "파인애플쥬스":
            ingredients["파인애플"] = 2
            //juiceName = "파인애플"
        case "망고쥬스":
            ingredients["망고"] = 3
            //juiceName = "망고"
        case "망고키위쥬스":
            ingredients["망고"] = 2
            ingredients["키위"] = 1
            //juiceName = "망고키위쥬스"
        default:
            return ("지원하지않는 쥬스입니다.", ingredients)
        }
        
        checkStorage(juiceName: juiceName, ingredients: ingredients)
        
        return (juiceName, ingredients)
    }
    
    // 과일의 재고를 체크한다.
    func checkStorage(juiceName: String, ingredients: [String: Int]) {
        for(fruits, quantity) in ingredients {
            if (fruitStore.showFruitAmount(fruitName: fruits) >= quantity) {
                fruitStore.deductFruit(fruitName: fruits, quantity: quantity)
            } else {
                return print("재고가 없습니다")
            }
        }
        print("\(juiceName) 를 만들었습니다")
    }
    
    // 과일의 재고를 차감한다.
    func useFruits(juiceName: String, ingredients: [String: Int]) {
        for (fruits, quantity) in ingredients {
            fruitStore.deductFruit(fruitName: fruits, quantity: quantity)
        }
        print("\(juiceName)를 만들었습니다.")
    }
}
