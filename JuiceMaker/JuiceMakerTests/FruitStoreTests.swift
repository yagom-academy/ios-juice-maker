//
//  FruitStoreTests.swift
//  JuiceMakerTests
//
//  Created by Oh Donggeon on 2022/02/19.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {
    
    private var sut: FruitStorable?
    private let testStocks: [Fruit:Int] = [.strawberry: 10,
                                          .pineapple: 10,
                                          .mango: 10,
                                          .kiwi: 10,
                                          .banana: 10]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let manager = FruitStockManager(stocks: testStocks)
        sut = FruitStore(manager: manager)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_use_kiwi_over_number_of_10_then_throw_not_enough_stock_error() throws {
        XCTAssertThrowsError(try sut?.use(.kiwi, to: Int.max))
    }
    
    func test_use_banana_out_of_stock_then_throw_out_of_stock_error() throws {
        sut?.change(.banana, to: Int.zero)
        XCTAssertThrowsError(try sut?.use(.banana, to: 10))
    }
    
    func test_change_pineapple_number_of_100() throws {
        let changeCount = 100
        let expectedCount = changeCount
        
        sut?.change(.pineapple, to: changeCount)
        
        let actualCount = sut?.checkCount(stock: .pineapple)
        XCTAssertEqual(expectedCount, actualCount)
    }
    
    func test_check_stock_banana_is_enough_stock_then_return_true() throws {
        let expected = true
        let actual = try? sut?.checkStock(.banana, as: Int.zero)
        XCTAssertEqual(expected, actual)
    }
    
    func test_check_stock_mango_is_not_enough_stock_then_throw_not_enough_error() throws {
        XCTAssertThrowsError(try sut?.checkStock(.mango, as: Int.max))
    }
    
    func test_check_count_strawberry_then_return_count() throws {
        let expectedCount = testStocks[.strawberry]
        let actualCount = sut?.checkCount(stock: .strawberry)
        XCTAssertEqual(expectedCount, actualCount)
    }
}
