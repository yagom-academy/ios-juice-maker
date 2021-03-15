//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/12.
//

import Foundation
import UIKit
@IBDesignable class JuiceButton: UIButton {
   var juice: Juice = JuiceType.strawberry

    func make(_ menu: Juice) {
        JuiceMaker.make(menu)
    }
   @IBInspectable var juiceName: String = "딸기쥬스"
}
