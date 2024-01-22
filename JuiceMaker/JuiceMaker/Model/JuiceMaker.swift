//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMenu: String {
    case strawberry = "딸기쥬스"
    case strawberryBanana = "딸바쥬스"
    case banana = "바나나쥬스"
    case kiwi = "키위쥬스"
    case pineapple = "파인애플쥬스"
    case mango = "망고쥬스"
    case mangokiwi = "망키쥬스"
    
    var ingredients: [String: Int] {
        switch self {
        case .strawberry:
            return ["딸기": 16]
        case .strawberryBanana:
            return ["딸기": 10, "바나나": 1]
        case .banana:
            return ["바나나": 2]
        case .kiwi:
            return ["키위": 3]
        case .pineapple:
            return ["파인애플": 2]
        case .mango:
            return ["망고": 3]
        case .mangokiwi:
            return ["망고": 2, "키위": 1]
        }
    }
}

enum ResultType {
    case success(String)
    case failure(String)
}

struct JuiceMaker {
    private var fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juiceMenu: JuiceMenu, amount: Int) -> String {
        let checkResult = fruitStore.showFruitQuantity(showFruits: juiceMenu.ingredients, showAmount: amount)
        
        switch checkResult {
        case .success:
            let deductionResult = deductFruit(requestJuiceName: juiceMenu.rawValue, requestFruits: juiceMenu.ingredients, requestJuiceAmount: amount)
            
            switch deductionResult {
            case .success(let success):
                print("success: == \(success)")
                return "\(success)"
            case .failure(let error):
                print("error: make\(#line) == \(error)")
                return "Error: 쥬스를 만들 수 없습니다."
            }
        case .failure:
            print("error: make\(#line)")
            return "쥬스 만들기에 실패하였습니다. 재고 수량을 확인해주세요."
        }
    }
    
    func deductFruit(requestJuiceName: String, requestFruits: [String: Int], requestJuiceAmount: Int) -> ResultType {
        var message = ""
        let originFruitStorage = fruitStore.fruitStorage
        
        print("사용전: ", fruitStore.fruitStorage)
        for (fruit, reqFruitQuantity) in requestFruits {
            var storeFruitQuantity = fruitStore.fruitStorage[fruit] ?? 0
            let useFruitQuantity = reqFruitQuantity * requestJuiceAmount
            
            storeFruitQuantity -= useFruitQuantity
            
            if storeFruitQuantity >= 0 {
                fruitStore.changeFruitQuantity(changeFruit: fruit, changeQuantity: storeFruitQuantity)
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
