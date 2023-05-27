//
//  Exchangeable.swift
//  JuiceMaker
//
//  Created by Whales on 2023/05/28.
//

protocol Exchangeable: AnyObject {
    func exchangeInventory(inventory: [Fruit: Int])
    func takeCurrentInventory() -> [Fruit: Int]
}
