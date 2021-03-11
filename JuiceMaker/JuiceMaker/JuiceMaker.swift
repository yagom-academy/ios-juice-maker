//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by 오인탁 on 2021/03/11.
//

import Foundation

struct JuiceMaker {
 
    func makeJuice(fruit: Fruit, requiredAmount: Int) {
        if fruit.quantity >= requiredAmount {
            fruit.useStock(amount: requiredAmount)
        }
    }
    
}
