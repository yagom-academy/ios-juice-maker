//
//  FruitLabel.swift
//  JuiceMaker
//
//  Created by JeongTaek Han on 2021/11/02.
//

import UIKit

class FruitLabel: UILabel {
    var kindOfFruit: Fruits?
}

class FruitStepper: UIStepper {
    var kindOfFruit: Fruits?
}

class JuiceButton: UIButton {
    var kindOfJuice: Juice?
}
