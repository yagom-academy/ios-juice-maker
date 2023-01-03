//
//  Recipe.swift
//  JuiceMaker
//
//  Created by Christy Lee on 2023/01/03.
//

import Foundation
enum Juice {
    case 딸기쥬스, 바나나쥬스, 키위쥬스, 파인애플쥬스, 딸바쥬스, 망고쥬스, 망고키위쥬스
}

enum Recipe {
    case 딸기, 바나나, 파인애플, 키위, 망고
    
    static func pickFruits(stock: Recipe, type: Juice) -> Int? {
        if type == .딸기쥬스 {
            switch stock {
            case .딸기:
                return 16
            default:
                return nil
            }
        } else if type == .바나나쥬스 {
            switch stock {
            case .바나나:
                return 2
            default:
                return nil
            }
        } else if type == .키위쥬스 {
            switch stock {
            case .키위:
                return 3
            default:
                return nil
            }
        } else if type == .파인애플쥬스 {
            switch stock {
            case .파인애플:
                return 2
            default:
                return nil
            }
        } else if type == .딸바쥬스 {
            switch stock {
            case .딸기:
                return 10
            case .바나나:
                return 1
            default:
                return nil
            }
        } else if type == .망고쥬스 {
            switch stock {
            case .망고:
                return 3
            default:
                return nil
            }
        } else if type == .망고키위쥬스 {
            switch stock {
            case .망고:
                return 2
            case .키위:
                return 1
            default:
                return nil
            }
        }
    }
}

//enum Recipe: Int {
//    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
////
////    struct Values {
////        let first: [String: Int], second: [String: Int]?
////    }
//    var values: [String: Int] {
//        switch self {
//        case .strawberryJuice:
//            return ["strawberry": 16]
//            //Values(first: ["strawberry": 16], second: nil)
//        case .bananaJuice:
//            return ["banana": 2]
//            //return Values(first: ["banana": 2], second: nil)
//        case .kiwiJuice:
//            return ["kiwi": 3]
//            //return Values(first: ["kiwi": 3], second: nil)
//        case .pineappleJuice:
//            return ["pineapple": 2]
//            //return Values(first: ["pineapple": 2], second: nil)
//        case .strawberryBananaJuice:
//            return ["strawberry": 10, "banana": 1]
//            //Values(first: ["strawberry": 10], second: ["banana": 1])
//        case .mangoJuice:
//            return ["mango": 3]
//            //return Values(first: ["mango": 3], second: nil)
//        case .mangoKiwiJuice:
//            return ["mango": 2, "kiwi": 1]
//            //return Values(first: ["mango": 2], second: ["kiwi": 1])
//        }
//    }
//}
