//
//  JuiceMaker - JuiceMaker.swift
//  Created by Mene, Dragon. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let store = FruitStore(initialFruitCount: 10)

    func checkRecipe(of juice: Juice) -> [Fruit: Int] {
        switch juice {
        case .strawBerry:
            return [.strawBerry: 16]
        case .banana:
            return [.banana: 2]
        case .pineApple:
            return [.pineApple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        case .strawBerryBanana:
            return [.strawBerry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

//let dragon = JuiceMaker().makeRecipe(of: .strawBerry)

//JuiceMaker.swift 파일에 다음의 조건을 충족하는 JuiceMaker 타입을 정의합니다.
//FruitStore의 과일을 사용해 과일쥬스를 제조합니다.
//딸기쥬스 : 딸기 16개 소모
//바나나쥬스 : 바나나 2개 소모
//키위쥬스 : 키위 3개 소모
//파인애플 쥬스 : 파인애플 2개 소모
//딸바쥬스 : 딸기 10개 + 바나나 1개 소모
//망고 쥬스 : 망고 3개 소모
//망고키위 쥬스 : 망고 2개 + 키위 1개 소모
//과일의 재고가 부족하면 과일쥬스를 제조할 수 없습니다.
//JuiceMaker는 FruitStore를 소유하고 있습니다.
//이 외에 더 필요한 기능, 특성, 타입이 있으면 자유롭게 추가해도 좋습니다.
