//
//  ViewControllerExtension.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/20.
//

import Foundation
import UIKit

extension UIViewController {
    func errorAlert(_ error: Error, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        var errorMessgae: String?
        if let juiceError = error as? JuiceMakerError {
            errorMessgae = juiceError.localizedDescription
        }
        else {
            errorMessgae = JuiceMakerError.unknown.localizedDescription
        }
        
        let alert = UIAlertController(title: "오류", message: errorMessgae, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(okAction)
        return alert
    }
}
