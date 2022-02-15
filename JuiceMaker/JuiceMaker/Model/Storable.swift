//
//  Storable.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

protocol Storable {
    
    associatedtype Stuff
    
    func change(_ stuff: Stuff, to count: Int) -> Int
    func use(_ stuff: Stuff, to count: Int) throws -> Int
    func isStock(_ stuff: Stuff, as count: Int) throws -> Bool
    
}
