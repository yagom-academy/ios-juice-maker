//
//  UIButton+Ext.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/11/05.
//

import UIKit

extension UIButton {
    func setUpTitleLabelFontAttributes() {
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
