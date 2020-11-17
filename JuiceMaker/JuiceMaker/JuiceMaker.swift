//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

/// 과일 재고
struct FruitsStock {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    // MARK : 읽기 전용 재고
    var strawberryStock: Int {
        get {
            return strawberry
        }
    }
    
    var bananaStock: Int {
        get {
            return banana
        }
    }
    
    var pineappleyStock: Int {
        get {
            return pineapple
        }
    }
    
    var kiwiStock: Int {
        get {
            return kiwi
        }
    }
    
    var mangoStock: Int {
        get {
            return mango
        }
    }
    
    // MAKR : 재고 올리기
    mutating func addFruitStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0){
        self.strawberry += strawberry
        self.banana += banana
        self.pineapple += pineapple
        self.kiwi += kiwi
        self.mango += mango
    }
}

/// 쥬스 메이커
class JuiceMaker {
    var fruitsStock = FruitsStock()
    var selectedRecipe = [(name: "kiwi", number: 0)]
    var selectMenu = ""
    
    // 과일 종류
    enum Fruit: String {
        case strawberry = "딸기"
        case banana = "바나나"
        case pineapple = "파인애플"
        case kiwi = "키위"
        case mango = "망고"
    }
    
    // 쥬스 종류
    enum Juice: String {
        case kiwiJuice = "키위"
        case strawberryBananaJuice = "딸기바나나"
        case pineappleJuice = "파인애플"
        case mangoJuice = "망고"
        case mangoKiwiJuice = "망고키위"
    }
    
    // 쥬스 레시피
    let kiwiJuice = [(name: "kiwi", number: 3)]
    let strawberryBananaJuice = [(name: "strawberry", number: 10), (name: "banana", number: 1)]
    let pineappleJuice = [(name: "pineapple", number: 2)]
    let mangoKiwiJuice = [(name: "mango", number: 2), (name: "kiwi", number: 1)]
    let mangoJuice = [(name: "mango", number: 3)]
    
    /// 메뉴 접수
    func checkRecipe(menu: Juice) {
        switch menu {
        case .kiwiJuice:
            selectedRecipe = kiwiJuice
            selectMenu = Juice.kiwiJuice.rawValue
        case .strawberryBananaJuice:
            selectedRecipe = strawberryBananaJuice
            selectMenu = Juice.strawberryBananaJuice.rawValue
        case .pineappleJuice:
            selectedRecipe = pineappleJuice
            selectMenu = Juice.pineappleJuice.rawValue
        case .mangoJuice:
            selectedRecipe = mangoJuice
            selectMenu = Juice.mangoJuice.rawValue
        case .mangoKiwiJuice:
            selectedRecipe = mangoKiwiJuice
            selectMenu = Juice.mangoKiwiJuice.rawValue
        }
    }
    
    /// 재고 확인
    func checkFruitStock(fruit: String, number: Int) -> Bool {
        switch fruit {
        case "banana":
            if fruitsStock.banana >= number {
                return true
            }
        case "kiwi":
            if fruitsStock.kiwi >= number {
                return true
            }
        case "mango":
            if fruitsStock.mango >= number {
                return true
            }
        case "strawberry":
            if fruitsStock.strawberry >= number {
                return true
            }
        case "pineapple":
            if fruitsStock.pineapple >= number {
                return true
            }
        default:
            return false
        }
        return false
    }
    
    /// 쥬스 만들기
    func makeJuice(menu: Juice) -> Bool{
        // 레시피 확인
        checkRecipe(menu: menu)
        
        // 재고 확인
        var possible: Bool = false
        
        for recipeIndex in 0..<selectedRecipe.count {
            if checkFruitStock(fruit: selectedRecipe[recipeIndex].name, number: selectedRecipe[recipeIndex].number) {
                possible = true
            } else {
                possible = false
                break
            }
        }
        
        // 재고가 있다면 만들고 true 리턴
        if possible {
            switch selectMenu {
            case "키위":
                fruitsStock.kiwi -= selectedRecipe[0].number
            case "딸기바나나":
                fruitsStock.strawberry -= selectedRecipe[0].number
                fruitsStock.banana -= selectedRecipe[1].number
            case "파인애플":
                fruitsStock.pineapple -= selectedRecipe[0].number
            case "망고":
                fruitsStock.mango -= selectedRecipe[0].number
            case "망고키위":
                fruitsStock.mango -= selectedRecipe[0].number
                fruitsStock.kiwi -= selectedRecipe[1].number
            default:
                return false
            }
            print("\(selectMenu) 쥬스 나왔습니다! 맛있게 드세요!")
            return true
        }
        
        // 재고가 없으면 false 리턴
        print("재고가 모자라요. 재고를 수정할까요?")
        return false
    }
}
