//
//  JuiceMaker - StockUpdateableDelegate.swift
//  Created by Andrew, 혜모리 on 2023.01.16
//

protocol StockUpdateableDelegate: AnyObject {
    func updateStock(to stockList: [FruitStore.Fruit: Int])
}
