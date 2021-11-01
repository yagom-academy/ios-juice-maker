//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 권나영 on 2021/10/29.
//

import Foundation

enum JuiceMakerError: Error, CustomStringConvertible {
    case invalidTagNumberForButton
    
    var description: String {
        switch self {
        case .invalidTagNumberForButton:
            return "Invalid tag number for button"
        }
    }
}
