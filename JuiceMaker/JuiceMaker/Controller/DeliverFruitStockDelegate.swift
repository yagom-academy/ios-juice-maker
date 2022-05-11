//
//  DeliverFruitStockDelegate.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/11.
//

import Foundation

protocol DeliverFruitStockDelegate: AnyObject {
    func transferFruit(stock: [Fruit: Int])
}
