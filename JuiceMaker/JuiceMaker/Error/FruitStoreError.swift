//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Jinyoung Kim on 2022/02/15.
//

import Foundation

enum FruitStoreError: Error {
    
    case outOfStock([Fruit])
    case unkown
}
