//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var JuiceMakersStore = FruitStore()
    
    func makeJuice(juice: String) {
        do {
            switch juice {
            case Juice.strawberryJuice.name:
                try JuiceMakersStore.reduceStock(fruit: Fruit.strawberry.name, amount: FruitConsumption.strawberryInStrawberryJuice)
            case Juice.bananaJuice.name:
                try JuiceMakersStore.reduceStock(fruit: Fruit.banana.name, amount: FruitConsumption.bananaInBananaJuice)
            case Juice.kiwiJuice.name:
                try JuiceMakersStore.reduceStock(fruit: Fruit.kiwi.name, amount: FruitConsumption.kiwiInKiwiJuice)
            case Juice.pineappleJuice.name:
                try JuiceMakersStore.reduceStock(fruit: Fruit.pineapple.name, amount: FruitConsumption.pineappleInPineappleJuice)
            case Juice.strawberryBananaJuice.name:
                try JuiceMakersStore.reduceStock(fruit: Fruit.strawberry.name, amount: FruitConsumption.strawberryInStrawberryBananaJuice)
                try JuiceMakersStore.reduceStock(fruit: Fruit.banana.name, amount: FruitConsumption.bananaInStrawberryBananaJuice)
            case Juice.mangoJuice.name:
                try JuiceMakersStore.reduceStock(fruit: Fruit.mango.name, amount: FruitConsumption.mangoInMangoJuice)
            case Juice.mangoKiwiJuice.name:
                try JuiceMakersStore.reduceStock(fruit: Fruit.mango.name, amount: FruitConsumption.mangoInMangoKiwiJuice)
                try JuiceMakersStore.reduceStock(fruit: Fruit.kiwi.name, amount: FruitConsumption.kiwiInMangoKiwiJuice)
            default:
                print("만들 수 없는 주스입니다")
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
