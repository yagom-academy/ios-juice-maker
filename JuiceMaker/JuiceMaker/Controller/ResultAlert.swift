//
//  ResultAlert.swift
//  JuiceMaker
//
//  Created by Whales on 2023/05/23.
//

import UIKit

enum ResultAlert: Equatable {
    case completion(Juice)
    case failure
    case error
    
    var message: String {
        switch self {
        case .completion(let juice):
            return "\(juice.name) 나왔습니다! 맛있게 드세요!"
        case .failure:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .error:
            return "알 수 없는 에러가 발생하였습니다. \n 다시 시도해주시기 바랍니다."
        }
    }
    
    var closeActionTitle: String {
        switch self {
        case .completion:
            return "닫기"
        case .failure:
            return "아니오"
        case .error:
            return "닫기"
        }
    }
}
