//
//  State.swift
//  JuiceMaker
//
//  Created by Haeseok Lee on 2022/02/15.
//

import Foundation

protocol State {
    var juiceMaker: JuiceMaker { get set }
    func order() throws -> String?
}

struct EmptyJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        throw JuiceMakerStateError.noState
    }
}

struct StrawberryJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        guard juiceMaker.fruitStore.strawberry.counter >= 16 else {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.strawberry.decrease(num: 16)
        return "딸기 쥬스"
    }
}

struct BananaJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        guard juiceMaker.fruitStore.banana.counter >= 2 else {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.banana.decrease(num: 2)
        return "바나나 쥬스"
    }
}

struct KiwiJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        guard juiceMaker.fruitStore.kiwi.counter >= 3 else {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.kiwi.decrease(num: 3)
        return "키위 쥬스"
    }
}

struct PineappleJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        guard juiceMaker.fruitStore.pineapple.counter >= 2 else {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.pineapple.decrease(num: 2)
        return "파인애플 쥬스"
    }
}

struct StrawberryBananaJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        guard juiceMaker.fruitStore.strawberry.counter >= 10,
              juiceMaker.fruitStore.banana.counter >= 1 else {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.strawberry.decrease(num: 10)
        juiceMaker.fruitStore.banana.decrease(num: 1)
        return "딸바 쥬스"
    }
}

struct MangoJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        guard juiceMaker.fruitStore.mango.counter >= 3 else {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.mango.decrease(num: 3)
        return "망고 쥬스"
    }
}

struct MangoKiwiJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        guard juiceMaker.fruitStore.mango.counter >= 2,
              juiceMaker.fruitStore.kiwi.counter >= 1 else {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.mango.decrease(num: 2)
        juiceMaker.fruitStore.kiwi.decrease(num: 1)
        return "망키 쥬스"
    }
}



enum JuiceMakerStateError: Error {
    case noState
    case outOfStock
}

extension JuiceMakerStateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noState:
            return "현재 입력 받은 상태가 없어요. 어떤 주스를 제조할지 알려주세요!"
        case .outOfStock:
            return "재고가 모자라요. 재고를 수정할까요?"
        }
    }
}
