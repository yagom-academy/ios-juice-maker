//
//  StepperButton.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/20.
//

import UIKit

final class StepperButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    func stepperButtonSetting(updownValue value: Int, updownShape shape: String, color: CGColor) {
        self.tag = value
        self.setTitle(shape, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        self.layer.borderWidth = 1
        self.layer.borderColor = color
    }
}
