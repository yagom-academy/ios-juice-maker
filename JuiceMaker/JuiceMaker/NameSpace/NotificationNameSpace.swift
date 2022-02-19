//
//  NotificationNameSpace.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/18.
//

import Foundation

enum NotificationNameSpace {
    static let sendFruitStoreDataNotificationName = Notification.Name(rawValue: "SendFruitStoreData")
    
    enum UserInfo {
        static let fruitStore = "FruitStore"
    }
}
