//
//  UIStoryboard+initVC.swift.swift
//  JuiceMaker
//
//  Created by jaeyoung Yun on 2022/02/19.
//

import UIKit

extension UIStoryboard {
  static func viewController(
    from name: String = "Main",
    withIdentifier identifier: String
  ) -> UIViewController? {
    return UIStoryboard.init(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier)
  }
}
