//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
	var name: String
	var count = 10
	
	init(fruitName name: String) {
		self.name = name
	}
    
    func setCount(amount number: Int){
        count += number
        
        if count < 0 {
            count = 0
        }
    }
    
    func getStatus() -> (String, Int) {
        return (name, count)
    }
}
