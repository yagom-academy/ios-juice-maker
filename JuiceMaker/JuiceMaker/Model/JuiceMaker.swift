//
//  JuiceMaker - JuiceMaker.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore.shared

    func makeJuice(juiceName: Juice) -> Juice? {
        if fruitStore.useFruit(juice: juiceName) != nil {
            return juiceName
        }
        return nil
    }
}
