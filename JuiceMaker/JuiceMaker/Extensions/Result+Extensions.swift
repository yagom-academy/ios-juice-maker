//
//  Result.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/05/04.
//

import Foundation

extension Result {
    func handleValue(_ closure: (Success) -> Void) {
        switch self {
        case .success(let value):
            closure(value)
        default:
            break
        }
    }
    
    func handleError(_ closure: (Failure) -> Void) {
        switch self {
        case .failure(let value):
            closure(value)
        default:
            break
        }
    }
}
