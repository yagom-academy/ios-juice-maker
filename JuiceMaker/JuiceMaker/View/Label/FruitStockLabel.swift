//
//  FruitStockLabel.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/06.
//

import UIKit

class FruitStockLabel: UILabel {
    func convertToFruit() -> Fruit? {
        return nil
    }
    
    func configure(with stock: [Fruit: Int]) {
        guard let fruit = self.convertToFruit() else { return }
        guard let amountOfFruit = stock[fruit] else { return }
        
        self.text = "\(amountOfFruit)"
    }
}
