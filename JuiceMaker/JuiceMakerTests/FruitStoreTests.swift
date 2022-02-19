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
        let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: input)
        
        do {
            try fruitStore.changeAmountOfFruit([strawberryJuiceRecipe])
        } catch {}
        
        if let result = fruitStore.store[.strawberry] {
            XCTAssertEqual(expectation, result)
        } else {
            XCTAssertNil(fruitStore.store[.strawberry])
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_성공하면_재고가_줄어든다() {
        let input = -5
        let expectation = 5
        let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: input)
        let bananaJuiceRecipe = FruitAmountInformation(fruit: .banana, amount: input)
        
        do {
            try fruitStore.changeAmountOfFruit([strawberryJuiceRecipe, bananaJuiceRecipe])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.strawberry], let bananaAmout = fruitStore.store[.banana] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        } else {
            XCTAssertNil(fruitStore.store[.strawberry])
            XCTAssertNil(fruitStore.store[.banana])
        }
        
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_실패하면_재고가_유지된다() {
        let input = -20
        let expectation = 10
        let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: input)
        let bananaJuiceRecipe = FruitAmountInformation(fruit: .banana, amount: input)
        
        do {
            try fruitStore.changeAmountOfFruit([strawberryJuiceRecipe, bananaJuiceRecipe])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.strawberry], let bananaAmout = fruitStore.store[.banana] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        } else {
            XCTAssertNil(fruitStore.store[.strawberry])
            XCTAssertNil(fruitStore.store[.banana])
        }
    }
    
    func test_두가지_재료가_필요한_주스를_만들때_하나만_실패해도_재고가_유지된다() {
        let strawberryInput = -20
        let bananaInput = -3
        let expectation = 10
        let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: strawberryInput)
        let bananaJuiceRecipe = FruitAmountInformation(fruit: .banana, amount: bananaInput)
        
        do {
            try fruitStore.changeAmountOfFruit([strawberryJuiceRecipe, bananaJuiceRecipe])
        } catch {}
        
        if let strawberryAmount = fruitStore.store[.strawberry], let bananaAmout = fruitStore.store[.banana] {
            XCTAssertEqual(expectation, strawberryAmount)
            XCTAssertEqual(expectation, bananaAmout)
        } else {
            XCTAssertNil(fruitStore.store[.strawberry])
            XCTAssertNil(fruitStore.store[.banana])
        }
    }
    
    func test_사용한_과일의_재고만_줄어든다() {
        let input = -5
        let expectation: [Fruit: Int] = [.strawberry: 5, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
        let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: input)
        
        do {
        try fruitStore.changeAmountOfFruit([strawberryJuiceRecipe])
        } catch {}
        
        XCTAssertEqual(expectation, fruitStore.store)
    }
    
    func test_재고를_추가하면_재고가_늘어난다() {
        let input = 5
        let expectation = 15
        let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: input)
        
        do {
            try fruitStore.changeAmountOfFruit([strawberryJuiceRecipe])
        } catch {}
        
        if let result = fruitStore.store[.strawberry] {
            XCTAssertEqual(expectation, result)
        } else {
            XCTAssertNil(fruitStore.store[.strawberry])
        }
    }
    
    func test_재고보다_많은양이_필요하면_에러가난다() {
        let input = -20
        let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: input)
        
        XCTAssertThrowsError(try fruitStore.changeAmountOfFruit([strawberryJuiceRecipe]))
    }
    
}
