//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

enum StockError: Error {
    case outOfStock
}

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
    
 	func checkStock(for fruits: [Fruit], than stocks: [Int]) throws {
		for (fruit, stock) in zip(fruits, stocks)  {
			guard let remainStock = fruitStock[fruit], remainStock >= -stock else {
                throw StockError.outOfStock
			}
		}
    }
    
    func changeStock(for fruits: [Fruit], than stocks: [Int]) {
        for (fruit, stock) in zip(fruits, stocks) {
            if let remainStock = fruitStock[fruit] {
                fruitStock.updateValue(remainStock + stock, forKey: fruit)
            }
        }
    }
}
