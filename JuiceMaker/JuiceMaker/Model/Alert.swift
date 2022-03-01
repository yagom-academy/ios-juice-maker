//
//  ErrorHandling.swift
//  JuiceMaker
//
//  Created by marisol, mmim on 2022/02/22.
//

import Foundation

enum OrderError: Error {
    case outOfStock
    case unknownError
}

enum Alert {
    case outOfStock
    case orderSuccess
}

extension Alert {
    var title: String {
        switch self {
        case .outOfStock:
            return "주문완료"
        case .orderSuccess:
            return "재고부족"
        }
    }
    
    var message: String {
        switch self {
        case .outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .orderSuccess:
            return "나왔습니다! 맛있게 드세요!"
        }
    }
}

enum AlertButton {
    case yes
    case no
    case confirm
}

extension AlertButton {
    var title: String {
        switch self {
        case .yes:
            return "예"
        case .no:
            return "아니오"
        case .confirm:
            return "확인"
        }
    }
}
