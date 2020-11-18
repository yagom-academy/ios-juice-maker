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
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    case none = ""
}

// 쥬스 종류
enum JuiceName: String {
    case kiwiJuice = "키위"
    case strawberryBananaJuice = "딸기바나나"
    case pineappleJuice = "파인애플"
    case mangoJuice = "망고"
    case mangoKiwiJuice = "망고키위"
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
    var selectedRecipe = [(name: FruitName.none, number: 0)]
    var selectedMenu = JuiceName.none
    
    var strawberry = Fruit(name: .strawberry)
    var banana = Fruit(name: .banana)
    var pineapple = Fruit(name: .pineapple)
    var kiwi = Fruit(name: .kiwi)
    var mango = Fruit(name: .mango)
    
    // 쥬스 레시피
    let kiwiJuice = [(name: FruitName.kiwi, number: 3)]
    let strawberryBananaJuice = [(name: FruitName.strawberry, number: 10), (name: FruitName.banana, number: 1)]
    let pineappleJuice = [(name: FruitName.pineapple, number: 2)]
    let mangoKiwiJuice = [(name: FruitName.mango, number: 2), (name: FruitName.kiwi, number: 1)]
    let mangoJuice = [(name: FruitName.mango, number: 3)]
    
    
    /// 메뉴 접수
    func checkRecipe(menu: JuiceName) {
        switch menu {
        case .kiwiJuice:
            selectedRecipe = kiwiJuice
            selectedMenu = JuiceName.kiwiJuice
            
        case .strawberryBananaJuice:
            selectedRecipe = strawberryBananaJuice
            selectedMenu = JuiceName.strawberryBananaJuice
            
        case .pineappleJuice:
            selectedRecipe = pineappleJuice
            selectedMenu = JuiceName.pineappleJuice
            
        case .mangoJuice:
            selectedRecipe = mangoJuice
            selectedMenu = JuiceName.mangoJuice
            
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
            if !checkFruitStock(fruit: selectedRecipe[recipeIndex].name, amount: selectedRecipe[recipeIndex].number) {
                possible = false
                break
            }
        }
        
        // 재고가 있다면 만들기
        if possible {
            switch selectedMenu {
            case .kiwiJuice:
                kiwi.useStock(amount: selectedRecipe[0].number)
                
            case .strawberryBananaJuice:
                strawberry.useStock(amount: selectedRecipe[0].number)
                banana.useStock(amount: selectedRecipe[1].number)
                
            case .pineappleJuice:
                pineapple.useStock(amount: selectedRecipe[0].number)
                
            case .mangoJuice:
                mango.useStock(amount: selectedRecipe[0].number)
                
            case .mangoKiwiJuice:
                mango.useStock(amount: selectedRecipe[0].number)
                kiwi.useStock(amount: selectedRecipe[1].number)
                
            default:
                return
            }
            debugPrint("\(selectedMenu.rawValue) 쥬스 완성")
        }
    }
}
