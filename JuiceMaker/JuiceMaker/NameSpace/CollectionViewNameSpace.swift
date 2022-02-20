//
//  CollectionViewNameSpace.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/18.
//

import Foundation

enum CollectionViewNameSpace {
    typealias Size = (width: Double, height: Double)
    
    static let fruitStockCellResuableID = "FruitStockCollectionViewCell"
    static let orderButtonCellResuableID = "OrderButtonCollectionViewCell"
    static let stockModifyCellResuableID = "StockModifyCollectionViewCell"
    
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
