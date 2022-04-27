//
//  JuiceMaker - JuiceMaker.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func orderFruitJuice(of juice: Juice){
        do {
            try fruitStore.chooseRecipe(order: juice)
        } catch StockError.outOfError {
            print("재고부족")
        } catch {
            print(error)
        }
    }
}
