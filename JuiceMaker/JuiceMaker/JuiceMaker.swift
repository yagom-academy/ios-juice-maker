//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StockManager {
    var showalert = ShowAlert()
    var recipe = Recipe()
    
    private(set) var strawberry: UInt
    private(set) var banana: UInt
    private(set) var pineapple: UInt
    private(set) var kiwi: UInt
    private(set) var mango: UInt
    
    //MARK: - initialStock
    init() {
        let initialStock: UInt = 10
        strawberry = initialStock
        banana = initialStock
        pineapple = initialStock
        kiwi = initialStock
        mango = initialStock
    }
    
    //MARK: - giveIngredients
    func useStrawberryJuiceIngredients() {
        strawberry -= recipe.strawberryJuice🍓
    }
    
    func useStrawberryBananaJuiceIngredients() {
        strawberry -= recipe.strawberryBananaJuice🍓
        banana -= recipe.strawberryBananaJuice🍌
    }
    
    func useeBananaJuiceIngredients() {
        banana -= recipe.bananaJuice🍌
    }
    
    func useKiwiJuiceIngredients() {
        kiwi -= recipe.kiwiJuice🥝
    }
    
    func usePineappleJuiceIngredients() {
        pineapple -= recipe.pineappleJuice🍍
    }
    
    func useMangoJuiceIngredients() {
        mango -= recipe.mangoJuice🥭
    }
    
    func useMangoKiwiJuiceIngredients() {
        mango -= recipe.mangoKiwiJuice🥭
        kiwi -= recipe.mangoKiwiJuice🥝
    }
    
    // MARK: - addStock
    func addStrawberryStock() {
        strawberry += 1
    }
    
    func addBananaStock() {
        banana += 1
    }
    
    func addPineappleStock() {
        pineapple += 1
    }
    
    func addMangoStock() {
        mango += 1
    }
    
    func addKiwiStock() {
        kiwi += 1
    }
    
    // MARK: - substractStock
    func substractStrawberryStock() {
        guard strawberry > 0 else {
            showalert.printWrongRequest()
            return
        }
        strawberry -= 1
    }
    
    func substractBananaStock() {
        guard banana > 0 else {
            showalert.printWrongRequest()
            return
        }
        banana -= 1
    }
    
    func substractPineappleStock() {
        guard pineapple > 0 else {
            showalert.printWrongRequest()
            return
        }
        pineapple -= 1
    }
    
    func substractMangoStock() {
        guard mango > 0 else {
            showalert.printWrongRequest()
            return
        }
        mango -= 1
    }
    
    func substractKiwiStock() {
        guard kiwi > 0 else {
            showalert.printWrongRequest()
            return
        }
        kiwi -= 1
    }
    
    // MARK: - showAllStock
    func showFruitStock() {
        print("딸기:\(strawberry) 바나나:\(banana) 파인애플:\(pineapple) 망고:\(mango) 키위:\(kiwi)")
    }
}

class JuiceMaker {
    var stockManager = StockManager()
    var showAlert = ShowAlert()
    
    func makeStrawberryJuice() {
        guard stockManager.strawberry >= 16 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.useStrawberryJuiceIngredients()
        print("딸기 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeStrawberryBananaJuice() {
        guard stockManager.strawberry >= 10 && stockManager.banana >= 1 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.useStrawberryBananaJuiceIngredients()
        print("딸기바나나 쥬스 나왔습니다. 맛있게 드세요")
        
    }
    
    func makeBananaJuice() {
        guard stockManager.banana >= 2 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.useeBananaJuiceIngredients()
        print("바나나 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeKiwiJuice() {
        guard stockManager.kiwi >= 3 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.useKiwiJuiceIngredients()
        print("키위 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makePineappleJuice() {
        guard stockManager.pineapple >= 2 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.usePineappleJuiceIngredients()
        print("파인애플 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeMangoJuice() {
        guard stockManager.mango >= 3 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.useMangoJuiceIngredients()
        print("망고 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeMangoKiwiJuice() {
        guard stockManager.mango >= 2 && stockManager.kiwi >= 1 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.useMangoKiwiJuiceIngredients()
        print("망고키위 쥬스 나왔습니다. 맛있게 드세요")
    }
    
}

class ShowAlert {
    func printOutOfStock() {
        print("재고가 부족합니다. 재고를 수정할까요?")
    }
    func printWrongRequest() {
        print("잘못된 요청입니다. 재고 수량은 0미만으로 지정할수 없습니다.")
    }
}

class Recipe {
    let strawberryJuice🍓:UInt = 16
    let strawberryBananaJuice🍓:UInt = 10
    let strawberryBananaJuice🍌:UInt = 1
    let bananaJuice🍌:UInt = 2
    let kiwiJuice🥝:UInt = 3
    let pineappleJuice🍍:UInt = 2
    let mangoJuice🥭:UInt = 3
    let mangoKiwiJuice🥝:UInt = 1
    let mangoKiwiJuice🥭:UInt = 2
}
