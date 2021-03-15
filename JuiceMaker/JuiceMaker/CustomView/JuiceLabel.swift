//
//  JuiceLabel.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/15.
//

import UIKit

class JuiceLabel: UILabel {
    private let cornerRadius: CGFloat = 10
    private let borderWidth: CGFloat = 1
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.backgroundColor = .init(gray: 0.8, alpha: 0.6)
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.adjustsFontSizeToFitWidth = true
    }    
}
