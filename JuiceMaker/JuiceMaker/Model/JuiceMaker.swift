//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    
    func makeJuice(_ juice: String) throws {
        
        switch juice {
        case "딸기쥬스":
            guard fruitStore.strawberryStock >= 16 else { throw InputError.stockError }
            let changeNumber = fruitStore.strawberryStock - 16
            try fruitStore.changeStock("딸기", to: changeNumber)
        case "바나나쥬스":
            guard fruitStore.bananaStock >= 2 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.bananaStock - 2
            try fruitStore.changeStock("바나나", to: changeFirstNumber)
        case "키위쥬스":
            guard fruitStore.kiwiStock >= 3 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.kiwiStock - 3
            try fruitStore.changeStock("키위", to: changeFirstNumber)
        case "파인애플쥬스":
            guard fruitStore.pineappleStock >= 2 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.pineappleStock - 2
            try fruitStore.changeStock("파인애플", to: changeFirstNumber)
        case "딸바쥬스":
            guard fruitStore.strawberryStock >= 10 && fruitStore.bananaStock >= 1 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.strawberryStock - 10
            try fruitStore.changeStock("딸기", to: changeFirstNumber)
            let changeSecondNumber = fruitStore.bananaStock - 1
            try fruitStore.changeStock("바나나", to: changeSecondNumber)
        case "망고쥬스":
            guard fruitStore.mangoStock >= 3 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.mangoStock - 3
            try fruitStore.changeStock("망고", to: changeFirstNumber)
        case "망고키위쥬스":
            guard fruitStore.mangoStock >= 2 && fruitStore.kiwiStock >= 1 else { throw InputError.stockError }
            let changeFirstNumber = fruitStore.mangoStock - 2
            try fruitStore.changeStock("망고", to: changeFirstNumber)
            let changeSecondNumber = fruitStore.kiwiStock - 1
            try fruitStore.changeStock("키위", to: changeSecondNumber)
        default:
            throw InputError.nameError
        }
    }
    
    func printError(_ juice: String) {
        do {
            try makeJuice(juice)
        } catch InputError.stockError {
            print("재고가 부족합니다.")
        } catch InputError.nameError {
            print("잘못된 이름입니다.")
        } catch {
            print("알수없는 오류")
        }
    }
}
