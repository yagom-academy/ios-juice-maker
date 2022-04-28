//
//  JuiceMaker - JuiceMaker.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore(defaultFruitStock: 10)
    
    func makeJuice(of juice: Juice){
        do {
            try fruitStore.chooseRecipe(order: juice)
        } catch StockError.outOfStock {
            print("재고부족")
        } catch {
            print(error)
        }
    }
}
