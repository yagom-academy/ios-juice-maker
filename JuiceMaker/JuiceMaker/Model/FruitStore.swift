//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruits: [String: Int] = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위":10, "망고": 10]
    
    func inputFruit() {
        print("과일을 입력해주세요: ", terminator: "")
        var fruit: String = readLine()
        
        guard let fruits[fruit]
    }
    func addFruit(_ fruit: String) {
        
    }
}

