//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func start(_ juiceName: String) {
        do {
            try makeJuice("딸기주스")
        } catch FruitStoreError.countError {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
    
    private func makeJuice(_ juiceName: String) throws {
        try checkFruitStock(juiceName)
        fruitStore.removeFruit(juiceName)
    }
    

}
