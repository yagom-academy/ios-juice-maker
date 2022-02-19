//
//  NameSpace.swift
//  JuiceMaker
//
//  Created by Doyoung on 2022/02/17.
//

import Foundation

enum Stock {
    static var initValue: [Fruit:Int] {
        [.strawberry: 10,
         .pineapple: 10,
         .mango: 10,
         .kiwi: 10,
         .banana: 10]
    }
}

enum JuiceOrderCollectionViewLayoutConstant {
    typealias Size = (width: Double, height: Double)
    
    static let minimumLineSpacing = 10
    static let minimumInteritemSpacing = 10
    
    static let fruitStockCellReduceConstant = 10
    
    static func calcFruitStockCellReduceConstant(_ width: Double) -> Double {
        return (width - 10) / 5
    }
    
    static func calcOrderButtonCellReduceConstant(_ width: Double, height: Double) -> Size {
        return Size(width: (width - 20) / 2, height: height / 3)
    }
    
}
