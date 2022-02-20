//
//  FruitStepper.swift
//  JuiceMaker
//
//  Created by 이지원 on 2022/02/20.
//

import UIKit

final class FruitStepper: UIStepper {
    var fruit: Fruit? {
        return .init(rawValue: self.tag)
    }
}
