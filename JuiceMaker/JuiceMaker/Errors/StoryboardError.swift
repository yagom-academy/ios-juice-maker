//
//  StoryboardError.swift
//  JuiceMaker
//
//  Created by 김민성 on 2023/05/19.
//

import Foundation

enum StoryboardError: Error {
    case notFoundComponent
}

extension StoryboardError: ErrorExplainable {
    var title: String {
        switch self{
        case .notFoundComponent:
            return "존재하지 않는 UI 컴포넌트"
        }
    }
    
    var description: String {
        switch self{
        case .notFoundComponent:
            return "해당 UI Component를 찾을 수 없습니다."
        }
    }
    
    
}
