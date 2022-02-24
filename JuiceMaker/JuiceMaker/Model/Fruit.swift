//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/02/22.
//

enum Fruit: String, CaseIterable {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    static func configureDefaultFruits(amount: Int = Constant.defaultFruitAmount) -> [Fruit : Int] {
        var fruits: [Fruit : Int] = [:]
        
        allCases.forEach { fruit in
            fruits[fruit] = amount
        }
        
        return fruits
    }
}
