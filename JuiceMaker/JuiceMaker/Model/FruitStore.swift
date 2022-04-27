//
//  JuiceMaker - FruitStore.swift
//  Created by 수꿍, 바드.
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
     private var fruitRecipe: Dictionary<Fruit, Int> = [
        Fruit.strawberry: InitialFruitSetting.stock,
        Fruit.banana: InitialFruitSetting.stock,
        Fruit.pineapple: InitialFruitSetting.stock,
        Fruit.kiwi: InitialFruitSetting.stock,
        Fruit.mango: InitialFruitSetting.stock
    ]
    
    func changeStock(fruit: Fruit, amount: Int) throws {
        guard amount >= 0 else {
            throw JuiceMakerError.invalidAmount
        }
        
        fruitRecipe[fruit] = amount
    }
    
    func addStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitRecipe[fruit] else {
            throw JuiceMakerError.missingProduct
        }
        guard amount >= 0 else {
            throw JuiceMakerError.invalidAmount
        }
        let changedStock = fruitStock + amount
        
        fruitRecipe[fruit] = changedStock
    }
    
    func reduceStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitRecipe[fruit] else {
            throw JuiceMakerError.missingProduct
        }
        guard amount >= 0 else {
            throw JuiceMakerError.invalidAmount
        }
        guard fruitStock >= amount else {
            throw JuiceMakerError.outOfStock
        }
        let changedStock = fruitStock - amount
        
        fruitRecipe[fruit] = changedStock
    }
    
    func checkStock(function: (Fruit, Int) throws -> Void, juice: Product) rethrows {
        switch juice {
        case Product.strawberryJuice:
            try function(Fruit.strawberry, CostOfJuiceProduction.strawberryInStrawberryJuice)
        case Product.bananaJuice:
            try function(Fruit.banana, CostOfJuiceProduction.bananaInBananaJuice)
        case Product.kiwiJuice:
            try function(Fruit.kiwi, CostOfJuiceProduction.kiwiInKiwiJuice)
        case Product.pineappleJuice:
            try function(Fruit.pineapple, CostOfJuiceProduction.pineappleInPineappleJuice)
        case Product.strawberryBananaJuice:
            try function(Fruit.strawberry, CostOfJuiceProduction.strawberryInStrawberryBananaJuice)
            try function(Fruit.banana, CostOfJuiceProduction.bananaInStrawberryBananaJuice)
        case Product.mangoJuice:
            try function(Fruit.mango, CostOfJuiceProduction.mangoInMangoJuice)
        case Product.mangoKiwiJuice:
            try function(Fruit.mango, CostOfJuiceProduction.mangoInMangoKiwiJuice)
            try function(Fruit.kiwi, CostOfJuiceProduction.kiwiInMangoKiwiJuice)
        }
    }
    
    func handle(_ error: Error) {
        switch error {
        case JuiceMakerError.outOfStock:
            print(JuiceMakerError.outOfStock.localizedDescription)
        case JuiceMakerError.missingProduct:
            print(JuiceMakerError.missingProduct.localizedDescription)
        case JuiceMakerError.invalidAmount:
            print(JuiceMakerError.invalidAmount.localizedDescription)
        default:
            print("알 수 없는 오류입니다")
        }
    }
}
