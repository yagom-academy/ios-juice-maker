//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 이호영 on 2021/10/28.
//

import Foundation
import UIKit

enum FruitError: LocalizedError {
    case notFoundJuice
    case notFoundFruit
    
    var errorDescription: String? {
        switch self {
        case .notFoundJuice:
            return "과일 ID에 해당하는 주스 케이스를 찾을 수 없습니다."
        case .notFoundFruit:
            return "과일 ID에 해당하는 과일 케이스를 찾을 수 없습니다."
        }
    }
}

enum StoryboardError: LocalizedError {
    case notFoundView(AnyObject, UIViews)
    case notFoundID(AnyObject, UIViews)
    
    var errorDescription: String? {
        switch self {
        case .notFoundView(let VC, let viewName):
            return """
                    \(VC)
                    StoryBoard의 \(viewName)을 찾을 수 없습니다.
                   """
        case .notFoundID(let VC, let viewID):
            return """
                    \(VC)
                    StoryBoard의 \(viewID)을 찾을 수 없습니다.
                   """
        }
    }
}

enum UIViews {
    case button, label, stepper
    
    var description: String {
        return String(describing: self)
    }
}
