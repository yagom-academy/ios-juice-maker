//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let juiceName = FruitStore()
    let recipe: Recipe
    
    func useFruits(selectedFruits: String) throws {
        for key in recipe.values.keys {
            guard let amount = recipe.values[key] else {
                throw
            }
            for _ in 0..<amount {
                juiceName.minus(selectedFruit: key)
            }
        }
        
//        if let amountFirst = recipe.values.first[key] {
//            for _ in 0..<amountFirst {
//                juiceName.minus(selectedFruit: selectedFruits)
//            }
//        }
//        if let amountSecond = recipe.values.second?[selectedFruits] {
//            for _ in 0..<amountSecond {
//                juiceName.minus(selectedFruit: selectedFruits)
//            }
//        }
    }
    
    func makeJuice(selectedJuice: String) {
        switch selectedJuice {
        case "딸기쥬스":
            for _ in 0..<16 {
                juiceName.minus(selectedFruit: "딸기")
            }
        case "바나나쥬스":
            for _ in 0..<2 {
                juiceName.minus(selectedFruit: "바나나")
            }
        case "키위쥬스":
            for _ in 0..<3 {
                juiceName.minus(selectedFruit: "키위")
            }
        case "파인애플쥬스":
            for _ in 0..<2 {
                juiceName.minus(selectedFruit: "파인애플")
            }
        case "딸바쥬스":
            for _ in 0..<10 {
                juiceName.minus(selectedFruit: "딸기")
            }
            juiceName.minus(selectedFruit: "바나나")
        case "망고쥬스":
            for _ in 0..<3 {
                juiceName.minus(selectedFruit: "망고")
            }
        case "망고키위쥬스":
            for _ in 0..<2 {
                juiceName.minus(selectedFruit: "망고")
            }
            juiceName.minus(selectedFruit: "키위")
        default:
            print("잘못된 선택입니다.")
        }
    }
}
