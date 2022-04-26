//
//  JuiceMaker - JuiceMaker.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    var JuiceMakersStore = FruitStore()
    
    func makeJuice(juice: String) {
        do {
            try checkStock(function: JuiceMakersStore.reduceStock(fruit:amount:), juice: juice)
        } catch (let error) {
            handleError(error)
        }
    }
    
    private func checkStock(function: (String, Int) throws -> Void, juice: String) rethrows {
        switch juice {
        case Juice.strawberryJuice.name:
            try function(Fruit.strawberry.name, FruitConsumption.strawberryInStrawberryJuice)
        case Juice.bananaJuice.name:
            try function(Fruit.banana.name, FruitConsumption.bananaInBananaJuice)
        case Juice.kiwiJuice.name:
            try function(Fruit.kiwi.name, FruitConsumption.kiwiInKiwiJuice)
        case Juice.pineappleJuice.name:
            try function(Fruit.pineapple.name, FruitConsumption.pineappleInPineappleJuice)
        case Juice.strawberryBananaJuice.name:
            try function(Fruit.strawberry.name, FruitConsumption.strawberryInStrawberryBananaJuice)
            try function(Fruit.banana.name, FruitConsumption.bananaInStrawberryBananaJuice)
        case Juice.mangoJuice.name:
            try function(Fruit.mango.name, FruitConsumption.mangoInMangoJuice)
        case Juice.mangoKiwiJuice.name:
            try function(Fruit.mango.name, FruitConsumption.mangoInMangoKiwiJuice)
            try function(Fruit.kiwi.name, FruitConsumption.kiwiInMangoKiwiJuice)
        default:
            print("만들 수 없는 주스입니다")
        }
    }
    
    private func handleError(_ error: Error) {
        switch error {
        case StockError.outOfStock:
            print(StockError.outOfStock.message)
        case StockError.invalidSelection:
            print(StockError.invalidSelection.message)
        default:
            print("알 수 없는 오류입니다")
        }
    }
}
