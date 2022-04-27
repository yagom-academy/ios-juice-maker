//
//  JuiceMaker - JuiceMaker.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    let juiceMakerStore = FruitStore()
    
    func make(_ juice: String) {
        do {
            try checkStock(function: juiceMakerStore.reduceStock(fruit:amount:), juice: juice)
        } catch (let error) {
            handle(error)
        }
    }
    
    private func checkStock(function: (String, Int) throws -> Void, juice: String) rethrows {
        switch juice {
        case Product.strawberryJuice.name:
            try function(Fruit.strawberry.name, FruitConsumption.strawberryInStrawberryJuice)
        case Product.strawberryJuice.name:
            try function(Fruit.banana.name, FruitConsumption.bananaInBananaJuice)
        case Product.kiwiJuice.name:
            try function(Fruit.kiwi.name, FruitConsumption.kiwiInKiwiJuice)
        case Product.pineappleJuice.name:
            try function(Fruit.pineapple.name, FruitConsumption.pineappleInPineappleJuice)
        case Product.strawberryBananaJuice.name:
            try function(Fruit.strawberry.name, FruitConsumption.strawberryInStrawberryBananaJuice)
            try function(Fruit.banana.name, FruitConsumption.bananaInStrawberryBananaJuice)
        case Product.mangoJuice.name:
            try function(Fruit.mango.name, FruitConsumption.mangoInMangoJuice)
        case Product.mangoKiwiJuice.name:
            try function(Fruit.mango.name, FruitConsumption.mangoInMangoKiwiJuice)
            try function(Fruit.kiwi.name, FruitConsumption.kiwiInMangoKiwiJuice)
        default:
            print("만들 수 없는 주스입니다")
        }
    }
    
    private func handle(_ error: Error) {
        switch error {
        case JuiceMakerError.outOfStock:
            print(JuiceMakerError.outOfStock.message)
        case JuiceMakerError.missingProduct:
            print(JuiceMakerError.missingProduct.message)
        default:
            print("알 수 없는 오류입니다")
        }
    }
}
