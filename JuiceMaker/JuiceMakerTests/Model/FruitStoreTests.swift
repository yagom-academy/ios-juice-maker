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
        let expectedStock = Quantity(10)
        
        // then
        XCTAssertEqual(strawberryStock, expectedStock)
        XCTAssertEqual(bananaStock, expectedStock)
        XCTAssertEqual(pineappleStock, expectedStock)
        XCTAssertEqual(kiwiStock, expectedStock)
        XCTAssertEqual(mangoStock, expectedStock)
    }
    
    func test_과일의_재고를_추가할_수_있어야_한다() {
        // given
        let fruit = FruitStore.Fruit.strawberry
        let newStock = Quantity(5)
        let expected = Quantity(15)
        
        // when
        sut.increaseStock(of: fruit, newStock)
        let actual = sut.getStock(of: fruit)
        
        // then
        XCTAssertEqual(expected, actual)
    }
    
    func test_과일의_재고를_성공적으로_감소시킬_수_있어야_한다() {
        // given
        let fruit = FruitStore.Fruit.strawberry
        let toUse = Quantity(5)
        let expected = Quantity(5)
        
        // when
        do {
            try sut.decreaseStock(of: fruit, toUse)
            let actual = sut.getStock(of: fruit)
            // then
            XCTAssertEqual(expected, actual)
        } catch {
            // then
            XCTFail()
        }
    }
    
    func test_과일의_재고를_현재의_재고보다_많이_감소시키려고_하면_에러가_발생한다() {
        // given
        let fruit = FruitStore.Fruit.strawberry
        let toUse = sut.getStock(of: fruit) + Quantity(10)
        
        // when then
        XCTAssertThrowsError(try sut.decreaseStock(of: fruit, toUse))
    }
}
