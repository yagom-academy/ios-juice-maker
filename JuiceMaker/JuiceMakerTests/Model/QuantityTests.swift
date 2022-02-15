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
        let expected: Quantity = Quantity(1)
        
        // when
        let actual: Quantity = Quantity(positive)
        
        // then
        XCTAssertEqual(actual, expected)
    }
    
    func test_0으로_생성이_가능하다() {
        // given
        let zero: Int = 0
        let expected: Quantity = Quantity(0)
        
        // when
        let actual: Quantity = Quantity(zero)
        
        // then
        XCTAssertEqual(actual, expected)
    }
    
    func test_음수로_생성_시도할_경우_0으로_초기화되어_생성된다() {
        // given
        let negative: Int = -1
        let expected: Quantity = Quantity(0)
        
        // when
        let actual: Quantity = Quantity(negative)
        
        // then
        XCTAssertEqual(actual, expected)
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
    
    func test_빼기_연산자를_통해_양수_결과값의_연산이_가능하다() {
        // given
        let first: Quantity = Quantity(3)
        let second: Quantity = Quantity(1)
        let expected: Quantity = Quantity(2)
        
        // when
        do {
            let actual = try first - second
            // then
            XCTAssertEqual(actual, expected)
        } catch {
            // then
            XCTFail()
        }
    }
    
    func test_빼기_연산자를_통해_음수_결과값의_경우_오류가_발생한다() {
        // given
        let first: Quantity = Quantity(1)
        let second: Quantity = Quantity(3)
        
        // when then
        XCTAssertThrowsError(try first - second)
    }
    
    func test_크기비교_연산자를_통해_비교할_수_있다() {
        // given
        let bigger = Quantity(3)
        let smaller = Quantity(1)
        
        // when then
        XCTAssertTrue(bigger > smaller)
        XCTAssertTrue(smaller < bigger)
        XCTAssertFalse(bigger < smaller)
        XCTAssertFalse(smaller > bigger)
    }
    
}
