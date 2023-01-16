//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Created by 천승현 on 2023/01/13.
//


import UIKit

protocol AlertDelegate {
    func presentFruitStoreVC()
}

protocol Builder {
    var alert: UIAlertController { get }
    
    func setTitle(_ title: String) -> Builder
    func setMessage(_ message: String) -> Builder
    func setAlertAction(title: String, style: UIAlertAction.Style) -> Builder
}


final class AlertBuilder: Builder {
    
    var delegate: AlertDelegate?
    
    var alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    func setTitle(_ title: String) -> Builder {
        alert.title = title
        return self
    }
    
    func setMessage(_ message: String) -> Builder {
        alert.message = message
        return self
    }
    
    func setAlertAction(title: String, style: UIAlertAction.Style) -> Builder {
        let alertAction = UIAlertAction(
            title: title,
            style: style,
            handler: { _ in
                self.delegate?.presentFruitStoreVC()
        })
        alert.addAction(alertAction)
        return self
    }

    func buildAlert() -> UIAlertController {
        return alert
    }
}
