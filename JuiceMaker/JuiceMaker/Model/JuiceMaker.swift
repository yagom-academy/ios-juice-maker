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
    func make(of juice: Juice) throws -> String {
        try fruitStore.useFruit(of: juice)
        return "\(juice.name) 나왔습니다! 맛있게 드세요!"
    }
    
    /// 과일의 개수를 가져온다.
    func quantity(of fruit: Fruit) -> Int {
        return fruitStore.quantity(of: fruit)
    }
    
    func updateQuantity(of fruit: Fruit, quantity: Int) {
        fruitStore.updateQuantity(of: fruit, quantity: quantity)
    }
}
