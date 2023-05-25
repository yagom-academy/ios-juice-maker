//
//  StockViewControllerDelegate.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/25.
//

import Foundation

protocol StockViewControllerDelegate {
    func sendStock(changedStockLabels: [String?])
}
