//
//  Fruit.swift
//  Created by Ash, 미니.
//

enum Fruit: Int, CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    static var beginningStock: [Fruit: Int] {
        var stocks: [Fruit: Int] = [:]
        self.allCases.forEach {
            stocks[$0] = 10
        }
        return stocks
    }
}
