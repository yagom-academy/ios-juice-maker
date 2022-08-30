//
//  Fruit.swift
//  Created by Wonbi, woong
//

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    static var defaultStock: [Self:Int] {
        var stock = [Self:Int]()
        
        Self.allCases.forEach { fruit in
            stock.updateValue(10, forKey: fruit)
        }
        return stock
    }
}
