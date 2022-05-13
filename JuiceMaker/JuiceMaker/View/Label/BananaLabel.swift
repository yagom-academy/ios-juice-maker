//
//  BananaLabel.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/13.
//

import UIKit

class BananaLabel: FruitStockLabel {
    override func convertToFruit() -> Fruit? {
        return .banana
    }
}
