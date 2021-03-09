//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 

enum AppError: Error {
    case outOfStock
    case unknownError
}
enum FruitType {
    static let strawberry = Fruit()
    static let banana = Fruit()
    static let kiwi = Fruit()
    static let pineapple = Fruit()
    static let mango = Fruit()
}

enum JuiceType {
    static let strawberryJuice = Juice()
    static let bananaJuice = Juice()
    static let kiwiJuice = Juice()
    static let pineappleJuice = Juice()
    static let strawberryBananaJuice = Juice()
    static let mangoJuice = Juice()
    static let mangoKiwiJuice = Juice()
}

/// 과일재고를 확인할 수 있습니다.
class Fruit {
    private(set) var fruitStock = 32
    func addStock() {
        fruitStock += 1
    }
    func useStock(amount: Int) {
        fruitStock -= amount
    }
}


class Juice {
    

    func makeJuice(amount: Int) {
        
    }
    
    func makeStrawberryJuice() throws {
        let requiredAmount: Int = 16
        if FruitType.strawberry.fruitStock > requiredAmount || FruitType.strawberry.fruitStock == requiredAmount {
            FruitType.strawberry.useStock(amount: requiredAmount)
        }
        else {
            throw AppError.outOfStock
        }
    }
    
    func makeBananaJuice() throws {
        let requiredAmount: Int = 2
        if FruitType.banana.fruitStock > requiredAmount || FruitType.banana.fruitStock == requiredAmount {
            FruitType.banana.useStock(amount: requiredAmount)
        }
        else {
            throw AppError.outOfStock
        }
    }
    
    func makeKiwiJuice() {
        
    }
    
    func makeStrawberryBananaJuice() {
        
    }
    
    func makeMangoJuice() {
        
    }
    
    func makeMangoKiwiJuice() {
        
    }

}

let juiceMaker: Juice = Juice()
