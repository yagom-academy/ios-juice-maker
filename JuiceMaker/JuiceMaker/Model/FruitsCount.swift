//
//  FruitsCount.swift
//  JuiceMaker
//
//  Created by 서원지 on 2022/02/22.
//

import Foundation

class FruitsCount {
    private var fruitinventory: [FruitsTypes: Int] = [:]
    init() {
        for fruit in FruitsTypes.allCases {
            fruitinventory[fruit] = 10
        }
    }
}
