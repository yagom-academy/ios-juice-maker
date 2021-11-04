//
//  NotificationCenter.swift
//  JuiceMaker
//
//  Created by Yohan on 2021/11/02.
//

import Foundation

let notificationCenter: NotificationCenter = NotificationCenter.default

extension Notification.Name {
    static let didEditAmount = Notification.Name("didEditAmount")
}
