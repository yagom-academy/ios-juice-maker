//
//  QuantityTests.swift
//  JuiceMakerTests
//
//  Created by momo on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class QuantityTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
    }
    
    func test_양수로_생성이_가능하다() {
        // given
        let positive: Int = 1
        let expected: Int = 1
        
        // when
        let quantity: Quantity = Quantity(positive)
        
        // then
        XCTAssertEqual(quantity.quantity, expected)
    }
    
    func test_0으로_생성이_가능하다() {
        // given
        let zero: Int = 0
        let expected: Int = 0
        
        // when
        let quantity: Quantity = Quantity(zero)
        
        // then
        XCTAssertEqual(quantity.quantity, expected)
    }
    
    func test_음수로_생성_시도할_경우_0으로_초기화되어_생성된다() {
        // given
        let negative: Int = -1
        let expected: Int = 0
        
        // when
        let quantity: Quantity = Quantity(negative)
        
        // then
        XCTAssertEqual(quantity.quantity, expected)
    }
    
    func test_더하기_연산자를_통한_연산이_가능하다() {
        // given
        let first: Quantity = Quantity(1)
        let second: Quantity = Quantity(2)
        let expected: Quantity = Quantity(3)
        
        // when
        let actual = first + second
        
        // then
        XCTAssertEqual(actual, expected)
    }
    
}
