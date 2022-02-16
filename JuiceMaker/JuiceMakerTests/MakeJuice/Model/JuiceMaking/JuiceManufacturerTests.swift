//
//  JuiceManufacturer.swift
//  JuiceMakerTests
//
//  Created by Dayeon Jung on 2022/02/17.
//

import XCTest
@testable import JuiceMaker

class JuiceManufacturerTests: XCTestCase {

    func test_재고가_10개씩일때_바나나쥬스를_만들면_바나나_8개를_반환한다() {
        
        // given
        var sut = JuiceManufacturer(
            FruitStore(everyStock: Quantity(10))
        )
        let juice = JuiceMaker.Juice.bananaJuice
        let fruit = FruitStore.Fruit.banana
        
        // when
        let fruitStore = try? sut.make(of: juice)
        let expected = Quantity(8)
        
        // then
        XCTAssertEqual(fruitStore?.stock(of: fruit), expected)
    }
    
    func test_쥬스의_재고가_없을_경우_실패한다() {
        // given
        var sut = JuiceManufacturer(
            FruitStore(everyStock: Quantity(0))
        )
        let juice = JuiceMaker.Juice.strawberryJuice

        // when then
        XCTAssertThrowsError(try sut.make(of: juice)) { error in
            XCTAssertEqual(error as? JuiceManufacturerError, JuiceManufacturerError.soldOut)
        }
    }
    
}
