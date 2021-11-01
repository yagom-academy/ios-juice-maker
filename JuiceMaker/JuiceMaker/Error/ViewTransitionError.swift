//
//  ViewTransitionError.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/11/01.
//

import Foundation

enum ViewTransitionError: Error {
    case viewTransitionFailed
}

extension ViewTransitionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .viewTransitionFailed:
            return "화면 전환에 실패하였습니다."
        }
    }
}
