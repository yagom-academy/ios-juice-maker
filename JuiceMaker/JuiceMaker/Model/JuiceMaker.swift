//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    var juiceName: JuiceName
    
    mutating func makeJuice(_ input: String) {
    
        do {
            try checkJuiceName(input)
        } catch FruitStoreError.invalidJuiceNameError {
            print("해당하는 주스가 없습니다.")
        } catch {
            print(error)
        }
                
        do {
            try fruitStore.checkFruitStock(self.juiceName)
            fruitStore.removeFruit(self.juiceName)
        } catch FruitStoreError.lackOfStockError {
            print("과일의 재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
        
    private mutating func checkJuiceName(_ name: String) throws {
        guard let juiceName = JuiceName(rawValue: name) else {
            throw FruitStoreError.invalidJuiceNameError
        }
        self.juiceName = juiceName
    }
}
