//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Kyo, TaeLee on 2022/08/29.
//

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    static func findFruiteStepperTag(location: Int) -> Fruit? {
        switch location {
        case 0:
            return .strawberry
        case 1:
            return .banana
        case 2:
            return .pineapple
        case 3:
            return .kiwi
        case 4:
            return .mango
        default:
            return nil
        }
    }
}
