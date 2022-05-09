//
//  ManangingOrderDelegate.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/05/09.
//

import Foundation

protocol ManangingOrderDelegate {
    func setUpStock() -> FruitStock
    func edit(fruit: Fruit, with amount: Int)
    func updateUI()
}
