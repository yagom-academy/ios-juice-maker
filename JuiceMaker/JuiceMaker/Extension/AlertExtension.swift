//
//  AlertExtension.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/16.
//

import UIKit

extension UIAlertAction {
    enum ActionType {
        case ok(String, ((UIAlertAction) -> Void)? = nil)
        case cancel(String, ((UIAlertAction) -> Void)? = nil)
        
        func action() -> UIAlertAction {
            var actionStyle: UIAlertAction.Style
            var title: String
            var handler: ((UIAlertAction) -> Void)?
            
            switch self {
            case let .cancel(actionTitle, actionHandler):
                actionStyle = .cancel
                title = actionTitle
                handler = actionHandler
            case let .ok(actionTitle, actionHandler):
                actionStyle = .default
                title = actionTitle
                handler = actionHandler
            }
            
            return UIAlertAction(title: title, style: actionStyle, handler: handler)
        }
    }
}

extension UIAlertController {
    convenience init(title: String, message: String, style: UIAlertController.Style = .alert) {
        self.init(title: title, message: message, preferredStyle: style)
    }
}
