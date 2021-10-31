//
//  AlertMessage.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/27.
//

import Foundation


enum AlertMessage: CustomStringConvertible {
    var description: String {
        switch self {
        case .makeSuccessMessage:
            return " 나왔습니다! 맛있게 드세요!"
        case .makeFailMessage:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
    
    case makeSuccessMessage
    case makeFailMessage
}
