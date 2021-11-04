//
//  NotificationCenter.swift
//  JuiceMaker
//
//  Created by 권나영 on 2021/10/28.
//

import Foundation

let notificationCenter = NotificationCenter.default

extension Notification.Name {
    static let stockInformation = Notification.Name("stockInformation")
    static let stockModified = Notification.Name("stockModified")
}

enum NotificationKey {
    case fruit
    case stock
    case orderComplete
    case stockOfFruit
}
