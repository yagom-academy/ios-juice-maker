//
//  JuiceMaker - JuiceMaker.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    let juiceMakerStore = FruitStore()
    
    func make(_ juice: Product) {
        do {
            try checkStock(function: juiceMakerStore.reduceStock(fruit:amount:), juice: juice)
        } catch (let error) {
            handle(error)
        }
    }
    
    private func checkStock(function: (Fruit, Int) throws -> Void, juice: Product) rethrows {
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
    
    private func handle(_ error: Error) {
        switch error {
        case JuiceMakerError.outOfStock:
            print(JuiceMakerError.outOfStock.message)
        case JuiceMakerError.missingProduct:
            print(JuiceMakerError.missingProduct.message)
        case JuiceMakerError.invalidAmount:
            print(JuiceMakerError.invalidAmount.message)
        default:
            print("알 수 없는 오류입니다")
        }
    }
}
