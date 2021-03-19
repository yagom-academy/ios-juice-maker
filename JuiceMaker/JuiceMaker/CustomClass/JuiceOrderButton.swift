//
//  Custom.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/18.
//

import UIKit

class JuiceOrderButton: UIButton {
    var juice: Juice?
    
    static func connectJuice(to buttons: [JuiceOrderButton]) {
        for index in 0..<buttons.count {
            guard let juiceType = Juice(rawValue: index) else { fatalError() }
            
            buttons[index].juice = juiceType
        }
    }
}
