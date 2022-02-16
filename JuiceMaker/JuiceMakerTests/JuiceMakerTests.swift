//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 박예빈 on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
    let fruitStore: FruitStore = FruitStore()
    
    func test_바나나가_하나_추가되면_11() {
        let expectedNumber = 11
        fruitStore.add(numberOf: 1, fruit: Fruit.banana)
        let result = fruitStore.stocks[Fruit.banana]
        XCTAssertEqual(result, expectedNumber)
    }
}
