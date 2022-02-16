//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 추니 & Davy.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {

    let juiceMaker = JuiceMaker()
    
    func test_과일재고가_있는_경우_원하는_쥬스가_만들어진다() {
        let input = Juice.kiwiJuice
        let expectation = "성공"
        let result = juiceMaker.makeJuice(juice: input)
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_과일재고가_부족한_경우_실패한다() {
        let input = Juice.strawberryJuice
        let expectation = FruitError.outOfStock.description
        let result = juiceMaker.makeJuice(juice: input)
        
        XCTAssertEqual(expectation, result)
    }

    func test_두가지_과일이_필요할_때_과일재고가_있는_경우_원하는_쥬스가_만들어진다() {
        let input = Juice.strawberryBananaJuice
        let expectation = "성공"
        let result = juiceMaker.makeJuice(juice: input)
        
        XCTAssertEqual(expectation, result)
    }
}
