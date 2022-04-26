//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var store = FruitStore()
    private let menu = Menu.allCases.map({ "\($0)" }).joined(separator: ", ")
}
