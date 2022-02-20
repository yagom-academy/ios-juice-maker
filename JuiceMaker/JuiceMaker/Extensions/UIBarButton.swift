//
//  UIBarButton.swift
//  JuiceMaker
//
//  Created by Dayeon Jung on 2022/02/19.
//

import UIKit

extension UIBarButtonItem {
    func addTarget(target: AnyObject, action: Selector?) {
        self.target = target
        self.action = action
    }
}
