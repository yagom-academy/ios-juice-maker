//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
enum Fruits {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
}

enum CheckStock {
    case inStock, outStock, none
}

enum JuiceMakeResult: String {
    case success = "Success"
    case fail = "Fail"
    case none
}

class JuiceMaker {
    private(set) var stockAmount = 0
    private(set) var strawberry = 10
    private(set) var banana = 10
    private(set) var pineapple = 10
    private(set) var kiwi = 10
    private(set) var mango = 10
    
    // 과일 재고 확인
    // 과일 재고를 확인하는 이유?: 쥬스를 만들때 과일의 재고를 확인하고 재고가 남아있으면 만들기 시작, 없으면 만들지 못함
    // 쥬스를 만드는데 들어가는 과일 개수를 구조체로 선언 ???
    // 레시피 메소드를 따로 선언 ???
    func checkFruitsStock(menu: Juice) -> CheckStock {
        var availability = CheckStock.none
        
        switch menu {
        case .strawberryJuice:
            if strawberry >= 16 {
                availability = .inStock
            } else {
                availability = .outStock
            }
        case .bananaJuice:
            if banana >= 2 {
                availability = .inStock
            } else {
                availability = .outStock
            }
        case .kiwiJuice:
            if kiwi >= 3 {
                availability = .inStock
            } else {
                availability = .outStock
            }
        case .pineappleJuice:
            if pineapple >= 2 {
                availability = .inStock
            } else {
                availability = .outStock
            }
        case .strawberryBananaJuice:
            if strawberry >= 10 && banana >= 1 {
                availability = .inStock
            } else {
                availability = .outStock
            }
        case .mangoJuice:
            if mango >= 3 {
                availability = .inStock
            } else {
                availability = .outStock
            }
        case .mangoKiwiJuice:
            if mango >= 2 && kiwi >= 1 {
                availability = .inStock
            } else {
                availability = .outStock
            }
        }
        return availability
    }
    
    func juiceRecipe(menu: Juice) {
        switch menu {
        case .strawberryJuice:
            strawberry -= 16
        case .bananaJuice:
            banana -= 2
        case .kiwiJuice:
            kiwi -= 3
        case .pineappleJuice:
            pineapple -= 2
        case .strawberryBananaJuice:
            strawberry -= 10
            banana -= 1
        case .mangoJuice:
            mango -= 3
        case .mangoKiwiJuice:
            mango -= 2
            kiwi -= 1
        }
    }
    
    func addFruitsAmount(amount: Int) {
        stockAmount += amount
    }
    
    func makeJuice(menu: Juice) -> JuiceMakeResult {
        let check = checkFruitsStock(menu: menu)
        var result = JuiceMakeResult.none
        
        switch check {
        case .inStock:
            juiceRecipe(menu: menu)
            result = .success
        case .outStock:
            result = .fail
        default:
            result = .none
        }
        return result
    }
}
