//
//  JuiceMaker - Fruits.swift
//  Created by Wonbi, woong
//

struct Fruits {
    enum FruitType: Int {
        case strawberry = 0
        case banana
        case pineapple
        case kiwi
        case mango
        
        static func makeList() -> [Self] {
            var fruitList = [Self]()
            var fruitIndex: Int = Self.strawberry.rawValue
            
            while FruitType(rawValue: fruitIndex) != nil {
                if let fruit = Self(rawValue: fruitIndex) {
                    fruitList.append(fruit)
                    fruitIndex += 1
                }
            }
            return fruitList
        }
    }
    
    var name: FruitType
    var count: Int
    
    var fruitIndex: Int {
        self.name.rawValue
    }
    
    init(name: FruitType, count: Int) {
        self.name = name
        self.count = count
    }
}
