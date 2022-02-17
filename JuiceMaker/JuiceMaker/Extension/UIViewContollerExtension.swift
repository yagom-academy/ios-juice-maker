//
//  UIViewContollerExtension.swift
//  JuiceMaker
//
//  Created by 이경준 on 2022/02/16.
//

import UIKit

extension UIViewController {
    func showBasicAlert(
        title: String = "알림",
        message: String
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func showActionAlert(
        title: String = "알림",
        message: String,
        okActionTitle: String = "예",
        cancelActionTitle: String = "아니오",
        action : ((UIAlertAction) -> Void)?
    ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okActionTitle, style: .default, handler: action)
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
