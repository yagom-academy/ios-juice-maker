//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 박우연 on 2021/10/28.
//

import Foundation

enum Fruit: String, CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
    static let initialValue = 10
    
    var stringValue: String {
        self.rawValue
    }
}
