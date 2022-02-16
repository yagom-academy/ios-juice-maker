//
//  JuiceMakeResult.swift
//  JuiceMaker
//
//  Created by temp2 on 2022/02/16.
//

import Foundation

enum JuiceMakeResult {
    case success
    case fail(needFruits: [String])
    
    var description: String {
        switch self {
        case .success:
            return "쥬스 만들기 성공"
        case .fail(let needFruits):
            return "과일 \(needFruits) 부족"
        }
    }
}
