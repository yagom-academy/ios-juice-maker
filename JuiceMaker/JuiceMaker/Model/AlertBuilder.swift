//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Created by 천승현 on 2023/01/13.
//


import UIKit

final class AlertBuilder {
    
    var alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    func setTitle(_ title: String) {
        alert.title = title
    }
    
    func setMessage(_ message: String) {
        alert.message = message
    }
    
    func setAlertAction(title: String, style: UIAlertAction.Style, completion: (() -> ())? = nil) {
        let alertAction = UIAlertAction(
            title: title,
            style: style,
            handler: { _ in
            completion?()
        })
        alert.addAction(alertAction)
    }

    
    func buildAlert() -> UIAlertController {
        return alert
    }
}
