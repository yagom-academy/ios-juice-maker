//
//  JuiceMaker - FruitStore.swift
//  Created by 수꿍, 바드.
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
     private var fruitWarehouse: Dictionary<Fruit, Int> = [
        Fruit.strawberry: InitialFruitStock.stock,
        Fruit.banana: InitialFruitStock.stock,
        Fruit.pineapple: InitialFruitStock.stock,
        Fruit.kiwi: InitialFruitStock.stock,
        Fruit.mango: InitialFruitStock.stock
    ]
    
    func changeStock(fruit: Fruit, amount: Int) throws {
        guard amount >= 0 else {
            throw FruitStoreError.invalidAmount
        }
        
        fruitWarehouse[fruit] = amount
    }
    
    func addStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitWarehouse[fruit] else {
            throw FruitStoreError.missingProduct
        }
        guard amount >= 0 else {
            throw FruitStoreError.invalidAmount
        }
        let changedStock = fruitStock + amount
        
        fruitWarehouse[fruit] = changedStock
    }
    
    func reduceStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitWarehouse[fruit] else {
            throw FruitStoreError.missingProduct
        }
        guard amount >= 0 else {
            throw FruitStoreError.invalidAmount
        }
        guard fruitStock >= amount else {
            throw FruitStoreError.outOfStock
        }
        let changedStock = fruitStock - amount
        
        fruitWarehouse[fruit] = changedStock
    }
    
    func checkFruitKind(_ fruit: Fruit) throws {
        guard fruitWarehouse.keys.contains(fruit) else {
            throw FruitStoreError.missingProduct
        }
    }
    
    func goToWarehouse(of function: (Fruit) throws -> Void, juice: Juice) rethrows {
        switch juice {
        case Juice.strawberry:
            try function(Fruit.strawberry)
        case Juice.banana:
            try function(Fruit.banana)
        case Juice.kiwi:
            try function(Fruit.kiwi)
        case Juice.pineapple:
            try function(Fruit.pineapple)
        case Juice.strawberryBanana:
            try function(Fruit.strawberry)
            try function(Fruit.banana)
        case Juice.mango:
            try function(Fruit.mango)
        case Juice.mangoKiwi:
            try function(Fruit.mango)
            try function(Fruit.kiwi)
        }
    }
    
    func checkStock(function: (Fruit, Int) throws -> Void, juice: Juice) rethrows {
        switch juice {
        case Juice.strawberry:
            try function(Fruit.strawberry, CostOfJuiceProduction.strawberryInStrawberryJuice)
        case Juice.banana:
            try function(Fruit.banana, CostOfJuiceProduction.bananaInBananaJuice)
        case Juice.kiwi:
            try function(Fruit.kiwi, CostOfJuiceProduction.kiwiInKiwiJuice)
        case Juice.pineapple:
            try function(Fruit.pineapple, CostOfJuiceProduction.pineappleInPineappleJuice)
        case Juice.strawberryBanana:
            try function(Fruit.strawberry, CostOfJuiceProduction.strawberryInStrawberryBananaJuice)
            try function(Fruit.banana, CostOfJuiceProduction.bananaInStrawberryBananaJuice)
        case Juice.mango:
            try function(Fruit.mango, CostOfJuiceProduction.mangoInMangoJuice)
        case Juice.mangoKiwi:
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
