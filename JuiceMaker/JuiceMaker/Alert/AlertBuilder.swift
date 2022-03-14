//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Created by SeoDongyeon on 2022/03/11.
//

import UIKit

public final class AlertBuilder {
    private let viewController: UIViewController
    private var alertProperties = AlertProperties()
    private var alertActionSuccessProperties = AlertActionProperties()
    private var alertActionCancelProperties = AlertActionProperties()
    private var onSuccess: ((UIAlertAction) -> Void)?
    private var onCancel: ((UIAlertAction) -> Void)?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func withTitle(_ title: String) -> AlertBuilder {
        alertProperties.title = title
        return self
    }
    
    public func andMessage(_ message: String) -> AlertBuilder {
        alertProperties.message = message
        return self
    }
    
    public func preferredStyle(_ style: UIAlertController.Style) -> AlertBuilder {
        alertProperties.preferredStyle = style
        return self
    }
    
    public func onSuccessAction(title: String, _ onSuccess: @escaping ((UIAlertAction) -> Void)) -> AlertBuilder {
        alertActionSuccessProperties.title = title
        self.onSuccess = onSuccess
        return self
    }
    
    public func onCancelAction(title: String, _ onCancel: @escaping ((UIAlertAction) -> Void)) -> AlertBuilder {
        alertActionCancelProperties.title = title
        self.onCancel = onCancel
        return self
    }
    
    @discardableResult
    public func show() -> UIAlertController {
        let alert = UIAlertController(title: alertProperties.title,
                                      message: alertProperties.message,
                                      preferredStyle: alertProperties.preferredStyle)
        if let onSuccess = onSuccess {
            alert.addAction(.init(title: alertActionSuccessProperties.title,
                                  style: alertActionSuccessProperties.alertActionStyle,
                                  handler: onSuccess))
        }
        if let onCancel = onCancel {
            alert.addAction(.init(title: alertActionCancelProperties.title,
                                  style: .destructive,
                                  handler: onCancel))
        }
        viewController.present(alert, animated: true, completion: nil)
        return alert
    }
}
