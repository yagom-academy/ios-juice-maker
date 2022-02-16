//
//  JuiceMakeResult.swift
//  JuiceMaker
//
//  Created by temp2 on 2022/02/16.
//

import Foundation

enum JuiceMakeResult {
    case success
    case notEnoughFruit
    
    var description: String {
        switch self {
        case .success:
            return "쥬스 만들기 성공"
        case .notEnoughFruit:
            return "과일이 부족합니다."
        }
    }
}
