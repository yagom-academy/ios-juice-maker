//
//  NumberUnitTests.swift
//  JuiceMakerTests
//
//  Created by 박형석 on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class NumberUnitTests: XCTestCase {
    
    // Number가 10일 때 increase를 하면 11이 된다.
    
    func test_Number_Number가_10일때_increase를_하면_11이된다() {
        // given
        var input: Number = Number()
        let expectation: Number = 11
        
        // when
        input.increase()
        
        // then
        XCTAssertEqual(expectation, input)
    }
    
    func test_Number_Number가_10일때_increase10를_하면_20이된다() {
        // given
        let input: Number = 10
        var number: Number = Number()
        let expectation: Number = 20
        
        // when
        try? number.increase(input)
        
        // then
        XCTAssertEqual(expectation, number)
    }
    
    func test_Number_Number가_10일때_increaseMinus1를_하면_Error가_발생한다() {
        // given
        let input: Number = -1
        var number: Number = Number()
        let expectation: NumberError = .isNegativeValue
        
        // when
        XCTAssertThrowsError(try number.increase(input), "Number increse Error") { error in
            // then
            XCTAssertEqual(expectation, error as? NumberError)
        }
    }
    
    func test_Number_Number가_10일때_decrease를_하면_9이된다() {
        // given
        var input: Number = Number()
        let expectation: Number = 9
        
        // when
        input.decrease()
        
        // then
        XCTAssertEqual(expectation, input)
    }
    
    func test_Number_Number가_10일때_decrease10를_하면_0이된다() {
        // given
        let input: Number = 10
        var number: Number = Number()
        let expectation: Number = 0
        
        // when
        try? number.decrease(input)
        
        // then
        XCTAssertEqual(expectation, number)
    }
    
    func test_Number_Number가_10일때_decreaseMinus1를_하면_Error가_발생한다() {
        // given
        let input: Number = -1
        var number: Number = Number()
        let expectation: NumberError = .isNegativeValue
        
        // when
        XCTAssertThrowsError(try number.decrease(input), "Number increse Error") { error in
            // then
            XCTAssertEqual(expectation, error as? NumberError)
        }
    }

}
