//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    enum FruitStoreError: String, LocalizedError {
        case inValidFruitChoice = "유효하지 않은 선택입니다."
        case lackOfStock = "재료가 부족합니다."
        
        var description: String {
            return rawValue
        }
    }
    
    struct FruitInformation {
//        var price: Int
        var count: Int
    }
    
    enum Fruit {
        case 딸기 // rawValue String?
        case 바나나
        case 파인애플
        case 키위
        case 망고
    }
    
    // 딕셔너리 (과일: 수량) - 수량 관리하는 메서드를 만들기 쉬울듯
    var inventory: [Fruit: FruitInformation] = [
        .딸기 : FruitInformation(count: 10),
        .바나나 : FruitInformation(count: 10),
        .파인애플 : FruitInformation(count: 10),
        .키위 : FruitInformation(count: 10),
        .망고 : FruitInformation(count: 10)]
}
