//
//  JuiceMakerTests.swift
//  FruitStoreTests
//
//  Created by Derrick kim on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
    
    private var sut: JuiceMaker?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = JuiceMaker(fruitStore: FruitStore())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_바나나쥬스를_주문하면_바나나의_수량이_필요개수만큼_소모된다() {
        let expected = 8
        sut?.make(.banana)
        let banana = sut?.fruitStore.count(of: .banana)
        
        XCTAssertEqual(banana, expected)
    }

}
