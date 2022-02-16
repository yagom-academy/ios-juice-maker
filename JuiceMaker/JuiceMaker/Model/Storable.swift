//
//  Storable.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

protocol Storable {
    
    associatedtype Stuff
    
    func change(_ stuff: Stuff, to count: Int)
    func use(_ stuff: Stuff, to count: Int) throws
    func checkStock(_ stuff: Stuff, as count: Int) throws -> Bool
    
}

protocol FruitStorable {
    
    func change(_ stuff: Fruit, to count: Int)
    func use(_ stuff: Fruit, to count: Int) throws
    func checkStock(_ stuff: Fruit, as count: Int) throws -> Bool
    
}
