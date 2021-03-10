//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct FruitInfo {
    let firstName: Fruit, firstCount: Int, secondName: Fruit?, secondCount: Int?
}

enum Juice {
    case strawberry, banana, pineapple, kiwi, mango, strawberryBanana, mangoKiwi
    var fruitCount : FruitInfo {
        switch self {
        case .strawberry:
            return FruitInfo(firstName:Fruit.strawberry, firstCount: 16, secondName: nil, secondCount: nil)
        case .banana:
            return FruitInfo(firstName:Fruit.banana, firstCount: 2, secondName: nil, secondCount: nil)
        case .pineapple:
            return FruitInfo(firstName:Fruit.pineapple, firstCount: 2, secondName: nil, secondCount: nil)
        case .kiwi:
            return FruitInfo(firstName:Fruit.kiwi, firstCount: 3, secondName: nil, secondCount: nil)
        case .mango:
            return FruitInfo(firstName:Fruit.mango, firstCount: 3, secondName: nil, secondCount: nil)
        case .strawberryBanana:
            return FruitInfo(firstName:Fruit.strawberry, firstCount: 10, secondName: Fruit.banana, secondCount: 1)
        case .mangoKiwi:
            return FruitInfo(firstName:Fruit.mango, firstCount: 2, secondName: Fruit.kiwi, secondCount: 1)
        default:
            break
        }
    }
}

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

/// 쥬스 메이커 타입 
class JuiceMaker {
    private var fruitStock : FruitInfo
    
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
        
        for index in 0...(currentStock.count-1) {
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
