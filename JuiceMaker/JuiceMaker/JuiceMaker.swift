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
    var fruitState : FruitInfo
    
    init(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        fruitState = FruitInfo(strawberry: strawberry, banana: banana, pineapple: pineapple, kiwi: kiwi, mango: mango)
    }
    
    var checkFruitInventory: FruitInfo {
        get {
            return fruitState
        }
    }
    
    func makeFruitJuice(juiceName: String){
        switch juiceName {
        case "딸기 쥬스":
            if fruitState.strawberry >= 16 {
                fruitState.strawberry -= 16
            }
        case "바나나 쥬스":
            if fruitState.banana >= 2 {
                fruitState.banana -= 2
            }
        case "키위 쥬스":
            if fruitState.kiwi >= 3 {
                fruitState.kiwi -= 3
            }
        case "파인애플 쥬스":
            if fruitState.pineapple >= 2 {
                fruitState.pineapple -= 2
            }
        case "딸바 쥬스":
            if fruitState.strawberry >= 10 && fruitState.banana >= 1 {
                fruitState.strawberry -= 10
                fruitState.banana -= 1
            }
        case "망고 쥬스":
            if fruitState.mango >= 3 {
                fruitState.mango -= 3
            }
        case "망고키위 쥬스":
            if fruitState.mango >= 2 && fruitState.kiwi >= 1 {
                fruitState.mango -= 2
                fruitState.kiwi -= 1
            }
        default:
            print("잘못된 입력입니다.")
        }
    }
    
    func addFruit(fruitName: String , numberOfFruit: Int){
        switch fruitName {
        case "strawberry":
            fruitState.strawberry += numberOfFruit
        case "banana":
            fruitState.banana += numberOfFruit
        case "pineapple":
            fruitState.pineapple += numberOfFruit
        case "kiwi":
            fruitState.kiwi += numberOfFruit
        case "mango":
            fruitState.mango += numberOfFruit
        default:
            print("잘못된 입력입니다.")
        }
    }
}
