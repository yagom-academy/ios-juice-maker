//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by momo on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
    func test_재고가_10개씩일때_바나나쥬스를_주문하면_바나나_재고가_8개된다() {
        
        // given
        let juice = JuiceMaker.Juice.bananaJuice
        let fruit = FruitStore.Fruit.banana
        let storeHavingTenEach = FruitStore(everyStock: Quantity(10))
        var sut = JuiceMaker(fruitStore: storeHavingTenEach)
        
        // when
        _ = try? sut.order(juice)
        let expected = Quantity(8)
        
        // then
        XCTAssertEqual(sut.stock(of: fruit), expected)
        
    }
    
    func test_재고가_1개씩일때_바나나쥬스를_주문하면_에러를_던진다() {
        
        // given
        let juiceToOrder = JuiceMaker.Juice.bananaJuice
        let storeHavingTenEach = FruitStore(everyStock: Quantity(1))
        var sut = JuiceMaker(fruitStore: storeHavingTenEach)
        
        // when, then
        XCTAssertThrowsError(try sut.order(juiceToOrder)) { error in
            XCTAssertEqual(
                error as? JuiceManufacturerError,
                JuiceManufacturerError.soldOut
            )
        }
        
    }
}
