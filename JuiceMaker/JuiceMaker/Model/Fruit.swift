//
//  Fruit.swift
//  JuiceMaker
//
//  Created by dasan & kyungmin on 2023/05/09.
//

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
    
    var inventoryIndex: Int {
        switch self {
        case .strawberry:
            return 0
        case .banana:
            return 1
        case .pineapple:
            return 2
        case .kiwi:
            return 3
        case .mango:
            return 4
        }
    }
}
