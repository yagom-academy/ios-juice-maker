//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore = FruitStore()
    
    /// 쥬스를 만든다.
    func makeJuice(juice: Juice) {
        do {
            try fruitStore.useFruit(juice: juice)
        } catch let error as FruitStoreError {
            print(error.rawValue)
        } catch {
            print(error)
        }
    }
    
    /// 과일의 개수를 가져온다.
    func quantity(of fruit: Fruit) -> Int {
        return fruitStore.quantity(of: fruit)
    }
}
