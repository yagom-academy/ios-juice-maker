//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by Oh Donggeon on 2022/02/19.
//

import XCTest

class JuiceMakerTests: XCTestCase {
    
    private var sut: JuiceMaker?
    private let testValues: [Fruit:Int] = [.strawberry: 100,
                                         .pineapple: 100,
                                         .mango: 100,
                                         .kiwi: 100,
                                         .banana: 100]

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let manager = FruitStockManager(stocks: testValues)
        let fruitStore = FruitStore(manager: manager)
        
        sut = JuiceMaker(store: fruitStore)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_make_strawberry_juice_then_return_true() throws {
        let expected = true
        let actual = try? sut?.make(into: .strawberryJuice)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_make_mango_kiwi_juice_then_check_count_fruit_of_number() throws {
        let totalIngredientCount = Juice.mangoKiwiJuice.ingredients.reduce(0) { $0 + $1.count }
        let mangoStock = try XCTUnwrap(testValues[.mango])
        let kiwiStock = try XCTUnwrap(testValues[.kiwi])
        let expectedTotalRemainFruitCount = mangoStock + kiwiStock - totalIngredientCount
        
        XCTAssertNoThrow(try sut?.make(into: .mangoKiwiJuice))
        
        let remainMangoCount = try XCTUnwrap(sut?.checkCount(stock: .mango))
        let remainkiwiCount = try XCTUnwrap(sut?.checkCount(stock: .kiwi))
        let actualTotalRemainFruitCount = remainMangoCount + remainkiwiCount
        
        XCTAssertEqual(expectedTotalRemainFruitCount, actualTotalRemainFruitCount)
    }
}
