//
//  AlertMessage.swift
//  JuiceMaker
//
//  Created by 박병호 on 2021/10/26.
//

import Foundation

enum AlertMessage {
    case ok
    case modifyStock
    case cancel
    case juiceMakeSuccess
    
    var korean: String {
        switch self {
        case .ok:
            return "확인"
        case .modifyStock:
            return "재고수정"
        case .cancel:
            return "취소"
        case .juiceMakeSuccess:
            return "쥬스 나왔습니다! 맛있게 드세요!"
        }
    }
}
