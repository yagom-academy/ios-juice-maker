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
    
    func test_딸기10개_바나나1개를_사용하면_딸기0개_바나나9개가_된다() {
        let strawberryExpectedNumber = 0
        let bananaExpectedNumber = 9
        fruitStore.useFruit(fruits: [.strawberry: 10, .banana: 1])
        let strawberryResult: Bool = fruitStore.stocks[.strawberry] == strawberryExpectedNumber
        let bananaResult: Bool = fruitStore.stocks[.banana] == bananaExpectedNumber
        XCTAssertTrue(strawberryResult && bananaResult)
    }
    
    func test_딸기수량이_부족한데_주스를_만들면_안됨() {
        fruitStore.useFruit(fruits: [.strawberry: 16])
        
        guard let strawberryCount = fruitStore.stocks[.strawberry] else {
            return
        }
        let isStrawberryIsExist: Bool = strawberryCount > 0
        XCTAssertTrue(isStrawberryIsExist)
    }
}
