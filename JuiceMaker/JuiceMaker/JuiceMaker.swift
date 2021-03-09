//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Furits {
    case strawberry, banana, pineapple, kiwi, mango
}

struct Fruit {
    let whatFruit: Furits
    fileprivate var thisFruitAmount: Int
    init(whatFruit: Furits, thisFruitAmount: Int = 100) {
        self.whatFruit = whatFruit
        self.thisFruitAmount = thisFruitAmount
    }
}

protocol ReadOnlyJuiceMaker {
    var fruitStorage: [Furits:Fruit] { get }
}

class JuiceMaker: ReadOnlyJuiceMaker {
    var fruitStorage: [Furits : Fruit] = [.strawberry : Fruit(whatFruit: .strawberry),
                                          .banana : Fruit(whatFruit: .banana),
                                          .pineapple : Fruit(whatFruit: .pineapple),
                                          .kiwi : Fruit(whatFruit: .kiwi),
                                          .mango : Fruit(whatFruit: .mango)]
    
}
