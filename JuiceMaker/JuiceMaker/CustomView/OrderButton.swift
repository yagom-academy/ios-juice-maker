//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/15.
//

import UIKit

final class OrderButton: UIButton {
    private(set) var kindJuice: Juices?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.backgroundColor = .init(genericCMYKCyan: 0.75, magenta: 0.45, yellow: 0.15, black: 0, alpha: 1)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.2
    }
    
    func manage(kindJuice: Juices) {
        self.kindJuice = kindJuice
    }
}
