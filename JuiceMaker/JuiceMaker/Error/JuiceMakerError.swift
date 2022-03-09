//
//  Error.swift
//  JuiceMaker
//
//  Created by 서원지 on 2022/02/23.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case unexpectedError
    case notExistNavigationController
    case typeCastingError
    case stepperError
}
