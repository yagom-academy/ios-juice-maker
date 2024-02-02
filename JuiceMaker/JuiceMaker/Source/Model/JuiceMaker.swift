//
//  JuiceMaker - JuiceMaker.swift
//  Created by HAMZZI, Danny. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore: FruitStore = FruitStore(initialStock: [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10)
    
    func viewFruitStock(fruitName: Fruit) -> String {
        return String(fruitStore.fruitStorage[fruitName] ?? 0)
    }
    
    func makeJuice(juiceMenu: JuiceMenu, amount: Int) -> Result<String, FruitResultError> {
        do {
            try fruitStore.checkFruitQuantity(fruitsStock: juiceMenu.ingredients, amount: amount)
        } catch FruitResultError.outOfStock {
            return .failure(.outOfStock)
        } catch {
            print("알 수 없는 Error가 발생했습니다.")
        }
        
        let message = deductFruit(requestJuiceName: juiceMenu.rawValue, requestFruits: juiceMenu.ingredients, requestJuiceAmount: amount)
        
        return .success(message)
    }
    
    func deductFruit(requestJuiceName: String, requestFruits: [Fruit: Int], requestJuiceAmount: Int) -> String {
        print("사용전: ", fruitStore.fruitStorage)
        for (fruit, reqFruitQuantity) in requestFruits {
            var storeFruitQuantity = fruitStore.fruitStorage[fruit] ?? 0
            let useFruitQuantity = reqFruitQuantity * requestJuiceAmount
            
            storeFruitQuantity -= useFruitQuantity
            fruitStore.changeFruitQuantity(fruitName: fruit, quantity: storeFruitQuantity)
        }
        
        let message = "\(requestJuiceName)를 \(requestJuiceAmount)잔 만들었습니다."
        
        print("사용후: ", fruitStore.fruitStorage)
        return message
    }
}
