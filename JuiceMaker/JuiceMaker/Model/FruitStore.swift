//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitsDictionary: [String: Int] = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func getUserInput() -> String {
        guard let userInput: String = readLine() else { return "" }
        
        return userInput
    }
    
    func inputFruit() -> String {
        print("과일을 입력해주세요: ", terminator: "")
        let fruit: String = getUserInput()
        guard let _ = fruitsDictionary[fruit] else { return "" }
        
        return fruit
    }
    
    func changeFruitsNumber() {
        let inputFruits = inputFruit()
        
        print("변경할 개수를 입력해주세요.: ", terminator: "")
        let userInput = getUserInput()
        guard let number = Int(userInput) else { return }
        fruitsDictionary[inputFruits] = number
    }
}

feat: changeFruitsNumber() 및 getUserInput() 함수 생성
