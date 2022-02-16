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
        if juiceMaker.fruitStore.strawberry.counter < 16 {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.decrease(fruitType: Strawberry.self, num: 16)
        let menuName = "\(Strawberry.name) 쥬스"
        return menuName
    }
}

struct BananaJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        if juiceMaker.fruitStore.banana.counter < 2 {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.decrease(fruitType: Banana.self, num: 2)
        let menuName = "\(Banana.name) 쥬스"
        return menuName
    }
}

struct KiwiJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        if juiceMaker.fruitStore.kiwi.counter < 3 {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.decrease(fruitType: Kiwi.self, num: 3)
        let menuName = "\(Kiwi.name) 쥬스"
        return menuName
    }
}

struct PineappleJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        if juiceMaker.fruitStore.pineapple.counter < 2 {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.decrease(fruitType: Pineapple.self, num: 2)
        let menuName = "\(Pineapple.name) 쥬스"
        return menuName
    }
}

struct StrawberryBananaJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        if juiceMaker.fruitStore.strawberry.counter < 10 ||
              juiceMaker.fruitStore.banana.counter < 1 {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.decrease(fruitType: Strawberry.self, num: 10)
        juiceMaker.fruitStore.decrease(fruitType: Banana.self, num: 1)
        let menuName = "\(Strawberry.name.first ?? " ")\(Banana.name.first ?? " ") 쥬스"
        return menuName
    }
}

struct MangoJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        if juiceMaker.fruitStore.mango.counter < 3 {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.decrease(fruitType: Mango.self, num: 3)
        let menuName = "\(Mango.name) 쥬스"
        return menuName
    }
}

struct MangoKiwiJuiceMakerState: State {
    var juiceMaker: JuiceMaker
    
    func order() throws -> String? {
        if juiceMaker.fruitStore.mango.counter < 2 ||
              juiceMaker.fruitStore.kiwi.counter < 1 {
            throw JuiceMakerStateError.outOfStock
        }
        juiceMaker.fruitStore.decrease(fruitType: Mango.self, num: 2)
        juiceMaker.fruitStore.decrease(fruitType: Kiwi.self, num: 1)
        let menuName = "\(Mango.name.first ?? " ")\(Kiwi.name.first ?? " ") 쥬스"
        return menuName
    }
}
