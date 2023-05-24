//
//  FruitStockDelegate.swift
//  JuiceMaker
//
//  Created by EtialMoon, 비모 on 2023/05/24.
//

protocol FruitStockDelegate: AnyObject {
    func chage(_ fruitStock: [Fruit : Int])
}
