//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// A structure that is in charge of making juice
struct JuiceMaker {
    
    /// A enum that handles available juice menu and their recipe
    /// at the moment.
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        /// A computed property to provide recipe
        /// of a specific juice menu
        var recipe: [Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoJuice:
                return [.mango: 3]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    /// The fruit store is initialized at the beginning of `self`
    var fruitStore: FruitStore
    
    // MARK: - Initialize
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    /// Make a juice if the ingredients are enough at `FruitStore`
    /// and delivers the whether making juice succeeded or failed
    /// to the subject of invoking the method by `handler`.
    func makeJuice(of juice: Juice, completion handler: ((JuiceMakerResult<FruitStoreError>) -> Void)) {
    }
    
}
