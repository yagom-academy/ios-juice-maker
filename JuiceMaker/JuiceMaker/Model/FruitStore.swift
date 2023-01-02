//
//  JuiceMaker - FruitStore.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var strawberry: Int = 10
    private var banana: Int = 10
    private var pineapple: Int = 10
    private var kiwi: Int = 10
    private var mango: Int = 10
    
    static let shared = FruitStore()
    private init() {}
    
    func useFruits(fruits: Fruit, count: Int) {
        do {
            try checkStock(fruit: fruits, count: count)
        } catch JuiceMakeError.invalidError {
            print(JuiceMakeError.invalidError.errorMessage)
        } catch JuiceMakeError.outOfStock {
            print(JuiceMakeError.outOfStock.errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        switch fruits {
        case .strawberry:
            strawberry -= count
        case .banana:
            banana -= count
        case .pineapple:
            pineapple -= count
        case .kiwi:
            kiwi -= count
        case .mango:
            mango -= count
        }
    }
    
    func buyFruits(fruits: Fruit, count: Int) {
        switch fruits {
        case .strawberry:
            strawberry += count
        case .banana:
            banana += count
        case .pineapple:
            pineapple += count
        case .kiwi:
            kiwi += count
        case .mango:
            mango += count
        }
    }
    
    private func checkStock(fruit: Fruit, count: Int) throws {
        guard count > 0 else {
            throw JuiceMakeError.invalidError
        }
        
        switch fruit {
        case .strawberry:
            guard strawberry >= count else {
                throw JuiceMakeError.outOfStock
            }
        case .banana:
            guard banana >= count else {
                throw JuiceMakeError.outOfStock
            }
        case .pineapple:
            guard pineapple >= count else {
                throw JuiceMakeError.outOfStock
            }
        case .kiwi:
            guard kiwi >= count else {
                throw JuiceMakeError.outOfStock
            }
        case .mango:
            guard mango >= count else {
                throw JuiceMakeError.outOfStock
            }
        }
    }
}
