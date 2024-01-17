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
    
    func makeJuice(juiceName: String, amount: Int) -> String {
        var ingredients = [String: Int]()
        var madeJuiceResult = [String: Any]()
        var checkResult = 0
        
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
            print("없는 메뉴입니다.")
        }
        
        checkResult = fruitStore.showFruitQuantity(showFruits: ingredients, showAmount: amount)
        
        if(checkResult == 1) {
            madeJuiceResult = deductFruit(reqJuiceName: juiceName, reqFruits: ingredients, reqJuiceAmount: amount)
        } else if(checkResult == 0){
            print("쥬스 만들기에 실패하였습니다. 재고 수량을 확인해주세요.")
            return "OUT OF STOCK"
        } else {
            print("error: make\(#line)")
            return "FAIL"
        }
    
        if let message = madeJuiceResult["message"] as? String {
            print(message)
            return "SUCCESS"
        } else {
            return "error: make\(#line)"
        }
    }
    
    func deductFruit(reqJuiceName: String, reqFruits: [String: Int], reqJuiceAmount: Int) -> [String: Any] {
        var status = 0
        var message = ""
        let originFruitStorage = self.fruitStore.fruitStorage
        
        debugPrint("사용전: ", self.fruitStore.fruitStorage)
        for (fruit, reqFruitQty) in reqFruits {
            var storeFruitQty = self.fruitStore.fruitStorage[fruit] ?? 0
            let useFruitQty = reqFruitQty * reqJuiceAmount
            
            storeFruitQty -= useFruitQty
            
            if(storeFruitQty >= 0){
                status = 1
                fruitStore.changeFruitQuantity(changeFruit: fruit, changeQuantity: storeFruitQty)
            } else {
                status = 0
                message = "\(fruit)가 \(-storeFruitQty)개가 부족하여 \(reqJuiceName)를 만들 수 없습니다."
                
                self.fruitStore.fruitStorage = originFruitStorage
                
                return ["status": status, "message": message]
            }
        }
        
        if(status == 1){
            message = "\(reqJuiceName)를 \(reqJuiceAmount)잔 만들었습니다."
        }
        
        debugPrint("사용후: ", self.fruitStore.fruitStorage)
        return ["status": status, "message": message]
    }
}
