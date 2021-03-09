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

/// 과일재고를 확인할 수 있습니다.
class Fruit {
    private(set) var fruitStock = 10
    func addStock() {
        fruitStock += 1
    }
    func useStock(amount: Int) {
        fruitStock -= amount
    }
}

class JuiceMaker {

    func makeJuice() {
        
    }
    
    func makeStrawberryJuice() {
        
    }
    
    func makeBananaJuice() {
        
    }
    
    func makeKiwiJuice() {
        
    }
    
    func makeStrawberryBananaJuice() {
        
    }
    
    func makeMangoJuice() {
        
    }
    
    func makeMangoKiwiJuice() {
        
    }
    
    func addMoreFruit() {
        
    }
}
