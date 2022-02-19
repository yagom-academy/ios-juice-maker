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
        let inputAmount: Number = 4
        let expectation: Number = 14
        
        // when
        try? fruitStore?.increase(fruit: inputFruit, to: inputAmount)
        let result: Number = fruitStore?.fruits[inputFruit] ?? Number()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_초기재고에서_딸기_6개를_빼면_4개가_나온다() {
        // given
        let inputFruit: Fruit = .strawberry
        let inputAmount: Number = 6
        let expectation: Number = 4
        
        // when
        try? fruitStore?.decrease(fruit: inputFruit, to: inputAmount)
        let result: Number = fruitStore?.fruits[inputFruit] ?? Number()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_decrease에_음수가_들어오면_재고에_변동이_없다() {
        // given
        let inputFruit: Fruit = .strawberry
        let inputAmount: Number = -3
        let expectation: NumberError = .isNegativeValue
        
        // when
        XCTAssertThrowsError(try fruitStore?.decrease(fruit: inputFruit, to: inputAmount), "Number increse Error") { error in
            // then
            XCTAssertEqual(expectation, error as? NumberError)
        }
    }
    
    func test_increase에_음수가_들어오면_재고에_변동이_없다() {
        // given
        let inputFruit: Fruit = .strawberry
        let inputAmount: Number = -21
        let expectation: NumberError = .isNegativeValue
        
        // when
        XCTAssertThrowsError(try fruitStore?.increase(fruit: inputFruit, to: inputAmount), "Number decrese Error") { error in
            // then
            XCTAssertEqual(expectation, error as? NumberError)
        }
        
    }
    
    func test_hasStock_초기재고에서_키위의_재고가_7개_이상_있다() {
        // given
        let inputFruit: Fruit = .kiwi
        let inputAmount: Number = 7
        
        // when
        guard let result: Bool = fruitStore?.hasStock(of: inputFruit, to: inputAmount) else {
            XCTFail("fruitStore is Nil")
            return
        }
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_changeStock_초기재고에서_망고의_재고를_3개로_바꿀_수_있다() {
        // given
        let inputFruit: Fruit = .mango
        let inputAmount: Number = 3
        let expectation: Number = 3
        
        // when
        self.fruitStore?.changeFruitStock(fruit: inputFruit, to: inputAmount)
        guard let result: Number = self.fruitStore?.fruits[inputFruit, default: 0] else {
            XCTFail("fruitStore is Nil")
            return
        }
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
