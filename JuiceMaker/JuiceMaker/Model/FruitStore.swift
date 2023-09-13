//
//  JuiceMaker - FruitStore.swift
//  Created by uemu, Toy. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    private var fruitQuantity: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    private init() {}
    
    private func reduceFruitQuantity(in fruit: FruitStorage, with number: Int) {
        switch fruit {
        case .strawberry:
            strawberry -= number
            print("딸기 재고: \(strawberry)개")
        case .banana:
            banana -= number
            print("바나나 재고: \(banana)개")
        case .pineapple:
            pineapple -= number
            print("파인애플 재고: \(pineapple)개")
        case .kiwi:
            kiwi -= number
            print("키위 재고: \(kiwi)개")
        case .mango:
            mango -= number
            print("망고 재고: \(mango)개")
        }
    }
    
    private func checkQuantity(fruit: Int, check: FruitStorage, number: Int) {
        if fruit >= number {
            reduceFruitQuantity(in: check, with: number)
        } else {
            print("과일쥬스를 제조할 수 없습니다.")
        }
    }
    
    func branchHandler(fruit: FruitStorage, number: Int) {
        switch fruit {
        case .strawberry:
            checkQuantity(fruit: strawberry, check: fruit, number: number)
        case .banana:
            checkQuantity(fruit: banana, check: fruit, number: number)
        case .pineapple:
            checkQuantity(fruit: pineapple, check: fruit, number: number)
        case .kiwi:
            checkQuantity(fruit: kiwi, check: fruit, number: number)
        case .mango:
            checkQuantity(fruit: mango, check: fruit, number: number)
        }
    }
    
    func changeFruitQuantity(of quantity: Int, fruit: Fruit) {
        fruitQuantity.updateValue(quantity, forKey: fruit)
    }
}
