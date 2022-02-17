//
//  Alert.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

struct Alert {
    
    enum AlertType {
        case success
        case error
    }
    
    static func makeAlert(of type: AlertType,
                          title: String? = nil,
                          message: String? = nil,
                          actionHandler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertController {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        switch type {
        case .success:
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
        case .error:
            let yesAction: UIAlertAction = UIAlertAction(title: "예", style: .default, handler: actionHandler)
            alertController.addAction(yesAction)
            let noAction: UIAlertAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
            alertController.addAction(noAction)
        }
        
        return alertController
    }
    
}
