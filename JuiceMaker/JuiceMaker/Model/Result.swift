//
//  Result.swift
//  JuiceMaker
//
//  Created by jiinheo on 2022/02/17.
//

import Foundation

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
