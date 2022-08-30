//
//  JuiceMaker - FruitStore.swift
//  Created by Mene, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var inventory: [Fruit: Int] = [:]
    
    init(initialFruitCount: Int) {
        Fruit.allCases.forEach {inventory[$0] = initialFruitCount}
    }
    
    func addToInventory (fruit: Fruit, amount: Int) {
        guard let fruitStock = inventory[fruit] else { return }
        inventory[fruit] = fruitStock + amount
    }
    
    func removeToInventory (fruit: Fruit, amount: Int) {
        guard let fruitStock = inventory[fruit] else { return }
        if fruitStock < amount {
            print("수량이 작습니다!")
            return
        } else {
            inventory[fruit] = fruitStock - amount
        }
    }
}

let store = FruitStore.init(initialFruitCount: 10)
let mene: () = store.removeToInventory(fruit: .strawBerry, amount: 10)
let test = store.inventory


//FruitStore는 다음의 조건을 충족해야 합니다.
//FruitStore가 관리하는 과일의 종류 : 딸기, 바나나, 파인애플, 키위, 망고
//각 과일의 초기 재고 : 10개
//각 과일의 수량 n개를 변경하는 기능이 있습니다.
//이 외에 더 필요한 기능, 특성, 타입이 있으면 자유롭게 추가해도 좋습니다.
