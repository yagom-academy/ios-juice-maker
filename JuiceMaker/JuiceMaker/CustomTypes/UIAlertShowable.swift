//
//  UIAlertShowable.swift
//  JuiceMaker
//
//  Created by 정다연 on 2/17/22.
//

import UIKit

protocol UIAlertShowable {
    var alertInfo: Alert { get }
    func alertController() -> UIAlertController
}

struct Alert {
    var components: AlertComponents
    var actions: [AlertAction]
}

struct AlertComponents {
    var title: String?
    var message: String?
    var style: UIAlertController.Style
    
}

struct AlertAction {
    var title: String?
    var style: UIAlertAction.Style
    var handler: ((UIAlertAction) -> Void)?
}


extension UIAlertShowable {
    func alertController() -> UIAlertController {
        let alertController = UIAlertController(
            title: alertInfo.components.title,
            message: alertInfo.components.message,
            preferredStyle: alertInfo.components.style
        )
    
        alertInfo.actions.forEach { action in
            alertController.addAction(
                UIAlertAction(
                    title: action.title,
                    style: action.style,
                    handler: action.handler
                )
            )
        }
        
        return alertController
    }
}
