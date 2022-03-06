//
//  JuiceMaker - Alert.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Alert {
    case outOfStock
    case orderSuccess
    case unknownError
}

extension Alert {
    var title: String {
        switch self {
        case .outOfStock:
            return "재고부족"
        case .orderSuccess:
            return "주문완료"
        case .unknownError:
            return "오류"
        }
    }
    
    var message: String {
        switch self {
        case .outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .orderSuccess:
            return "나왔습니다! 맛있게 드세요!"
        case .unknownError:
            return "알 수 없는 오류가 발생했습니다. 다시 시도해주세요."
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
