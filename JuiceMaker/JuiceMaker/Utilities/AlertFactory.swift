//
//  AlertFactory.swift
//  JuiceMaker
//
//  Created by 황제하 on 2022/02/18.
//

import UIKit

struct AlertFactory {
    static func create(
        title: String? = nil,
        message: String? = nil,
        preferredStyle: UIAlertController.Style = .alert,
        actions: UIAlertAction...
    ) -> UIAlertController{
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        actions.forEach { action in
            alert.addAction(action)
        }
        return alert
    }
}
