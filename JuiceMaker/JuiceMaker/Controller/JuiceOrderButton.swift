//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/12.
//

import UIKit
@IBDesignable class JuiceOrderButton: UIButton {
    var juice: Juice = JuiceType.strawberry
    
    func make(menu: Juice) {
        JuiceMaker.make(menu: menu)
    }
}
