//
//  UIButton+NumberOfLines.swift
//  JuiceMaker
//
//  Created by 김정상 on 2022/02/17.
//

import UIKit

extension UIButton {
    @IBInspectable
    var numberOfLines: Int {
        get {
            titleLabel?.numberOfLines ?? 1
        }
        set {
            titleLabel?.numberOfLines = newValue
        }
    }
}
