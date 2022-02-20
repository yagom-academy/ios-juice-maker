//
//  UIAlertController+Extension.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/17.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String?, message: String? = nil, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true)
    }
}
