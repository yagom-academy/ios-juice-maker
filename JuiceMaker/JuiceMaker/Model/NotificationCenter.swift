//  JuiceMaker - NotificationCenter.swift
//  Created by 송준, Rowan on 2023/01/12.
//  Copyright © yagom academy. All rights reserved.

import Foundation

let center: NotificationCenter = NotificationCenter.default



extension Notification.Name {
    static let fruitStockChanged = Notification.Name("과일재고변경")
}


