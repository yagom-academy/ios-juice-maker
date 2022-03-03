//
//  AlertSetting.swift
//  JuiceMaker
//
//  Created by Lingo on 2022/03/01.
//

import UIKit

enum AlertSetting {
  static let ok = "확인"
  static let notice = "알림"
  static let yes = "예"
  static let no = "아니오"
  
  static func presentAlert(
    title: String?,
    message: String?,
    preferredStyle: UIAlertController.Style,
    actions: [UIAlertAction]
  ) -> UIAlertController {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: preferredStyle
    )
    actions.forEach { action in
      alertController.addAction(action)
    }
    return alertController
  }
}
