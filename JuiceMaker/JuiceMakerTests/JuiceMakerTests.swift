//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 추니 & Davy.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {

    let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    func test_과일재고가_있는_경우_원하는_쥬스가_만들어진다() {
        let input = Juice.kiwiJuice
        let result = juiceMaker.makeJuice(type: input)
        
        XCTAssertTrue(result.isSuccess)
    }
    
    func test_과일재고가_부족한_경우_실패한다() {
        let input = Juice.strawberryJuice
        let result = juiceMaker.makeJuice(type: input)
        
        XCTAssertFalse(result.isSuccess)
    }

    func test_두가지_과일이_필요할_때_과일재고가_있는_경우_원하는_쥬스가_만들어진다() {
        let input = Juice.strawberryBananaJuice
        let result = juiceMaker.makeJuice(type: input)
        
        XCTAssertTrue(result.isSuccess)
    }
}
