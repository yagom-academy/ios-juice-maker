//
//  UIViewContollerExtension.swift
//  JuiceMaker
//
//  Created by 이경준 on 2022/02/16.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(
        title: String = "알림",
        message: String
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func showAlert(
        title: String = "알림",
        message: String,
        action : ((UIAlertAction) -> Void)?
    ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "예", style: .default, handler: action)
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
