//
//  File.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/06/13.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case invalidSelection
    
    var message: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .invalidSelection:
            return "존재하지 않는 과일입니다."
        }
    }
}
