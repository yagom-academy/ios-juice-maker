//
//  JuiceMakerTests.swift
//  FruitStoreTests
//
//  Created by Derrick kim on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
    
    private var sut: JuiceMakeable?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let fruitStore: FruitStorable = FruitStore(initialValue: 0)
        sut = JuiceMaker(fruitStore: fruitStore)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_과일_재고를_설정한다() {
        sut?.setAmount(for: .pineapple, to: 3)

        XCTAssertEqual(sut?.count(of: .pineapple), 3)
    }
    
    func test_쥬스를_주문하면_과일의_수량이_필요개수만큼_소모된다() {
        let initialFruitAmount = 10
        let expectedStrawberryCount = 0
        let expectedBananaCount = 9
        let expectedJuice: Juice = .strawberryBanana
        sut?.setAmount(for: .strawberry, to: initialFruitAmount)
        sut?.setAmount(for: .banana, to: initialFruitAmount)

        guard let result = sut?.make(juice: expectedJuice) else {
            XCTFail("SUT 인스턴스가 존재하지 않습니다.")
            return
        }

        switch result {
        case .success(let juice):
            XCTAssertEqual(juice, expectedJuice)
            XCTAssertEqual(sut?.count(of: .strawberry), expectedStrawberryCount)
            XCTAssertEqual(sut?.count(of: .banana), expectedBananaCount)
        case .failure(let error):
            XCTFail("에러 발생 Error: \(error)")
        }
    }

    func test_쥬스_주문_시_과일_수량이_필요량_보다_모자라면_주문에_실패한다() {
        let initialFruitCount = 0
        let expectedError: JuiceMakerError = .notEnoughIngredients

        guard let result = sut?.make(juice: .strawberryBanana) else {
            XCTFail("SUT 인스턴스가 존재하지 않습니다.")
            return
        }

        switch result {
        case .success(_):
            XCTFail("쥬스 주문이 의도치 않게 성공하였습니다.")
        case .failure(let error):
            XCTAssertEqual(sut?.count(of: .strawberry), initialFruitCount)
            XCTAssertEqual(sut?.count(of: .banana), initialFruitCount)
            XCTAssertEqual(error as JuiceMakerError, expectedError)
        }
    }
}
