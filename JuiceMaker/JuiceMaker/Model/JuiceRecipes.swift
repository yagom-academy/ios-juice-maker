//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by 김정상 on 2022/02/16.
//

import Foundation

protocol JuiceProtocol {
    var name: String { get }
    var items: FruitItems { get }
}

struct StrawberryJuice: JuiceProtocol {
    private(set) var name: String = "딸기 쥬스"
    private(set) var items: FruitItems = [
        .strawberry: 16
    ]
}

struct BananaJuice: JuiceProtocol {
    private(set) var name: String = "바나나 쥬스"
    private(set) var items: FruitItems = [
        .banana: 2
    ]
}

struct PineappleJuice: JuiceProtocol {
    private(set) var name: String = "파인애플 쥬스"
    private(set) var items: FruitItems = [
        .pineapple: 2
    ]
}

struct KiwiJuice: JuiceProtocol {
    private(set) var name: String = "키위 쥬스"
    private(set) var items: FruitItems = [
        .kiwi: 3
    ]
}

struct MangoJuice: JuiceProtocol {
    private(set) var name: String = "망고 쥬스"
    private(set) var items: FruitItems = [
        .mango: 3
    ]
}

struct StrawberryBananaJuice: JuiceProtocol {
    private(set) var name: String = "딸바 쥬스"
    private(set) var items: FruitItems = [
        .strawberry: 10,
        .banana: 1
    ]
}

struct MangoKiwiJuice: JuiceProtocol {
    private(set) var name: String = "망키 쥬스"
    private(set) var items: FruitItems = [
        .mango: 2,
        .kiwi: 1
    ]
}
