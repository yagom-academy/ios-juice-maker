//
//  MakeJuiceViewModelTests.swift
//  JuiceMakerTests
//
//  Created by Dayeon Jung on 2022/02/17.
//

import XCTest
@testable import JuiceMaker

class MakeJuiceViewModelTests: XCTestCase {

    var viewModel: MakeJuiceViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = MakeJuiceViewModel(juiceMaker: JuiceMaker())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    
    func test_바나나의_초기_재고가_10개로_반환된다() {
        
        // given
        let fruit = FruitStore.Fruit.banana
        
        // when
        let stocks = viewModel.stock(of: fruit)
        let expected = Quantity(10)

        // then
        XCTAssertEqual(stocks, expected)
        
    }

    func test_바나나주스를_주문하면_바나나의_재고가_8개가_된다() {
        
        // given
        let juice = JuiceMaker.Juice.bananaJuice
        
        // when
        viewModel.order(juice)
        
        let stocks = viewModel.displayingStocks.value.first?.1
        let expected = Quantity(8)
        
        // then
        XCTAssertEqual(stocks, expected)
    }
}
