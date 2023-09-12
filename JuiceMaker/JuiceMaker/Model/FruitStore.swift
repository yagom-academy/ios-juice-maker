//
//  JuiceMaker - FruitStore.swift
//  Created by uemu, Toy. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    static let singleTon = FruitStore()
    private (set) var strawberry = 10
    private (set) var banana = 10
    private (set) var pineapple = 10
    private (set) var kiwi = 10
    private (set) var mango = 10
    
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
    
    func changedQuantity(fruit: FruitStorage, number: Int) {
        switch fruit {
        case .strawberry:
            strawberry = number
            print("딸기의 재고가 \(number)개로 변경되었습니다.")
        case .banana:
            banana = number
            print("바나나의 재고가 \(number)개로 변경되었습니다.")
        case .pineapple:
            pineapple = number
            print("파인애플의 재고가 \(number)개로 변경되었습니다.")
        case .kiwi:
            kiwi = number
            print("키위의 재고가 \(number)개로 변경되었습니다.")
        case .mango:
            mango = number
            print("망고의 재고가 \(number)개로 변경되었습니다.")
        }
    }
}
