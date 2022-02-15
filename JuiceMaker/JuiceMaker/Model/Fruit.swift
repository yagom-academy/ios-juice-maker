//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

enum Fruit: String, Stuff {
    
    case strawberry = "strawberry"
    case banana = "banana"
    case pineapple = "pineapple"
    case kiwi = "kiwi"
    case mango = "mango"
    
    var name: String {
        return self.rawValue
    }
    
}
