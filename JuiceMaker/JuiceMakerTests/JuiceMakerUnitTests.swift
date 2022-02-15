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
        let expectation: Int = 0
        let inputJuice: Juice = .strawberryJuice
        self.fruitStore?.increase(fruit: .strawberry, to: 6)
        
        // when
        try? self.juiceMaker?.makeJuice(inputJuice)
        let result: Int = self.fruitStore?.fruits[.strawberry, default: 0] ?? 0
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
