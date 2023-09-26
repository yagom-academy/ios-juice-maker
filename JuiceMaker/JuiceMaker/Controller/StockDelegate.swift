//
//  StockDelegate.swift
//  JuiceMaker
//
//  Created by 미르, 찰스 on 2023/09/26.
//

protocol StockDelegate {
    func updateStock(to inventory: [Fruit: Int])
}
