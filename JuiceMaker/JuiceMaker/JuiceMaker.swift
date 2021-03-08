//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct FruitInfo {
    var strawberry: Int
    var banana: Int
    var pineapple: Int
    var kiwi: Int
    var mango: Int
}

enum Juice: String {
    case strawberry = "딸기 쥬스"
    case banana = "바나나 쥬스"
    case pineapple = "파인애플 쥬스"
    case kiwi = "키위 쥬스"
    case mango = "망고 쥬스"
    case strawberryBanana = "딸바 쥬스"
    case mangoKiwi = "망고키위 쥬스"
}

enum Fruit: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case pineapple = "pineapple"
    case kiwi = "kiwi"
    case mango = "mango"
}

/// 쥬스 메이커 타입 
class JuiceMaker {
    var fruitStock : FruitInfo
    
    init(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        fruitStock = FruitInfo(strawberry: strawberry, banana: banana, pineapple: pineapple, kiwi: kiwi, mango: mango)
    }
    
    var fruitInventory: FruitInfo {
        get {
            return fruitStock
        }
    }
    
    func makeFruitJuice(name: String) {
        var currentStock: [Int] = []
        var minimumNumber: [Int] = []
        switch name {
        case Juice.strawberry.rawValue:
            currentStock.append(fruitStock.strawberry)
            minimumNumber.append(16)
        case Juice.banana.rawValue:
            currentStock.append(fruitStock.banana)
            minimumNumber.append(2)
        case Juice.kiwi.rawValue:
            currentStock.append(fruitStock.kiwi)
            minimumNumber.append(3)
        case Juice.pineapple.rawValue:
            currentStock.append(fruitStock.pineapple)
            minimumNumber.append(2)
        case Juice.strawberryBanana.rawValue:
            currentStock.append(fruitStock.strawberry)
            minimumNumber.append(10)
            currentStock.append(fruitStock.banana)
            minimumNumber.append(1)
        case Juice.mango.rawValue:
            currentStock.append(fruitStock.mango)
            minimumNumber.append(3)
        case Juice.mangoKiwi.rawValue:
            currentStock.append(fruitStock.mango)
            minimumNumber.append(2)
            currentStock.append(fruitStock.kiwi)
            minimumNumber.append(1)
        default:
            break
        }
        
        for index in 0...currentStock.count {
            guard currentStock[index] > minimumNumber[index] else {
                return
            }
        }
        
        switch name {
        case Juice.strawberry.rawValue:
            fruitStock.strawberry -= 16
        case Juice.banana.rawValue:
            fruitStock.banana -= 2
        case Juice.kiwi.rawValue:
            fruitStock.kiwi -= 3
        case Juice.pineapple.rawValue:
            fruitStock.pineapple -= 2
        case Juice.strawberryBanana.rawValue:
            fruitStock.strawberry -= 10
            fruitStock.banana -= 1
        case Juice.mango.rawValue:
            fruitStock.mango -= 3
        case Juice.mangoKiwi.rawValue:
            fruitStock.mango -= 2
            fruitStock.kiwi -= 1
        default:
            break
        }
    }
    
    func addFruit(name: String , number: Int){
        switch name {
        case Fruit.strawberry.rawValue:
            fruitStock.strawberry += number
        case Fruit.banana.rawValue:
            fruitStock.banana += number
        case Fruit.pineapple.rawValue:
            fruitStock.pineapple += number
        case Fruit.kiwi.rawValue:
            fruitStock.kiwi += number
        case Fruit.mango.rawValue:
            fruitStock.mango += number
        default:
            break
        }
    }
}
