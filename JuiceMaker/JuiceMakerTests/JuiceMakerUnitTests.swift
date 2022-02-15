//
//  JuiceMakerUnitTests.swift
//  JuiceMakerTests
//
//  Created by 박형석 on 2022/02/15.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerUnitTests: XCTestCase {
    
    var juiceMaker: JuiceMaker?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let fruitStore = FruitStore()
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
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


}
