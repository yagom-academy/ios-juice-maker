//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class JuiceMaker {
    let fruitStock: FruitStock = FruitStock(sameInitialStock: 20)
    
    func makeJuice(menu: JuiceMenu) {
        guard fruitStock.canMakeJuice(menu: menu) else {
            print("\(menu.rawValue)를 만들수 없습니다. 재고를 확인해 주세요.")
            //step2에서 alert표시 "재료가 모자라요. 재고를 수정할까요?"
            return
        }
        //step2에서 alert표시 "\(menu) 쥬스 나왔습니다! 맛있게 드세요!"
        print("\(menu.rawValue)가 나왔습니다! 맛있게 드세요!")
        fruitStock.useFruitStock(for: menu)
    }
}
