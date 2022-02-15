//
//  FruitStoreTests.swift
//  JuiceMakerTests
//
//  Created by 이지원 on 2022/02/15.
//

import XCTest

@testable import JuiceMaker

class FruitStoreTests: XCTestCase {
    var fruitStore: FruitStore?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        fruitStore = FruitStore()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        fruitStore = nil
    }
}
