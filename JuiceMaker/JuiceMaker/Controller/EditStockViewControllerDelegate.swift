//
//  DeliverFruitStockDelegate.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/11.
//

import Foundation

protocol EditStockViewControllerDelegate: AnyObject {
    func editStockViewControllerDidChangeStock(
        _ editedStock: [Fruit: Int],
        _ editStockViewController: EditStockViewController
    )
}
