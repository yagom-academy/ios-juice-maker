//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


/// 쥬스 메이커 타입 
class Fruit {
    var fruitName: String = ""
    var fruitCount: Int = 10
}

class Juice {
    var juiceName: String = ""
    var juiceRecipe: [String: Int] = [:]
}


class JuiceMaker {
    var fruitNames: [String] = ["딸기", "바나나", "파인애플", "키위", "망고"]
    var juiceNames: [String] = ["딸기쥬스", "바나나쥬스", "키위쥬스", "파인애플쥬스", "딸바쥬스", "망고쥬스", "망고키위쥬스"]
    
    func activeJuiceMaker() {
        var fruits = makeBasicFruits(Names: fruitNames)
        var juices = makeBaisicJuices(Names: juiceNames)
        
        if let name = fruits["딸기"]?.fruitName {
            print(name)
        }
        
        if let name = juices["딸기쥬스"]?.juiceName {
            print(name)
        }
        if let recipe = juices["바나나쥬스"]?.juiceRecipe {
            print(recipe)
        }
        
        juices["딸기쥬스"]?.juiceRecipe = ["딸기": 16]
        print(readJuiceRecipe(name: "딸기", juiceList: juices))
        
        makejuice(juiceName: "딸기", juiceList: juices, fruitList: fruits)
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
        if let recipe = juiceList[name]?.juiceRecipe {
            result = recipe
        }
        
        return result
    }
    
    func makejuice(juiceName: String, juiceList: [String: Juice], fruitList: [String: Fruit]) {
//        1. 쥬스 이름을 통해 juices 데이터 접근
//        2. 접근한 데이터를 통해 레시피를 파악
//        3. 파악한 레시피의 과일 재고 접근
//        4. 접근한 과일 재고와 레시피를 비교
//        5. 결과
        var needFruit: String = ""
        var needFruitCount: Int = 0
        
        if let recipe = juiceList[juiceName]?.juiceRecipe {
            for (key, value) in recipe {
                needFruit = key
                needFruitCount = value
                
                print(needFruit)
                print(needFruitCount)
                
                // 3. 레시피에 필요한 과일 재고에 접근
                if let count = fruitList[key]?.fruitCount {
                    // 4. 과일 재고를 레시피에 필요한 양 만큼 차감
                    fruitList[key]?.fruitCount -= needFruitCount
                    
                    print("과일 : \(key), 남은 수량 : \(count)")
                }
            }
        }
        
    }
    
    func makeBasicFruits(Names: [String]) -> [String: Fruit] {
        var basicFruits: [String: Fruit] = [:]
        
        for element in Names {
            let fruit = Fruit()
            fruit.fruitName = element
            
            basicFruits[element] = fruit
        }
        
        return basicFruits
    }
    
    func makeBaisicJuices(Names: [String]) -> [String: Juice] {
        var basicJuices: [String: Juice] = [:]
        
        for element in Names {
            let juice = Juice()
            juice.juiceName = element
            juice.juiceRecipe = [:]
            
            basicJuices[element] = juice
        }
        
        return basicJuices
    }
    
}

