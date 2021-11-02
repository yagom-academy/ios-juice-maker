//
//  Text.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/10/28.
//

import UIKit.UIButton

enum Text {
    case cancel
    case ok
    
    var title: String {
        switch self {
        case .cancel:
            return "취소"
        case .ok:
            return "확인"
        }
    }
}
