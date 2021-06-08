//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class FruitStore {
	private var name: String
	private var count = 10
	
	var status: (name: String, count: Int) {
		get {
			return (name, count)
		}
	}
	
	init(fruitName name: String) {
		self.name = name
	}
    
    func setCount(amount number: Int){
        count += number
        
        if count < 0 {
            count = 0
        }
    }
}
