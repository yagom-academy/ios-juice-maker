//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 추니 & Davy.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {

    let fruitStore = FruitStore()
    
    func test_과일의_초기값은_10이다() {
        let expectation = 10
        
        fruitStore.store.forEach{ (fruit, amount) in
            XCTAssertEqual(expectation, amount)
        }
    }

    func test_주스를_만들면_재고가_줄어든다() {
        let input = -5
        let expectation = 5
        
        do {
            try fruitStore.changeAmountOfFruit(fruits: [(Fruit.strawberry, input)])
        } catch {}
        
        if let result = fruitStore.store[.strawberry] {
            XCTAssertEqual(expectation, result)
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_성공하면_재고가_줄어든다() {
        let input = -5
        let expectation = 5
        
        do {
            try fruitStore.changeAmountOfFruit(fruits: [(Fruit.strawberry, input), (Fruit.banana,input)])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.strawberry], let bananaAmout = fruitStore.store[.banana] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_실패하면_재고가_유지된다() {
        let input = -20
        let expectation = 10
        
        do {
            try fruitStore.changeAmountOfFruit(fruits: [(Fruit.strawberry, input), (Fruit.banana,input)])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.strawberry], let bananaAmout = fruitStore.store[.banana] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_하나만_실패해도_재고가_유지된다() {
        let strawberryInput = -20
        let bananaInput = -3
        let expectation = 10
        
        do {
            try fruitStore.changeAmountOfFruit(fruits: [(Fruit.strawberry, strawberryInput), (Fruit.banana, bananaInput)])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.strawberry], let bananaAmout = fruitStore.store[.banana] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        }
    }
    
    func test_사용한_과일의_재고만_줄어든다() {
        let input = -5
        let expectation: [Fruit: Int] = [.strawberry: 5, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
        
        do {
        try fruitStore.changeAmountOfFruit(fruits: [(Fruit.strawberry, input)])
        } catch {}
        
        XCTAssertEqual(expectation, fruitStore.store)
    }
    
    func test_재고를_추가하면_재고가_늘어난다() {
        let input = 5
        let expectation = 15
        
        do {
        try fruitStore.changeAmountOfFruit(fruits: [(Fruit.strawberry, input)])
        } catch {}
        
        if let result = fruitStore.store[.strawberry] {
            XCTAssertEqual(expectation, result)
        }
    }
    
    func test_재고보다_많은양이_필요하면_에러가난다() {
        let input = -20
        
        XCTAssertThrowsError(try fruitStore.changeAmountOfFruit(fruits: [(Fruit.strawberry, input)]))
    }
    
}
