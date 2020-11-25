//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
struct JuiceMaker {
    var fruitsContainer = [Fruit]()
    var fruitProductNumberContainer = [String : Int]()
    
    private var strawberry = Fruit(name: "strawberry", productNumber: 0)
    private var banana = Fruit(name: "banana", productNumber: 1)
    private var pineapple = Fruit(name: "pineapple", productNumber: 2)
    private var kiwi = Fruit(name: "kiwi", productNumber: 3)
    private var mango = Fruit(name: "mango", productNumber: 4)
    
    init() {
        
        let initialStock = 10
        
        addStock(amount: initialStock, of: strawberry)
        addStock(amount: initialStock, of: banana)
        addStock(amount: initialStock, of: pineapple)
        addStock(amount: initialStock, of: kiwi)
        addStock(amount: initialStock, of: mango)
        
        fruitsContainer.append(strawberry)
        fruitsContainer.append(banana)
        fruitsContainer.append(pineapple)
        fruitsContainer.append(kiwi)
        fruitsContainer.append(mango)
        
        for fruit in fruitsContainer {
            fruitProductNumberContainer[fruit.name] = fruit.productNumber
        }
    }
    
    mutating func addStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(adding: amount)
    }
    
    mutating func reduceStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(reducing: amount)
    }
    
    func checkStockAmount(of fruitType: Fruit) -> Int {
        return fruitType.stockAmount()
    }
    
    mutating func makeJuice(of order: JuiceMenu, with requiredFruits: [String: Int] ) {
        switch order {
        case .strawberryJuice:
            if let requiredStrawberry = requiredFruits["strawberry"] {
                reduceStock(amount: requiredStrawberry, of: strawberry)
            }
        case .bananaJuice:
            if let requiredBanana = requiredFruits["banana"] {
                reduceStock(amount: requiredBanana, of: banana)
            }
        case .ddalbaJuice:
            if let requiredStrawberry = requiredFruits["strawberry"],
               let requiredBanana = requiredFruits["banana"] {
                reduceStock(amount: requiredStrawberry, of: strawberry)
                reduceStock(amount: requiredBanana, of: banana)
            }
        case .mangoJuice:
            if let requiredMango = requiredFruits["mango"] {
                reduceStock(amount: requiredMango, of: mango)
            }
        case .mangoKiwiJuice:
            if let requiredMango = requiredFruits["mango"],
               let requiredKiwi = requiredFruits["kiwi"] {
                reduceStock(amount: requiredMango, of: mango)
                reduceStock(amount: requiredKiwi, of: kiwi)
            }
        case .kiwiJuice:
            if let requiredKiwi = requiredFruits["kiwi"] {
                reduceStock(amount: requiredKiwi, of: kiwi)
            }
        case .pineappleJuice:
            if let requiredPineapple = requiredFruits["pineapple"] {
                reduceStock(amount: requiredPineapple, of: pineapple)
            }
        }
    }
    
    func isAvailableMaking(juice: JuiceMenu, checking requiredFruits: [String : Int]) -> Bool {
        switch juice {
        case .strawberryJuice:
            guard let requiredStrawberry = requiredFruits["strawberry"] else {
                return false
            }
            
            guard checkStockAmount(of: strawberry) >= requiredStrawberry else {
                return false
            }
            
        case .bananaJuice:
            guard let requiredBanana = requiredFruits["banana"] else {
                return false
            }
            
            guard checkStockAmount(of: banana) >= requiredBanana else {
                return false
            }
            
        case .ddalbaJuice:
            guard let requiredStrawberry = requiredFruits["strawberry"],
                  let requiredBanana = requiredFruits["banana"] else {
                return false
            }
            
            guard checkStockAmount(of: strawberry) >= requiredStrawberry,
                  checkStockAmount(of: banana) >= requiredBanana else {
                return false
            }
            
        case .kiwiJuice:
            guard let requiredKiwi = requiredFruits["kiwi"] else {
                return false
            }
            
            guard checkStockAmount(of: kiwi) >= requiredKiwi else {
                return false
            }
            
        case .mangoJuice:
            guard let requiredMango = requiredFruits["mango"] else {
                return false
            }
            
            guard checkStockAmount(of: mango) >= requiredMango else {
                return false
            }
            
        case .mangoKiwiJuice:
            guard let requiredMango = requiredFruits["mango"],
                  let requiredKiwi = requiredFruits["kiwi"] else {
                return false
            }
            
            guard checkStockAmount(of: mango) >= requiredMango,
                  checkStockAmount(of: kiwi) >= requiredKiwi else {
                return false
            }
            
        case .pineappleJuice:
            guard let requiredPineapple = requiredFruits["pineapple"] else {
                return false
            }
            
            guard checkStockAmount(of: pineapple) >= requiredPineapple else {
                return false
            }
            
        }
        return true
    }
}


