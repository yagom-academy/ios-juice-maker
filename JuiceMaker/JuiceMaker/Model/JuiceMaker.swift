//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

struct JuiceMaker {
    
    func make(_ juiceType: Juice) {
    }
    
    private func checkFruit(_ juice: Juice) -> Result<Juice, BuyError> {
        
        return .success(juice)
    }
}

