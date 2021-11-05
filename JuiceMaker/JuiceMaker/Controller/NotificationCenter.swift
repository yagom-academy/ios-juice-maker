//
//  NotificationCenter.swift
//  JuiceMaker
//
//  Created by hoon on 2021/11/05.
//

import Foundation

let notificationCenter: NotificationCenter = .default

extension Notification.Name {
    static let stockDataTransmission = Notification.Name("stockDataTransmission")
}
