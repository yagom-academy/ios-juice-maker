//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/17.
//

import Foundation

enum JuiceMakerError : Error {
    case outOfStock
    case notFound
    case system
    
    func getMessage() -> String {
        switch self {
        case .outOfStock:
            return "재고가 모자라요.\n재고를 수정할까요?"
        case .notFound:
            return "선택한 품목을 찾을 수 없어요.\n잠시 후 다시 시도해주세요."
        case .system:
            return "시스템 상 오류가 있습니다.\n잠시 후 다시 시도해 주세요."
        }
    }
}
