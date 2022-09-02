//
//  JuiceMaker - Fruit.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
    var initialStock: Int {
        switch self {
        default:
            return 10
        }
    }
}
