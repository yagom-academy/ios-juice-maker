//
//  JuiceMaker - JuiceMaker.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
// 

enum JuiceMakerError: Error, CustomStringConvertible {
    case outOfFruitStock
    case unknownError
    
    var description: String {
        switch self {
        case .outOfFruitStock:
            return "재고가 부족하여 음료 제조가 불가능 합니다."
        case .unknownError:
            return "알 수 없는 오류"
        }
    }
}

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore(initialStock: 20)
    
    func blendFruitJuice(menu fruitJuice: Juice) {
        do {
            try requestFruitStock(menu: fruitJuice)
            receiveFruitStock(menu: fruitJuice)
            print("주문하신 \(fruitJuice)가 나왔습니다.")
        } catch JuiceMakerError.outOfFruitStock {
            print(JuiceMakerError.outOfFruitStock)
        } catch {
            print(JuiceMakerError.unknownError)
        }
    }
    
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        var isEnoughStock: Bool = Bool()
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.hasEnoughStock(fruit: $0.key, amount: $0.value)
        }
        
        if isEnoughStock == false {
            throw JuiceMakerError.outOfFruitStock
        }
    }
    
    private func receiveFruitStock(menu fruitJuice: Juice) {
        fruitJuice.recipe.forEach {
            fruitStore.reduceStock(fruit: $0.key, amount: $0.value)
        }
    }
}
      
