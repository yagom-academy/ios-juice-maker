//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker: Makable {
    
    private var store: Storable
    
    func make(_ stuff: Stuff) {
        guard let juice = Juice(rawValue: stuff.name) else {
            return
        }
        
        juice.ingredients.forEach { store.change($0.fruit, to: $0.count) }
    }
    
}
