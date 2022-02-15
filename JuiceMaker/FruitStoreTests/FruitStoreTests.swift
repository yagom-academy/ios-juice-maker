//
//  FruitStoreTests.swift
//  FruitStoreTests
//
//  Created by Ryan-Son on 2022/02/15.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {

    private var sut: FruitStoreType?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FruitStore()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_인스턴스_생성_시_과일의_초기값은_10개이다() throws {
        let expectedCount = 10

        Fruit.allCases.forEach { fruit in
            XCTAssertEqual(sut?.count(of: fruit), expectedCount)
        }
    }
    
    func test_전달인자_없이_add를_수행하면_과일의_수량이_하나_증가한다() throws {
        let expectedCount = 11
        sut?.add(.strawberry, amount: 1)
        
        XCTAssertEqual(sut?.count(of: .strawberry) , expectedCount)
    }
    
    func test_전달인자_없이_consume을_수행하면_과일의_수량이_하나_감소한다() throws {
        let expectedCount = 9
        sut?.consume(.strawberry, amount: 1)
        
        XCTAssertEqual(sut?.count(of: .strawberry) , expectedCount)
    }

    func test_과일_종류_배열을_초기값을_가진_배열_형태로_변환할_수_있다() {
        let initialValue = 10
        var expected: Fruits = [:]
        Fruit.allCases.forEach { fruit in
            expected[fruit] = initialValue
        }
        
        let result = Fruit.allCases.toFruits(with: initialValue)

        XCTAssertEqual(result, expected)
    }
}
