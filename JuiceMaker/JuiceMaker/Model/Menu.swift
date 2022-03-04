//
//  Juice.swift
//  JuiceMaker
//
//  Created by Doogie & Malrang.
//
enum Menu: Int {
    case ddalBaJuice = 1
    case mangKiJuice
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    var recipe: [Fruits : Int] {
        get {
            switch self {
            case .strawberryJuice:
                return [.strawberry : 16]
            case .bananaJuice:
                return [.banana : 2]
            case .kiwiJuice:
                return [.kiwi : 3]
            case .pineappleJuice:
                return [.pineapple : 2]
            case .ddalBaJuice:
                return [.strawberry : 10, .banana : 1]
            case .mangoJuice:
                return [.mango : 3]
            case .mangKiJuice:
                return [.mango : 2, .kiwi : 1]
            }
        }
    }
    
    var orderMessage: String {
        get {
            switch self {
            case .strawberryJuice:
                return "딸기 쥬스 나왔습니다! 맛있게 드세요!"
            case .bananaJuice:
                return "바나나 쥬스 나왔습니다! 맛있게 드세요!"
            case .kiwiJuice:
                return "키위 쥬스 나왔습니다! 맛있게 드세요!"
            case .pineappleJuice:
                return "파인애플 쥬스 나왔습니다! 맛있게 드세요!"
            case .ddalBaJuice:
                return "딸바 쥬스 나왔습니다! 맛있게 드세요!"
            case .mangoJuice:
                return "망고 쥬스 나왔습니다! 맛있게 드세요!"
            case .mangKiJuice:
                return "망키 쥬스 나왔습니다! 맛있게 드세요!"
            }
        }
    }
}
