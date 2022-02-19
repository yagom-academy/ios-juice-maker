//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    static var count: Int {
        return allCases.count
    }
    
    static func emoji(offset: Int) -> String {
        return allCases[offset].imageName
    }
    
    static func name(offset: Int) -> String {
        return allCases[offset].name
    }
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        }
    }
    
    var imageName: String {
        switch self {
        case .strawberry:
            return AssetNameSpace.strawberry
        case .banana:
            return AssetNameSpace.banana
        case .pineapple:
            return AssetNameSpace.pineapple
        case .kiwi:
            return AssetNameSpace.kiwi
        case .mango:
            return AssetNameSpace.mango
        }
    }
}
