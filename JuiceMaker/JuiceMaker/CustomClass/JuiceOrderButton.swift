//
//  JuiceOrderButton.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/06/16.
//

import UIKit

class JuiceOrderButton: UIButton {
    var juice: JuiceMaker.Juice?
        
    static func connectJuice(to orderButtons: [JuiceOrderButton]) {
        for juice in 0..<orderButtons.count {
            guard let juiceKinds = JuiceMaker.Juice(rawValue: juice) else { return }
            
            orderButtons[juice].juice = juiceKinds
        }
    }
}
