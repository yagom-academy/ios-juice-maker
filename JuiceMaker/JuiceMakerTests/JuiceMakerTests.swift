//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by Derrick kim on 2022/05/10.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
    var sut: JuiceMaker!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = JuiceMaker()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_딸기쥬스를_만들때_재고가_없는경우_실패를_반환한다() {
        // given
        let strawberryJuice = Drink(juice: .strawberryJuice)
        let expectation = StockError.notEnoughIngredient
        
        // when
        let result = sut.make(strawberryJuice)
        // then
        switch result {
        case .success(let juice):
            break
        case .failure(let error):
            XCTAssertEqual(error, expectation)
        }
    }
    
    func test_바나나쥬스를_만들때_재고가_있을경우_바나나쥬스를_반환한다() {
        // given
        let bananaJuice = Drink(juice: .bananaJuice)
        let expectation = JuiceType.bananaJuice
        
        // when
        let result = sut.make(bananaJuice)
        
        // then
        switch result {
        case .success(let juice):
            XCTAssertEqual(juice, expectation)
        case .failure(let error):
            break
        }
    }
    
    func test_파인애플의_재고_초기값_10이_반환된다() {
        // given
        let pineapple = Fruit.pineapple
        let expectation = 10
        
        // when
        let result = sut.count(pineapple)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_바나나에_수량_15개로_변경했을때_재고량이_15개_반환된다() {
        // given
        let expectation = 15
        
        // when
        sut.editStock(of: .banana, with: 15)
        let result = sut.count(.banana)
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_모든_과일과_재고량을_반환한다() {
        // given
        let expectation: FruitStock = [.strawberry: 10, .banana: 10, .pineapple: 10, .mango: 10, .kiwi: 10]
        
        // when
        let result = sut.stockUp()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
