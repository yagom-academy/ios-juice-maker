//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 황제하 on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

private extension XCTestCase {
    func XCTSuccess() {
        XCTAssert(true)
    }
}

struct MockJuice: JuiceProtocol {
    var items: [FruitType : Int]
}

class JuiceMakerTests: XCTestCase {
    
    // MARK: - Test codes

    func test_인벤토리보다_적은과일쥬스를_만들었을때_성공을_반환하는가() {
        // given
        let fruitStore = FruitStore(initialFruitCount: 10)
        var juiceMaker = JuiceMaker(fruitStore: fruitStore)
        let input = MockJuice(items: [.banana: 5])
        
        // when
        let writeResult = juiceMaker.make(with: input)
 
        // then
        switch writeResult {
        case .success():
            XCTSuccess()
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_인벤토리보다_많은과일쥬스를_만들었을때_실패을_반환하는가() {
        // given
        let fruitStore = FruitStore(initialFruitCount: 10)
        var juiceMaker = JuiceMaker(fruitStore: fruitStore)
        let input = MockJuice(items: [.banana: 15])
        
        // when
        let writeResult = juiceMaker.make(with: input)
 
        // then
        switch writeResult {
        case .success():
            XCTFail()
        case .failure(_):
            XCTSuccess()
        }
    }
    
    func test_과일쥬스를_만들고_남은과일의_개수가_올바른가() {
        // given
        let fruitStore = FruitStore(initialFruitCount: 10)
        var juiceMaker = JuiceMaker(fruitStore: fruitStore)
        let input = MockJuice(items: [.banana: 5])
        let expected: FruitsInventory = [
            .strawberry: 10,
            .banana: 5,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]

        // when
        let writeResult = juiceMaker.make(with: input)
        
        // then
        switch writeResult {
        case .success():
            XCTAssertEqual(fruitStore.inventory, expected)
        case .failure(_):
            XCTFail()
        }
    }
}
