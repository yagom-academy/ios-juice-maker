//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
struct JuiceMaker {
    var fruitsContainer = [Fruit]()
    
    private var strawberry = Fruit(name: "strawberry")
    private var banana = Fruit(name: "banana")
    private var pineapple = Fruit(name: "pineapple")
    private var kiwi = Fruit(name: "kiwi")
    private var mango = Fruit(name: "mango")
    
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
            let requiredStrawberry = requiredFruits["strawberry"] ?? 0
            reduceStock(amount: requiredStrawberry, of: strawberry)
        case .bananaJuice:
            let requiredBanana = requiredFruits["banana"] ?? 0
            reduceStock(amount: requiredBanana, of: banana)
        case .ddalbaJuice:
            let requiredStrawberry = requiredFruits["strawberry"] ?? 0
            let requiredBanana = requiredFruits["banana"] ?? 0
            reduceStock(amount: requiredStrawberry, of: strawberry)
            reduceStock(amount: requiredBanana, of: banana)
        case .mangoJuice:
            let requiredMango = requiredFruits["mango"] ?? 0
            reduceStock(amount: requiredMango, of: mango)
        case .mangoKiwiJuice:
            let requiredMango = requiredFruits["mango"] ?? 0
            let requiredKiwi = requiredFruits["kiwi"] ?? 0
            reduceStock(amount: requiredMango, of: mango)
            reduceStock(amount: requiredKiwi, of: kiwi)
        case .kiwiJuice:
            let requiredKiwi = requiredFruits["kiwi"] ?? 0
            reduceStock(amount: requiredKiwi, of: kiwi)
        case .pineappleJuice:
            let requiredPineapple = requiredFruits["pineapple"] ?? 0
            reduceStock(amount: requiredPineapple, of: pineapple)
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


