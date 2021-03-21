//
//  OrderJuiceButton.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class OrderJuiceButton: UIButton {
    var juice: Juice?
    
    func make(using juice: Juice) -> UIAlertController {
        let alert = OrderAlertController()
        do {
            try JuiceMaker.shared.makeJuice(using: juice)
            return alert.alertOfSuccess(juice: juice)
        } catch {
            return alert.alertOfFail()
        }
    }
}
