//
//  Makable.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

protocol Makable {
    associatedtype Stuff
    
    func make(into stuff: Stuff) throws -> Bool
}
