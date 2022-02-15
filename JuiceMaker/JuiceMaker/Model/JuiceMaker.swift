//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
final class JuiceMaker {
    
    lazy var emptyJuiceMakerState: EmptyJuiceMakerState = {
        return EmptyJuiceMakerState(juiceMaker: self)
    }()
    lazy var strawberryJuiceMakerState: StrawberryJuiceMakerState = {
        return StrawberryJuiceMakerState(juiceMaker: self)
    }()
    lazy var bananaJuiceMakerState: BananaJuiceMakerState = {
        return BananaJuiceMakerState(juiceMaker: self)
    }()
    lazy var kiwiJuiceMakerState: KiwiJuiceMakerState = {
        return KiwiJuiceMakerState(juiceMaker: self)
    }()
    lazy var pineappleJuiceMakerState: PineappleJuiceMakerState = {
        return PineappleJuiceMakerState(juiceMaker: self)
    }()
    lazy var strawberryBananaJuiceMakerState: StrawberryBananaJuiceMakerState = {
        return StrawberryBananaJuiceMakerState(juiceMaker: self)
    }()
    lazy var mangoJuiceMakerState: MangoJuiceMakerState = {
        return MangoJuiceMakerState(juiceMaker: self)
    }()
    lazy var mangoKiwiJuiceMakerState: MangoKiwiJuiceMakerState = {
        return MangoKiwiJuiceMakerState(juiceMaker: self)
    }()
    private lazy var state: State? = {
        return self.emptyJuiceMakerState
    }()
    
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func order() throws -> String? {
        do {
            let orderedMenu = try state?.order()
            return "\(orderedMenu ?? "쥬스") 나왔습니다! 맛있게 드세요!"
        } catch let error {
            throw error
        }
    }
    
    func setState(state: State?) {
        self.state = state
    }
}
