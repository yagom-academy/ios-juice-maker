//
//  KiwiLabel.swift
//  JuiceMaker
//
//  Created by 이예은 on 2022/05/13.
//

import UIKit

class KiwiLabel: FruitStockLabel {
    override func convertToFruit() -> Fruit? {
        return .kiwi
    }
}
