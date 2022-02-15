//
//  Makable.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

protocol Makable {
    
    func make(_ stuff: Stuff) throws -> Bool
    
}
