//
//  makeAlert.swift
//  JuiceMaker
//
//  Created by Erick, JusBug on 2023/05/19.
//

import UIKit

extension UIViewController {
    func makeAlertMessage(_ alertTitle: String?, _ alertMessage: String?, actionTitle: String?, actionType: UIAlertAction.Style) -> UIAlertController {
        let alertMessage = UIAlertController(title: alertTitle ?? "", message: alertMessage ?? "", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: actionTitle ?? "", style: actionType))
        
        return alertMessage
    }
}
