//
//  Text.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/10/28.
//

import Foundation

enum Message: CustomStringConvertible {
    case juiceFinish(juice: Juice)
    case unknownError
    case outOfStock
    
    var description: String {
        switch self {
        case .juiceFinish(let juice):
            return "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!"
        case .unknownError:
            return "알 수 없는 에러가 발생했습니다."
        case .outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
