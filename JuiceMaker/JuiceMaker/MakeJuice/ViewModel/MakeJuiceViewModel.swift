//
//  MakeJuiceViewModel.swift
//  JuiceMaker
//
//  Created by Dayeon Jung on 2022/02/17.
//

import Foundation

struct MakeJuiceViewModel {
    
    private var juiceMaker: JuiceMaker
    
    init(juiceMaker: JuiceMaker) {
        self.juiceMaker = juiceMaker
    }
    
    func stock(of fruit: FruitStore.Fruit) -> Quantity {
        return juiceMaker.stock(of: fruit)
    }
    
}
