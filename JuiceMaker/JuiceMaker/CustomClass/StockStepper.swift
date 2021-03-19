//
//  StockStepper.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/18.
//

import UIKit

class StockStepper: UIStepper {
    var fruit: Fruit?
    var previousStepperValue: Double = 0
    
    static func connectFruit(to steppers: [StockStepper]) {
        for index in 0..<steppers.count {
            guard let fruitType = Fruit(rawValue: index) else { fatalError() }
            steppers[index].fruit = fruitType
        }
    }
}
