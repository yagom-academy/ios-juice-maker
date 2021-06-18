//
//  EnumTypes.swift
//  JuiceMaker
//
//  Created by Yongwoo Marco on 2021/06/15.
//

enum JuiceMakerError: Error {
    case outOfStock
}

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

//enum Juice: String, CustomStringConvertible {
//    case strawberryBananaJuice = "딸바쥬스 주문"
//    case mangoKiwiJuice = "망키쥬스 주문"
//    case strawberryJuice = "딸기쥬스 주문"
//    case bananaJuice = "바나나쥬스 주문"
//    case mangoJuice = "망고쥬스 주문"
//    case kiwiJuice = "키위쥬스 주문"
//    case pineappleJuice = "파인애플쥬스 주문"
//
//    var description: String {
//        switch self {
//        case .strawberryJuice:
//            return "딸기"
//        case .bananaJuice:
//            return "바나나"
//        case .pineappleJuice:
//            return "파인애플"
//        case .kiwiJuice:
//            return "키위"
//        case .mangoJuice:
//            return "망고"
//        case .strawberryBananaJuice:
//            return "딸바"
//        case .mangoKiwiJuice:
//            return "망키"
//        }
//    }
//    var ingredients: Dictionary<Fruit, Int> {
//        switch self {
//        case .strawberryJuice:
//            return [.strawberry:16]
//        case .bananaJuice:
//            return [.banana:2]
//        case .pineappleJuice:
//            return [.pineapple:2]
//        case .kiwiJuice:
//            return [.kiwi:3]
//        case .mangoJuice:
//            return [.mango:3]
//        case .strawberryBananaJuice:
//            return [.strawberry:10, .banana:1]
//        case .mangoKiwiJuice:
//            return [.mango:2, .kiwi:1]
//        }
//    }
//}

struct Juice {
    var name: String
    var ingredients: Dictionary<Fruit, Int>
}

var strawberryJuice = Juice(name: "딸기쥬스", ingredients: [.strawberry:16])
var bananaJuice = Juice(name: "바나나쥬스", ingredients: [.banana:2])
var pineappleJuice = Juice(name: "파인애플쥬스", ingredients: [.pineapple:2])
var kiwiJuice = Juice(name: "키위쥬스", ingredients: [.kiwi:3])
var mangoJuice = Juice(name: "망고쥬스", ingredients: [.mango:3])
var strawberryBananaJuice = Juice(name: "딸바쥬스", ingredients: [.strawberry:10, .banana:1])
var mangoKiwiJuice = Juice(name: "망키쥬스", ingredients: [.mango:2, .kiwi:1])
