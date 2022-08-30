//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

enum Fruit: CaseIterable {
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

// 과일 저장소 타입
class FruitStore {
    var fruitStock: [Fruit: Int] = Fruit.beginningStock
    
    func changeStock(fruits: Fruit..., stocks: Int...) {
        let example = zip(fruits, stocks)
        print(example)
    }
}
