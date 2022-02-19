//
//  StoreType.swift
//  JuiceMaker
//
//  Created by 이지원 on 2022/02/19.
//

import Foundation

protocol StoreType {
    associatedtype Product
    
    func increase(product: Product, to amount: Number) throws
    func decrease(product: Product, to amount: Number) throws
    func hasStock(of product: Product, to count: Number) -> Bool
}
