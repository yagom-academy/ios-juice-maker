//
//  JuiceMakerResult.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/15.
//

import Foundation

/// A enum that describes the result
/// of making juice on `JuiceMaker`
enum JuiceMakerResult<T: Error> {
    
    case success
    case fail(error: T)
    
}
