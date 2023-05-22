//
//  Alert.swift
//  JuiceMaker
//
//  Created by EtialMoon, 비모 on 2023/05/22.
//

import UIKit

class Alert {
    static let `default` = Alert()
    
    private init() {}
    
    func showAlert(_ viewController: UIViewController, title: String?, message: String?, actions: [UIAlertAction]?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions, !actions.isEmpty {
            actions.forEach {
                alert.addAction($0)
            }
        }
        
        viewController.present(alert, animated: true)
    }
}
