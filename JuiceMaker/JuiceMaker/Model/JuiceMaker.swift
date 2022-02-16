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
    func make(of juice: Juice) -> Result<String, Error> {
        do {
            try fruitStore.useFruit(of: juice)
            return Result.success("\(juice.name) 나왔습니다! 맛있게 드세요!")
        } catch let error as FruitStoreError {
            return Result.failure(error)
        } catch {
            return Result.failure(error)
        }
    }
    
    /// 과일의 개수를 가져온다.
    func quantity(of fruit: Fruit) -> Int {
        return fruitStore.quantity(of: fruit)
    }
}
