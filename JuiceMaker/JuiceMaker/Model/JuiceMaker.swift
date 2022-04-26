//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var JuiceMakersStore = FruitStore()
    
    func makeJuice(juice: Juice) {
        do {
            switch juice {
            case .strawberryJuice:
                try JuiceMakersStore.reduceStock(fruit: Fruit.strawberry.name, amount: FruitConsumption.strawberryInStrawberryJuice)
             case .bananaJuice:
                try JuiceMakersStore.reduceStock(fruit: Fruit.banana.name, amount: FruitConsumption.bananaInBananaJuice)
            case .kiwiJuice:
                try JuiceMakersStore.reduceStock(fruit: Fruit.kiwi.name, amount: FruitConsumption.kiwiInKiwiJuice)
            case .pineappleJuice:
                try JuiceMakersStore.reduceStock(fruit: Fruit.pineapple.name, amount: FruitConsumption.pineappleInPineappleJuice)
            case .strawberryBananaJuice:
                try JuiceMakersStore.reduceStock(fruit: Fruit.strawberry.name, amount: FruitConsumption.strawberryInStrawberryBananaJuice)
                try JuiceMakersStore.reduceStock(fruit: Fruit.banana.name, amount: FruitConsumption.bananaInStrawberryBananaJuice)
            case .mangoJuice:
                try JuiceMakersStore.reduceStock(fruit: Fruit.mango.name, amount: FruitConsumption.mangoInMangoJuice)
            case .mangoKiwiJuice:
                try JuiceMakersStore.reduceStock(fruit: Fruit.mango.name, amount: FruitConsumption.mangoInMangoKiwiJuice)
                try JuiceMakersStore.reduceStock(fruit: Fruit.kiwi.name, amount: FruitConsumption.kiwiInMangoKiwiJuice)
            }
        } catch (let error) {
            switch error {
            case StockError.outOfStock:
                print(StockError.outOfStock.message)
            case StockError.invalidSelection:
                print(StockError.invalidSelection.message)
            default:
                print("알 수 없는 에러")
            }
        }
    }
}
