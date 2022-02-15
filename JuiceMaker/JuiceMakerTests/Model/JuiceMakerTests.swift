//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by momo on 2022/02/16.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
    
    private var sut: JuiceMaker!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = JuiceMaker()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
