//  FruitStockSend.swift
//  JuiceMaker
//  Created by LIMGAUI on 2022/03/10.

import Foundation

protocol FruitStockDelegate: AnyObject {
    func sendData(_ fruitsStock: [String])
}
