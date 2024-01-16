//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu: Int {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(menuNumber: Int) {
        switch menuNumber {
        case 0: // 딸기
            fruitStore.changeCount(fruitName: "딸기", usedCount: 16)
        case 1: // 바나나
            fruitStore.changeCount(fruitName: "바나나", usedCount: 2)
        case 2: // 키위
            fruitStore.changeCount(fruitName: "키위", usedCount: 3)
        case 3: // 파인애플
            fruitStore.changeCount(fruitName: "파인애플", usedCount: 2)
        case 4: // 딸바
            fruitStore.changeCount(fruitName: "딸기", usedCount: 10)
            fruitStore.changeCount(fruitName: "바나나", usedCount: 1)
        case 5: // 망고
            fruitStore.changeCount(fruitName: "망고", usedCount: 3)
        case 6: // 망고키위
            fruitStore.changeCount(fruitName: "망고", usedCount: 2)
            fruitStore.changeCount(fruitName: "키위", usedCount: 1)
        default:
            print("판매하는 과일쥬스의 종류가 아닙니다.")
        }
    }
}
