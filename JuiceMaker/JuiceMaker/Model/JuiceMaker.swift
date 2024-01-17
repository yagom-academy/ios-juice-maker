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
    
    func makeJuice(juice: String) -> (String, [String: Int]) {
        var juiceName = ""
        var ingredients = [String: Int]()
        
        switch juice {
        case "딸기쥬스":
            ingredients["딸기"] = 16
            juiceName = "딸기쥬스"
        case "딸바쥬스":
            ingredients["딸기"] = 10
            ingredients["바나나"] = 1
            juiceName = "딸바쥬스"
        default:
            return ("지원하지않는 쥬스입니다.", ingredients)
        }
        
        useFruits(juiceName: juiceName, ingredients: ingredients)
        
        return (juiceName, ingredients)
    }
    
    // 과일의 재고를 확인한다.
    func checkStorage(fruitName: String) {
        print(fruitStore.showFruitAmount(fruitName: fruitName))
    }
    // 과일의 재고를 차감한다.
    func useFruits(juiceName: String, ingredients: [String: Int]) {
        for (fruits, quantity) in ingredients {
            fruitStore.deductFruit(fruitName: fruits, quantity: quantity)
        }
        print("\(juiceName)를 만들었습니다.")
    }
}
