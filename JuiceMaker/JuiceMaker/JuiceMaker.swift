//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

// 과일 종류
enum FruitName: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case mango = "망고"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case none = ""
}

// 쥬스 종류
enum JuiceName: String 
    case strawberryJuice = "딸기"
    case bananaJuice = "바나나"
    case mangoJuice = "망고"
    case kiwiJuice = "키위"
    case pineappleJuice = "파인애플"
    case strawberryBananaJuice = "딸기바나나"
    case mangoKiwiJuice = "망고키위 
    case none = ""
}

/// 과일
struct Fruit {
    var name: FruitName
    var stock: Int
    let initialAmount: Int = 10
    
    var currentStock: Int {
        get {
            return fruitStock
        }
    }
    
    init(name: name) {
        self.name = name
        self.stock = initialAmount
    }
    
    mutating func addStock(amount: Int) {
        self.stock = stock + amount
    }
    
    mutating func useStock(amount: Int) {
        self.stock = stock - amount
    }
    
    mutating func checkStock(needAmount: Int) -> Bool {
        if stock >= needAmount {
            return true
        }
        debugPrint("\(name.rawValue) 재고부족")
        return false
    }
}

/// 쥬스 메이커
class JuiceMaker {
    var selectedRecipe = [(name: FruitName.none, amount: 0)]
    var selectedMenu = JuiceName.none
    
    var strawberry = Fruit(name: .strawberry)
    var banana = Fruit(name: .banana)
    var pineapple = Fruit(name: .pineapple)
    var kiwi = Fruit(name: .kiwi)
    var mango = Fruit(name: .mango)
    
    // 쥬스 레시피
    let strawberryJuice = [(name: FruitName.strawberry, amount: 16)]
    let bananaJuice = [(name: FruitName.banana, amount: 2)]
    let kiwiJuice = [(name: FruitName.kiwi, amount: 3)]
    let mangoJuice = [(name: FruitName.mango, amount: 3)]
    let pineappleJuice = [(name: FruitName.pineapple, amount: 2)]
    let strawberryBananaJuice = [(name: FruitName.strawberry, amount: 10), (name: FruitName.banana, amount: 1)]
    let mangoKiwiJuice = [(name: FruitName.mango, amount: 2), (name: FruitName.kiwi, amount: 1)]
    
    
    /// 메뉴 접수
    func checkRecipe(menu: JuiceName) {
        switch menu {
        case .strawberrJuice:
            selectedRecipe = strawberryJuice
            selectedMenu = JuiceName.strawberryJuice
            
        case .bananaJuice:
            selectedRecipe = bananaJuice
            selectedMenu = JuiceName.bananaJuice
            
        case .kiwiJuice:
            selectedRecipe = kiwiJuice
            selectedMenu = JuiceName.kiwiJuice
            
        case .mangoJuice:
            selectedRecipe = mangoJuice
            selectedMenu = JuiceName.mangoJuice
            
        case .strawberryBananaJuice:
            selectedRecipe = strawberryBananaJuice
            selectedMenu = JuiceName.strawberryBananaJuice
            
        case .pineappleJuice:
            selectedRecipe = pineappleJuice
            selectedMenu = JuiceName.pineappleJuice
            
        case .mangoKiwiJuice:
            selectedRecipe = mangoKiwiJuice
            selectedMenu = JuiceName.mangoKiwiJuice
            
        case .none:
            return
        }
    }
    
    
    /// 재고 확인
    func checkFruitStock(fruit: FruitName, amount: Int) -> Bool {
        switch fruit {
        case .banana:
            return banana.checkStock(needAmount: amount)
        case .kiwi:
            return kiwi.checkStock(needAmount: amount)
        case .mango:
            return mango.checkStock(needAmount: amount)
        case .strawberry:
            return strawberry.checkStock(needAmount: amount)
        case .pineapple:
            return pineapple.checkStock(needAmount: amount)
        default:
            return false
        }
    }
    
    
    /// 쥬스 만들기
    func makeJuice(menu: JuiceName) {
        // 레시피 확인
        checkRecipe(menu: menu)
        
        // 재고 확인
        var possible: Bool = true
        
        for recipeIndex in 0..<selectedRecipe.count {
            if !checkFruitStock(fruit: selectedRecipe[recipeIndex].name, amount: selectedRecipe[recipeIndex].amount) {
                possible = false
                break
            }
        }
        
        // 재고가 있다면 만들기
        if possible {
            switch selectedMenu {
            case .strawberrJuice:
                strawberry.useStock(amount: selectedRecipe[0].amount)
               
            case .bananaJuice:
                banana.useStock(amount: selectedRecipe[0].amount)
                
            case .kiwiJuice:
                kiwi.useStock(amount: selectedRecipe[0].amount)
                
            case .strawberryBananaJuice:
                strawberry.useStock(amount: selectedRecipe[0].amount)
                banana.useStock(amount: selectedRecipe[1].amount)
                
            case .pineappleJuice:
                pineapple.useStock(amount: selectedRecipe[0].amount)
                
            case .mangoJuice:
                mango.useStock(amount: selectedRecipe[0].amount)
                
            case .mangoKiwiJuice:
                mango.useStock(amount: selectedRecipe[0].amount)
                kiwi.useStock(amount: selectedRecipe[1].amount)
                
            default:
                return
            }
            debugPrint("\(selectedMenu.rawValue) 쥬스 완성")
        }
    }
}
