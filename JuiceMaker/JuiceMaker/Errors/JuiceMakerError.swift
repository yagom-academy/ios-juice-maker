//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/19.
//

import Foundation

enum JuiceMakerError: Error {
    case notFoundJuice
}

extension JuiceMakerError: ErrorExplainable {
    var title: String {
        switch self {
        case .notFoundJuice:
            return "존재하지 않는 주스"
        }
    }
        
    var description: String {
        switch self {
        case .notFoundJuice:
            return "주스를 찾을 수 없습니다."
        }
    }
}


