//
//  UIViewController+Extensions.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/05/02.
//

import Foundation
import UIKit

extension UIViewController {
    func move(to identifier: String) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
            return
        }
        viewController.modalTransitionStyle = .coverVertical
        self.present(viewController, animated: true)
    }
}
