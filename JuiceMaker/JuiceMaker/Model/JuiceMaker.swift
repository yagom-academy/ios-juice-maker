//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore: FruitStore = FruitStore(initialStock: [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10])
    
    func makeJuice(juiceMenu: JuiceMenu, amount: Int) -> String {
        let checkResult: String
        do {
            try checkResult = fruitStore.showFruitQuantity(fruitsStock: juiceMenu.ingredients, amount: amount)
        } catch {
            print("outOfStock")
        }
        
        switch checkResult {
        case "availableMakeJuice":
            let deductionResult = deductFruit(requestJuiceName: juiceMenu.rawValue, requestFruits: juiceMenu.ingredients, requestJuiceAmount: amount)
            
            switch deductionResult {
            case ResultType.success(let success):
                print("success: == \(success)")
                return "\(success)"
            case ResultType.failure(let error):
                print("error: make\(#line) == \(error)")
                return "Error: 쥬스를 만들 수 없습니다."
            }
        default:
            print("error: make\(#line)")
            return "쥬스 만들기에 실패하였습니다. 재고 수량을 확인해주세요."
        }
    }
    
    func deductFruit(requestJuiceName: String, requestFruits: [Fruit: Int], requestJuiceAmount: Int) -> ResultType {
        var message = ""
        let originFruitStorage = fruitStore.fruitStorage
        
        print("사용전: ", fruitStore.fruitStorage)
        for (fruit, reqFruitQuantity) in requestFruits {
            var storeFruitQuantity = fruitStore.fruitStorage[fruit] ?? 0
            let useFruitQuantity = reqFruitQuantity * requestJuiceAmount
            
            storeFruitQuantity -= useFruitQuantity
            
            if storeFruitQuantity >= 0 {
                fruitStore.changeFruitQuantity(fruitName: fruit, quantity: storeFruitQuantity)
            } else {
                message = "\(fruit)가 \(-storeFruitQuantity)개가 부족하여 \(requestJuiceName)를 만들 수 없습니다."
                
                fruitStore.fruitStorage = originFruitStorage
                
                return ResultType.failure(message)
            }
        }
        
        message = "\(requestJuiceName)를 \(requestJuiceAmount)잔 만들었습니다."
        
        print("사용후: ", fruitStore.fruitStorage)
        return ResultType.success(message)
    }
}
