//
//  JuiceMaker - JuiceMaker.swift
//  Created by stone, jpush.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func makeJuice(_ juice: Juice) {
        do{
            switch juice {
            case .strawberry:
                try validFruitCount(Recipe.strawberry)
                fruitStore.changeCount(fruit: .strawberry, by: -16)
                print("딸기쥬스 완성")
            case .banana:
                try validFruitCount(Recipe.banana)
                fruitStore.changeCount(fruit: .banana, by: -2)
                print("바나나쥬스 완성")
            case .kiwi:
                try validFruitCount(Recipe.kiwi)
                fruitStore.changeCount(fruit: .kiwi, by: -3)
                print("키위쥬스 완성")
            case .pineapple:
                try validFruitCount(Recipe.pineapple)
                fruitStore.changeCount(fruit: .pineapple, by: -2)
                print("파인애플쥬스 완성")
            case .strawberryBanana:
                try validFruitCount(Recipe.strawberryBanana)
                fruitStore.changeCount(fruit: .strawberry, by: -10)
                fruitStore.changeCount(fruit: .banana, by: -1)
                print("딸바쥬스 완성")
            case .mango:
                try validFruitCount(Recipe.mango)
                fruitStore.changeCount(fruit: .mango, by: -3)
                print("망고쥬스 완성")
            case .mangoKiwi:
                try validFruitCount(Recipe.mangoKiwi)
                fruitStore.changeCount(fruit: .mango, by: -2)
                fruitStore.changeCount(fruit: .kiwi, by: -1)
                print("망고키위쥬스 완성")
            }
        } catch JuiceMakerError.fruitExistError {
            print("과일이 없습니다.")
        } catch JuiceMakerError.fruitCountError {
            print("과일의 수량이 부족합니다")
        } catch {
            print("쥬스생성 실패")
        }
    }
    
    func validFruitCount(_ fruits : [Fruit : Int]) throws {
        for (fruit, count) in fruits {
            guard let fruitCount = fruitStore.fetchFruitCount(fruit: fruit) else {
                throw JuiceMakerError.fruitExistError
            }
            if count > fruitCount { throw JuiceMakerError.fruitCountError }
        }
    }
}
