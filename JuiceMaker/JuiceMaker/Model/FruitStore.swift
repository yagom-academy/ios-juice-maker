//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var strawberry = 10
    var banana = 10
    var pineapple = 10
    var kiwi = 10
    var mango = 10
}

extension FruitStore {
    func useFruits(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0,) {
        self.strawberry -= strawberry
        self.banana -= banana
        self.pineapple -= pineapple
        self.kiwi -= kiwi
        self.mango -= mango
    }
}
