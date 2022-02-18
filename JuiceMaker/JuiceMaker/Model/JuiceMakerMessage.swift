//
//  JuiceMakerMessage.swift
//  JuiceMaker
//
//  Created by 황제하 on 2022/02/18.
//

import Foundation

enum JuiceMakerMessage {
    case ok
    case no
    case makeSuccess(juiceName: String)
    case makeFail
    
    var description: String {
        switch self {
        case .ok:
            return "예"
        case .no:
            return "아니오"
        case .makeSuccess(let juiceName):
            return "\(juiceName) 나왔습니다! 맛있게 드세요!"
        case .makeFail:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
