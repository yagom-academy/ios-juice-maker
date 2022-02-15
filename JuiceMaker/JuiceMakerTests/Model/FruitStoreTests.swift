//
//  FruitStoreTests.swift
//  JuiceMakerTests
//
//  Created by momo on 2022/02/15.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {
    
    private var sut: FruitStore!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FruitStore()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_과일의_초기_재고는_10개이다() {
        // when
        let strawberryStock = sut.getStock(of: .strawberry)
        let bananaStock = sut.getStock(of: .banana)
        let pineappleStock = sut.getStock(of: .pineapple)
        let kiwiStock = sut.getStock(of: .kiwi)
        let mangoStock = sut.getStock(of: .mango)
        let expectedStock = 10
        
        // then
        XCTAssertEqual(strawberryStock, expectedStock)
        XCTAssertEqual(bananaStock, expectedStock)
        XCTAssertEqual(pineappleStock, expectedStock)
        XCTAssertEqual(kiwiStock, expectedStock)
        XCTAssertEqual(mangoStock, expectedStock)
    }
    
}
