//
//  JuiceMakerUnitTests.swift
//  JuiceMakerTests
//
//  Created by 박형석 on 2022/02/15.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerUnitTests: XCTestCase {
    var fruitStore: FruitStore?
    var juiceMaker: JuiceMaker?

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.fruitStore = FruitStore()
        self.juiceMaker = JuiceMaker(fruitStore: self.fruitStore ?? FruitStore())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.fruitStore = nil
        self.juiceMaker = nil
    }
    
    func test_makeJuice_딸기쥬스_재조시_딸기재고소진_에러가발생한다() {
        // given
        let inputJuice: Juice = .strawberryJuice
        
        // then
        XCTAssertThrowsError(try juiceMaker?.makeJuice(inputJuice), "makeJuiice 재고 Error") { error in
            XCTAssertEqual(error as? JuiceMakerError, JuiceMakerError.outOfStock)
        }
    }

    func test_makeJuice_딸기가_16개일_때_딸기쥬스를_제조하고_나면_재고가_0개가_된다() {
        // given
        let expectation: Number = 0
        let inputJuice: Juice = .strawberryJuice
        let number: Number = 6
        try? self.fruitStore?.increase(fruit: .strawberry, to: number)
        
        // when
        _ = try? self.juiceMaker?.makeJuice(inputJuice)
        let result: Number = self.fruitStore?.fruits[.strawberry, default: 0] ?? 0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_makeJuice_딸바쥬스를_제조하고_나면_딸기재고_0개_바나나재고_9개가_된다() {
        // given
        let expectationStrawberry: Number = 0
        let expectationBanana: Number = 9
        let inputJuice: Juice = .strawberryBananaJuice
    
        // when
        _ = try? self.juiceMaker?.makeJuice(inputJuice)
        let resultStrawberry: Number = self.fruitStore?.fruits[.strawberry, default: 0] ?? 0
        let resultBanana: Number = self.fruitStore?.fruits[.banana, default: 0] ?? 0
        
        // then
        XCTAssertEqual(resultStrawberry, expectationStrawberry)
        XCTAssertEqual(resultBanana, expectationBanana)
    }
    
    func test_makeJuice_망고재고가_부족할_때_망고키위쥬스를_만들면_에러가_발생한다() {
        // given
        let inputJuice: Juice = .mangoKiwiJuice
        try? self.fruitStore?.decrease(fruit: .mango, to: 10)
        
        // when
        XCTAssertThrowsError(try juiceMaker?.makeJuice(inputJuice), "makeJuice 재고 Error") { error in
            // then
            XCTAssertEqual(error as? JuiceMakerError, JuiceMakerError.outOfStock)
        }
    }
}
