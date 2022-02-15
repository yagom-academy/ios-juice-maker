//
//  FruitStoreTests.swift
//  JuiceMakerTests
//
//  Created by 이지원 on 2022/02/15.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {
    var fruitStore: FruitStore?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        fruitStore = FruitStore()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        fruitStore = nil
    }
    
    func test_초기재고에서_딸기4개를_더하면_14개가_나온다() {
        // given
        let inputFruit: Fruit = .strawberry
        let inputAmount: Int = 4
        let expectation: Int = 14
        
        // when
        fruitStore?.increase(fruit: inputFruit, to: inputAmount)
        let result: Int = fruitStore?.fruits[inputFruit] ?? 0
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_초기재고에서_딸기_6개를_빼면_4개가_나온다() {
        // given
        let inputFruit: Fruit = .strawberry
        let inputAmount: Int = 6
        let expectation: Int = 4
        
        // when
        fruitStore?.decrease(fruit: inputFruit, to: inputAmount)
        let result: Int = fruitStore?.fruits[inputFruit] ?? 0
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_decrease에_음수가_들어오면_재고에_변동이_없다() {
        // given
        let inputFruit: Fruit = .strawberry
        let inputAmount: Int = -3
        let expectation: Int = 10
        
        // when
        fruitStore?.decrease(fruit: inputFruit, to: inputAmount)
        let result: Int = fruitStore?.fruits[inputFruit] ?? 0
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_increase에_음수가_들어오면_재고에_변동이_없다() {
        // given
        let inputFruit: Fruit = .strawberry
        let inputAmount: Int = -21
        let expectation: Int = 10
        
        // when
        fruitStore?.increase(fruit: inputFruit, to: inputAmount)
        let result: Int = fruitStore?.fruits[inputFruit] ?? 0
        
        // then
        XCTAssertEqual(expectation, result)
    }
}
