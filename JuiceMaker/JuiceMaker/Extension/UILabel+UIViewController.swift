//
//  UILabel+UIViewController.swift
//  JuiceMaker
//
//  Created by 편대호 on 2021/06/18.
//

import Foundation
import UIKit

//MARK:- Shared Methods.

extension UIViewController {
    func setFruitLabelsTag(fruitLabels: [UILabel]) {
        for (index, fruitLabel) in fruitLabels.enumerated() {
            fruitLabel.tag = index
        }
    }
    
    func refreshStockLabel(fruitLabels: [UILabel]) {
        let stocks = FruitStore.shared.fruitStocks
    
        for fruitLabel in fruitLabels {
            if let fruit = Fruit(rawValue: fruitLabel.tag), let quantity = stocks[fruit] {
                fruitLabel.text = "\(quantity)"
            }
        }
    }
}
