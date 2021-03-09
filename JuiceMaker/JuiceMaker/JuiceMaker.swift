//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 

/// 과일재고를 확인할 수 있습니다.
class FruitType {
    var fruits: [String: Int]
        
    init(fruits: [String: Int]) {
        self.fruits = fruits
    }
    
    var strawberry: FruitType {
        get {
            return FruitType(fruits: ["딸기": 10])
        }
    }
    var banana: FruitType {
        get {
            return FruitType(fruits: ["바나나": 10])
        }
    }
    var kiwi: FruitType {
        get {
            return FruitType(fruits: ["키위": 10])
        }
    }
    var pineapple: FruitType {
        get {
            return FruitType(fruits: ["파인애플": 10])
        }
    }
    var mango: FruitType {
        get {
            return FruitType(fruits: ["망고": 10])
        }
    }
}
var test: FruitType = FruitType(fruits: ["바나나": 10])

class JuiceMaker {

    
    func confirmFruitsInStock() {
        
    }
    
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
