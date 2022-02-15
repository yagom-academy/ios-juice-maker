//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by momo on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
    
    private var sut: JuiceMaker!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = JuiceMaker()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_쥬스를_만들_수_있다() {
        // given
        let juice = JuiceMaker.Juice.bananaJuice
        
        // when then
        XCTAssertNoThrow(try sut.make(of: juice))
    }
    
    func test_쥬스의_재고가_없을_경우_실패한다() {
        // given
        let juice = JuiceMaker.Juice.strawberryJuice
        
        // when then
        XCTAssertThrowsError(try sut.make(of: juice))
    }

}
