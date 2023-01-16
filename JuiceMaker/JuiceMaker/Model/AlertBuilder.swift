//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Created by 천승현 on 2023/01/13.
//


import UIKit

protocol Builder {
    var alert: UIAlertController {get}
    
    func setTitle(_ title: String) -> Builder
    func setMessage(_ mesasge: String) -> Builder
    func setAlertAction(title: String, style: UIAlertAction.Style, completion: (() -> ())?) -> Builder
}

final class AlertBuilder: Builder {
    var alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    func setTitle(_ title: String) -> Builder {
        alert.title = title
        return self
    }
    
    func setMessage(_ message: String) -> Builder {
        alert.message = message
        return self
    }
    
    func setAlertAction(title: String, style: UIAlertAction.Style, completion: (() -> ())? = nil) -> Builder {
        let alertAction = UIAlertAction(
            title: title,
            style: style,
            handler: { _ in
            completion?()
        })
        alert.addAction(alertAction)
        return self
    }

    func buildAlert() -> UIAlertController {
        return alert
    }
}
