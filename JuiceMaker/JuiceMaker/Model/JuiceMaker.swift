//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

enum JuiceMenu {
    case recipe(FruitCategory,Int)
}

class JuiceMaker {
    var fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juiceMenu: [JuiceMenu]) {
        if fruitStore.checkSufficientStock(recipe: juiceMenu) {
            print("만들기 가능!")
        }
    }
}

//struct JuiceMaker {
//    let fruitStore = FruitStore()
//    mutating func makeJuice(juiceMenu: [JuiceMenu]) {
//        if fruitStore.checkSufficientStock(recipe: <#T##[JuiceMenu]#>) else {
//
//        }
//    }
//}
