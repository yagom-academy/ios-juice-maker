//
//  Fruits.swift
//  JuiceMaker
//
//  Created by Gordon Choi on 2022/04/28.
//

import Foundation

struct Fruits {
    private var strawberry: Int
    private var banana: Int
    private var kiwi: Int
    private var pineapple: Int
    private var mango: Int
    
    init(strawberry: Int = 0, banana: Int = 0, kiwi: Int = 0, pineapple: Int = 0, mango: Int = 0) {
        self.strawberry = strawberry
        self.banana = banana
        self.kiwi = kiwi
        self.pineapple = pineapple
        self.mango = mango
    }
}
