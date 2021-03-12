//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/12.
//

import Foundation
import UIKit

class JuiceButton: UIButton {
    func make(_ menu: Juice) {
        JuiceMaker.shared.make(menu)
    }
}
