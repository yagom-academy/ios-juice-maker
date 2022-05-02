//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    func makeJuice(juiceName: JuiceKind) throws {
        do{
            try fruitStore.subtractFruitAmount(juiceRecipe: juiceName.recipe)
        } catch ErrorCategory.zeroError {
            print("\(ErrorCategory.zeroError.message)")
        } catch ErrorCategory.cannotError {
            print("\(ErrorCategory.cannotError.message)")
        }
    }
    
    func fruitCount(fruitName: FruitKind) -> String{
        let fruitCount = fruitStore.returnStock()
        if let selectedFruitCount = fruitCount[fruitName] {
            return  String(selectedFruitCount)
        } else {
            return "0"
        }
    }
}
