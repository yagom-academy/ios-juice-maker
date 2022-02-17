//
//  UIViewController+Additional.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/17.
//

import UIKit

extension UIViewController {
    
    func showAlert(
        alertTitle: String = "",
        message: String? = nil,
        okActionTitle: String = "OK",
        okActionHandler: ((UIAlertAction) -> Void)? = nil,
        cancelActionTitle: String? = nil,
        cancelActionHandlert: ((UIAlertAction) -> Void)? = nil
    ) {
        let alertController: UIAlertController = UIAlertController(
            title: alertTitle,
            message: message,
            preferredStyle: .alert)
        
        let okAction: UIAlertAction = UIAlertAction(
            title: okActionTitle,
            style: .default,
            handler: okActionHandler)
        alertController.addAction(okAction)
        
        if let cancelActionTitle = cancelActionTitle {
            let noAction: UIAlertAction = UIAlertAction(
                title: cancelActionTitle,
                style: .destructive,
                handler: cancelActionHandlert)
            alertController.addAction(noAction)
        }
        
        self.present(alertController, animated: true)
    }
    
}
