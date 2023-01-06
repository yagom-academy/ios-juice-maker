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
        if let _ = fruitStore.useFruit(juice: juiceName) {
            return juiceName
        }
        return nil
    }
}
