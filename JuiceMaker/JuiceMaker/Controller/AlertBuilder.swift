//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Created by EtialMoon, 비모 on 2023/05/22.
//

import UIKit

final class AlertBuilder {
    private var title: String?
    private var message: String?
    private var actions: [UIAlertAction] = []
    
    func setTitle(_ title: String) -> AlertBuilder {
        self.title = title
        
        return self
    }
    
    func setMessage(_ message: String) -> AlertBuilder {
        self.message = message
        
        return self
    }
    
    func addAction(title: String, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        actions.append(UIAlertAction(title: title, style: style, handler: handler))
        
        return self
    }
    
    func build() -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        actions.forEach {
            alert.addAction($0)
        }
        
        return alert
    }
}
