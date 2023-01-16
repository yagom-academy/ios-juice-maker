//
//  Type.swift
//  JuiceMaker
//
//  Created by 송종환 on 2023/01/03.
//

import Foundation

enum Identifier: String {
    case fruitStoreNavigationController = "fruitStoreNavigationController"
}

enum AlertMessage {
    static let yes = "네"
    static let no = "아니오"
    static let makeJuiceMessage = " 나왔습니다. 맛있게 드세요!"
    static let outOfStockMessage = "재료가 모자라요. 재고를 수정할까요?"
    static let success = "주스제조 성공"
    static let failure = "주스제조 실패"
    static let unknownError = "알 수 없는에러"
    static let unknwonErrorMessage = "알 수 없는에러가 발생했습니다 앱을 다시 실행해 주세요"
}

enum Fruit: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

enum FruitJuice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case pineappleJuice = "파인애플쥬스"
    case kiwiJuice = "키위쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoKiwiJuice = "망키쥬스"
    
    var ingredient: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

enum juiceMakeError: Error {
    case outOfStockError
    case unknownError
}


