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
}

class StrawberryLabel: FruitStockLabel {
    override func convertToFruit() -> Fruit? {
        return .strawberry
    }
}

class BananaLabel: FruitStockLabel {
    override func convertToFruit() -> Fruit? {
        return .banana
    }
}

class PineappleLabel: FruitStockLabel {
    override func convertToFruit() -> Fruit? {
        return .pineapple
    }
}

class KiwiLabel: FruitStockLabel {
    override func convertToFruit() -> Fruit? {
        return .kiwi
    }
}

class MangoLabel: FruitStockLabel {
    override func convertToFruit() -> Fruit? {
        return .mango
    }
}
