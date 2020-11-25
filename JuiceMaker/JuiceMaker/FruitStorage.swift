//
//  FruitStorage.swift
//  JuiceMaker
//
//  Created by Kyungmin Lee on 2020/11/21.
//

import Foundation

// enum 타입으로 과일 종류 선언
// - 케이스를 배열 인덱스로 참조하기위해 rawValue를 Int로 선언
// - 케이스 갯수 카운팅하기 위해 CaseIterable 프로토콜 적용
enum Fruit: Int, CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

// 과일 재고 관리 역할만 하기
// - 수량 확인
// - 수량 설정
// - 수량 더하기
// - 수량 빼기
class FruitStorage {
    // Fruit의 케이스 갯수만큼만 배열의 크기 설정
    private var fruitStocks: [UInt] = Array(repeating: 0, count: Fruit.allCases.count)
   
    func countStock(of fruit: Fruit) -> UInt {
        return fruitStocks[fruit.rawValue]
    }
    
    func setStock(of fruit: Fruit, count: UInt) {
        fruitStocks[fruit.rawValue] = count
    }
    
    func addStock(of fruit: Fruit, count: UInt) {
        fruitStocks[fruit.rawValue] += count
    }
    
    /// 재고 수량 빼기
    /// - Returns: 원하는 수량 만큼 뺄 수 있으면 빼고 true 반환, 없으면 빼지 않고 false 반환
    func subtractStock(of fruit: Fruit, count: UInt) -> Bool {
        guard Int(fruitStocks[fruit.rawValue]) - Int(count) >= 0 else {
            return false
        }
        
        fruitStocks[fruit.rawValue] -= count
        return true
    }
}
