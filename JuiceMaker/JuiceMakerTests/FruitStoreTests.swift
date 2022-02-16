//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by 최다빈 on 2022/02/16.
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
        try fruitStore.changeAmountOfFruit(fruits: [(Fruit.딸기, input)])
        } catch {}
        
        if let result = fruitStore.store[.딸기] {
            XCTAssertEqual(expectation, result)
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_성공하면_재고가_줄어든다() {
        let input = -5
        let expectation = 5
        
        do {
            try fruitStore.changeAmountOfFruit(fruits: [(Fruit.딸기, input), (Fruit.바나나,input)])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.딸기], let bananaAmout = fruitStore.store[.바나나] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_실패하면_재고가_유지된다() {
        let input = -20
        let expectation = 10
        
        do {
            try fruitStore.changeAmountOfFruit(fruits: [(Fruit.딸기, input), (Fruit.바나나,input)])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.딸기], let bananaAmout = fruitStore.store[.바나나] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_하나만_실패해도_재고가_유지된다() {
        let strawberryInput = -20
        let bananaInput = -3
        let expectation = 10
        
        do {
            try fruitStore.changeAmountOfFruit(fruits: [(Fruit.딸기, strawberryInput), (Fruit.바나나, bananaInput)])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.딸기], let bananaAmout = fruitStore.store[.바나나] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        }
    }
    
    func test_사용한_과일의_재고만_줄어든다() {
        let input = -5
        let expectation: [Fruit: Int] = [.딸기: 5, .바나나: 10, .파인애플: 10, .키위: 10, .망고: 10]
        
        do {
        try fruitStore.changeAmountOfFruit(fruits: [(Fruit.딸기, input)])
        } catch {}
        
        XCTAssertEqual(expectation, fruitStore.store)
    }
    
    func test_재고를_추가하면_재고가_늘어난다() {
        let input = 5
        let expectation = 15
        
        do {
        try fruitStore.changeAmountOfFruit(fruits: [(Fruit.딸기, input)])
        } catch {}
        
        if let result = fruitStore.store[.딸기] {
            XCTAssertEqual(expectation, result)
        }
    }
    
    func test_재고보다_많은양이_필요하면_에러가난다() {
        let input = -20
        
        XCTAssertThrowsError(try fruitStore.changeAmountOfFruit(fruits: [(Fruit.딸기, input)]))
    }
    
}
