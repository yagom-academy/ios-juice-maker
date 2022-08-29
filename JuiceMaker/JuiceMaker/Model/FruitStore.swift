//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stock: [Fruit:Int] = [:]
    
    
    func changeAmount(of fruit: Fruit, to amount: Int) {
        
    }
    
    func checkStock(of fruit: Fruit, amount: Int) -> Result<Int,Error> {
        guard let fruitCount = stock[fruit] else {
            return .failure(Error.self as! Error)
        }
        guard fruitCount > amount else {
            return .failure(Error.self as! Error)
        }
        stock[fruit]! -= amount
        return .success(fruitCount)
    }
    
    
}


