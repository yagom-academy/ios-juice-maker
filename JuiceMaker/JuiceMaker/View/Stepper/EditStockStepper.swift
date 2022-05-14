//
//  EditStockStepper.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/10.
//

import UIKit

class EditStockStepper: UIStepper {
    func convertToFruit() -> Fruit? {
        return nil
    }
    
    func configure(with fruitsStock: [Fruit: Int]) {
        guard let fruit = self.convertToFruit(),
              let amount = fruitsStock[fruit]
        else {
            return
        }
        self.value = Double(amount)
    }
}



