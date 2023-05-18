//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func takeOrder(_ juice: Juice) -> Juice? {
        let check = checkFruitStock(juice.recipe)
        
        switch check {
        case .success:
            make(juice)
            return juice
        case .failure(let error):
            print(error.localizedDescription)
            print(error)
            return nil
        }
    }
    
    private func checkFruitStock(_ recipe: [Recipe]) -> Result<Void, JuiceMakerError> {
        for fruit in recipe {
            guard let stock = fruitStore.fruitStock[fruit.name] else {
                return .failure(JuiceMakerError.notExistFruit(fruit: fruit.name))
            }
            guard stock >= fruit.quantity else {
                return .failure(JuiceMakerError.outOfStock(fruit: fruit.name))
            }
        }
        
        return .success(())
    }

    private func make(_ juice: Juice) {
        takeOutStock(for: juice.recipe)
        print("\(juice)가(이) 준비되었습니다.")
    }
    
    private func takeOutStock(for recipe: [Recipe]) {
        recipe.forEach { fruitStore.useStock(fruit: $0.name, quantity: $0.quantity) }
    }
}
