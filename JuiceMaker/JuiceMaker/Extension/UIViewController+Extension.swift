//
//  UIAlertController+Extension.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/17.
//

import UIKit

extension UIViewController {
    /// Alert을 띄우는 방법 정의
    ///
    /// - Cases
    ///   - submit: 확인 버튼 하나만 있는 알림창 스타일
    ///   - suggest: 취소와 확인 버튼이 있는 알림창 스타일
    enum AlertMethod {
        case submit
        case suggest
    }
    
    func showAlert(method: AlertMethod, title: String?, message: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var actions: [UIAlertAction] = []
        
        switch method {
        case .submit:
            actions.append(UIAlertAction(title: AlertNameSpace.Action.submit, style: .default, handler: handler))
        case .suggest:
            actions.append(UIAlertAction(title: AlertNameSpace.Action.no, style: .cancel))
            actions.append(UIAlertAction(title: AlertNameSpace.Action.yes, style: .default, handler: handler))
        }
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true)
    }
}
