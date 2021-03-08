//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


/// 쥬스 메이커 타입 
class Fruit {
    var fruitCount: Int = 10
}

class Juice {
    var juiceRecipe: [String: Int] = [:]
}

class JuiceMaker {
    var fruitNames: [String] = ["딸기", "바나나", "파인애플", "키위", "망고"]
    var juiceNames: [String] = ["딸기쥬스", "바나나쥬스", "키위쥬스", "파인애플쥬스", "딸바쥬스", "망고쥬스", "망고키위쥬스"]
    
    
    func activeJuiceMaker() {
        var fruits = makeBasicFruits(Names: fruitNames)
        var juices = makeBaisicJuices(Names: juiceNames)

        juices["딸기쥬스"]?.juiceRecipe = ["딸기": 16]
        juices["바나나쥬스"]?.juiceRecipe = ["바나나": 2]
        juices["키위쥬스"]?.juiceRecipe = ["키위": 3]
        juices["파인애플쥬스"]?.juiceRecipe = ["파인애플": 2]
        juices["딸바쥬스"]?.juiceRecipe = ["딸기": 10, "바나나": 1]
        juices["망고쥬스"]?.juiceRecipe = ["망고": 3]
        juices["망고키위쥬스"]?.juiceRecipe = ["망고": 2, "키위": 1]
    
        
        makejuice(juiceName: "딸기쥬스", juiceList: juices, fruitList: fruits)
        print(readFruitInventory(name: "딸기", fruitList: fruits))

    }
    
    func readFruitInventory(name: String, fruitList: [String: Fruit]) -> Int {
        var result: Int = 0
        if let count = fruitList[name]?.fruitCount {
            result = count
        }
        
        return result
    }
    
    func readJuiceRecipe(name: String, juiceList: [String: Juice]) -> [String: Int] {
        var result: [String: Int] = [:]
 
        if let recipe: [String: Int] = juiceList[name]?.juiceRecipe {
            result = recipe
        } else {
            print("옵셔널 실패")
        }
        
        return result
    }
    
    func makejuice(juiceName: String, juiceList: [String: Juice], fruitList: [String: Fruit]) {
        var needFruit: String = ""
        var needFruitCount: Int = 0
        
        if let recipe = juiceList[juiceName]?.juiceRecipe {
            for (key, value) in recipe {
                needFruit = key
                needFruitCount = value
                
                if let count = fruitList[key]?.fruitCount {
                    fruitList[key]?.fruitCount -= needFruitCount
                }
            }
        }
        
    }
    
    func makeBasicFruits(Names: [String]) -> [String: Fruit] {
        var basicFruits: [String: Fruit] = [:]
        
        for element in Names {
            let fruit = Fruit()
            basicFruits[element] = fruit
        }
        
        return basicFruits
    }
    
    func makeBaisicJuices(Names: [String]) -> [String: Juice] {
        var basicJuices: [String: Juice] = [:]
        
        for element in Names {
            let juice = Juice()
            juice.juiceRecipe = [:]
            
            basicJuices[element] = juice
        }
        
        return basicJuices
    }
    
}
