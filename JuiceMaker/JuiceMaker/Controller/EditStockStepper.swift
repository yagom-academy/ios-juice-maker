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
}

class StrawberryStepper: EditStockStepper {
    override func convertToFruit() -> Fruit? {
        return .strawberry
    }
}

class BananaStepper: EditStockStepper {
    override func convertToFruit() -> Fruit? {
        return .banana
    }
}

class PineappleStepper: EditStockStepper {
    override func convertToFruit() -> Fruit? {
        return .pineapple
    }
}

class KiwiStepper: EditStockStepper {
    override func convertToFruit() -> Fruit? {
        return .kiwi
    }
}

class MangoStepper: EditStockStepper {
    override func convertToFruit() -> Fruit? {
        return .mango
    }
}
