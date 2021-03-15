//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/15.
//

import UIKit

class JuiceButton: UIButton {
    private let cornerRadius: CGFloat = 15
    private let borderWidth: CGFloat = 1.2

    required init?(coder: NSCoder) {
        super.init(coder: coder)!
        self.layer.backgroundColor = .init(genericCMYKCyan: 0.75, magenta: 0.45, yellow: 0.15, black: 0, alpha: 1)
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
    }
    
}
