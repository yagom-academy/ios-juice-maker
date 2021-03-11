//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by 오인탁 on 2021/03/11.
//

import Foundation

struct JuiceMaker {
    func makeJuice(fruit: inout Fruit, requiredAmount: Int) {
            fruit.useStock(amount: 16)
    }
    
}
