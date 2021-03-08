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
    
    func makeFruitJuice(juiceName: String){
        switch juiceName {
        case "딸기 쥬스":
            if fruitStock.strawberry >= 16 {
                fruitStock.strawberry -= 16
            }
        case "바나나 쥬스":
            if fruitStock.banana >= 2 {
                fruitStock.banana -= 2
            }
        case "키위 쥬스":
            if fruitStock.kiwi >= 3 {
                fruitStock.kiwi -= 3
            }
        case "파인애플 쥬스":
            if fruitStock.pineapple >= 2 {
                fruitStock.pineapple -= 2
            }
        case "딸바 쥬스":
            if fruitStock.strawberry >= 10 && fruitStock.banana >= 1 {
                fruitStock.strawberry -= 10
                fruitStock.banana -= 1
            }
        case "망고 쥬스":
            if fruitStock.mango >= 3 {
                fruitStock.mango -= 3
            }
        case "망고키위 쥬스":
            if fruitStock.mango >= 2 && fruitStock.kiwi >= 1 {
                fruitStock.mango -= 2
                fruitStock.kiwi -= 1
            }
        default:
            print("잘못된 입력입니다.")
        }
    }
    
    func addFruit(fruitName: String , numberOfFruit: Int){
        switch fruitName {
        case "strawberry":
            fruitStock.strawberry += numberOfFruit
        case "banana":
            fruitStock.banana += numberOfFruit
        case "pineapple":
            fruitStock.pineapple += numberOfFruit
        case "kiwi":
            fruitStock.kiwi += numberOfFruit
        case "mango":
            fruitStock.mango += numberOfFruit
        default:
            print("잘못된 입력입니다.")
        }
    }
}
