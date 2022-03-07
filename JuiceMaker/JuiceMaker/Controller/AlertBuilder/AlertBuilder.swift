//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Created by 조민호 on 2022/03/03.
//

import UIKit

struct AlertProduct {
    var title: String?
    var confirmTitle: String?
    var message: String?
    var cancelTitle: String?
    var confirmHandler: (() -> Void)?
    var cancelHandler: (() -> Void)?
}

final class AlertBuilder {
    private weak var viewController: UIViewController?
    private var product = AlertProduct()

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func setTitle(_ title: String) -> AlertBuilder {
        product.title = title
        return self
    }

    func setConfirmTitle(_ confirmTitle: String) -> AlertBuilder {
        product.confirmTitle = confirmTitle
        return self
    }

    func setMessage(_ message: String) -> AlertBuilder {
        product.message = message
        return self
    }

    func setCancelTitle(_ cancelTitle: String) -> AlertBuilder {
        product.cancelTitle = cancelTitle
        return self
    }

    func setConfirmHandler(_ confirmHandler: @escaping (() -> Void)) -> AlertBuilder {
        product.confirmHandler = confirmHandler
        return self
    }

    func setCancelHandler(_ cancelHandler: @escaping (() -> Void)) -> AlertBuilder {
        product.cancelHandler = cancelHandler
        return self
    }

    func showAlert() {
        let alert = UIAlertController(title: product.title, message: product.message, preferredStyle: .alert)

        if let cancelTitle = product.cancelTitle {
            let cancelButton = UIAlertAction(title: cancelTitle, style: .destructive, handler: { _ in
                self.product.cancelHandler?()
            })
            alert.addAction(cancelButton)
        }

        let confirmButton = UIAlertAction(title: product.confirmTitle, style: .default, handler: { _ in
            self.product.confirmHandler?()
        })

        alert.addAction(confirmButton)

        viewController?.present(alert, animated: true, completion: nil)
    }
}

