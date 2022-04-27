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
            throw FruitStoreError.invalidAmount
        }
        
        fruitRecipe[fruit] = amount
    }
    
    func addStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitRecipe[fruit] else {
            throw FruitStoreError.missingProduct
        }
        guard amount >= 0 else {
            throw FruitStoreError.invalidAmount
        }
        let changedStock = fruitStock + amount
        
        fruitRecipe[fruit] = changedStock
    }
    
    func reduceStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitRecipe[fruit] else {
            throw FruitStoreError.missingProduct
        }
        guard amount >= 0 else {
            throw FruitStoreError.invalidAmount
        }
        guard fruitStock >= amount else {
            throw FruitStoreError.outOfStock
        }
        let changedStock = fruitStock - amount
        
        fruitRecipe[fruit] = changedStock
    }
    
    func check(fruit: Fruit) throws {
        guard fruitRecipe.keys.contains(fruit) else {
            throw FruitStoreError.missingProduct
        }
    }
    
    func checkStock(function: (Fruit) throws -> Void, juice: Product) rethrows {
        switch juice {
        case Product.strawberryJuice:
            try function(Fruit.strawberry)
        case Product.bananaJuice:
            try function(Fruit.banana)
        case Product.kiwiJuice:
            try function(Fruit.kiwi)
        case Product.pineappleJuice:
            try function(Fruit.pineapple)
        case Product.strawberryBananaJuice:
            try function(Fruit.strawberry)
            try function(Fruit.banana)
        case Product.mangoJuice:
            try function(Fruit.mango)
        case Product.mangoKiwiJuice:
            try function(Fruit.mango)
            try function(Fruit.kiwi)
        }
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
        case FruitStoreError.outOfStock:
            print(FruitStoreError.outOfStock.localizedDescription)
        case FruitStoreError.missingProduct:
            print(FruitStoreError.missingProduct.localizedDescription)
        case FruitStoreError.invalidAmount:
            print(FruitStoreError.invalidAmount.localizedDescription)
        default:
            print("알 수 없는 오류입니다")
        }
    }
}
