//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

protocol Juice {
    var description: String { get }
    var ingredients: [Fruit: Int] { get }
}

protocol ResultProcessDelegate {
    func alert(_: String)
    func alertWithCancel(_: String)
}

final class JuiceMaker {
    private var stock: [Fruit: Int] = [:]
    var delegate: ResultProcessDelegate?
    
    init(stockCount: Int) {
        for fruit in Fruit.allCases {
            stock[fruit] = stockCount
        }
    }
    
    func make(juice: Juice) {
        if isEnough(ingredients: juice.ingredients) {
            for (fruit, count) in juice.ingredients {
                guard let stockCount = stock[fruit] else { return }
                stock[fruit] = stockCount - count
            }
            delegate?.alert("\(juice.description) 나왔습니다! 맛있게 드세요!")
        } else {
            delegate?.alertWithCancel("재료가 모자랍니다.")
        }
    }
    
    func fillUpStock(of fruit: Fruit, count: Int) {
        guard let stockCount = stock[fruit] else {
            print("재고 목록에 없는 과일입니다")
            return
        }
        stock[fruit] = stockCount + count
    }
    
    func stock(of fruit: Fruit) -> Int? {
        return stock[fruit]
    }
    
    private func isEnough(ingredients: [Fruit: Int]) -> Bool {
        for (fruit, count) in ingredients {
            guard let stock = stock(of: fruit) else { return false }
            if stock < count { return false }
        }
        
        return true
    }
}
