//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StockManager {
    var showalert = ShowAlert()
    
    private var strawberry: UInt = 10
    private var banana: UInt = 10
    private var pineapple: UInt = 10
    private var kiwi: UInt = 10
    private var mango: UInt = 10
    
    var strawberryStock: UInt {
        get {
            return strawberry
        }
    }
    
    var bananaStock: UInt {
        get {
            return banana
        }
    }
    
    var pineappleStock: UInt {
        get {
            return pineapple
        }
    }
    
    var kiwiStock: UInt {
        get {
            return kiwi
        }
    }
    
    var mangoStock: UInt {
        get {
            return mango
        }
    }
    
    func giveStrawberryJuiceIngredients() {
        strawberry -= 3
    }
    
    func giveStrawberryBananaJuiceIngredients() {
        strawberry -= 10
        banana -= 1
    }
    
    func giveBananaJuiceIngredients() {
        banana -= 2
    }
    
    func giveKiwiJuiceIngredients() {
        kiwi -= 3
    }
    
    func givePineappleJuiceIngredients() {
        pineapple -= 2
    }
    
    func giveMangoJuiceIngredients() {
        mango -= 3
    }
    
    func giveMangoKiwiJuiceIngredients() {
        mango -= 2
        kiwi -= 1
    }
    
    func addStrawberryStock() {
        strawberry += 1
    }
    
    func substractStrawberryStock() {
        strawberry -= 1
    }
    
    func addBananaStock() {
        banana += 1
    }
    
    func substractBananaStock() {
        banana -= 1
    }
    
    func addPineappleStock() {
        pineapple += 1
    }
    
    func substractPineappleStock() {
        pineapple -= 1
    }
    
    func addMangoStock() {
        mango += 1
    }
    
    func substractMangoStock() {
        mango -= 1
    }
    
    func addKiwiStock() {
        kiwi += 1
    }
    
    func substractKiwiStock() {
        if kiwi > 0 {
            kiwi -= 1
        } else {
            
        }
    }
    
    func showFruitStock() {
        print("딸기:\(strawberryStock) 바나나:\(bananaStock) 파인애플:\(pineappleStock) 망고:\(mangoStock) 키위:\(kiwiStock)")
    }
}

class JuiceMaker {
    var stockManager = StockManager()
    var showAlert = ShowAlert()
    
    func makeStrawberryJuice() {
        if stockManager.strawberryStock >= 16 {
            stockManager.giveStrawberryJuiceIngredients()
            print("딸기 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            showAlert.printOutOfStock()
        }
    }
    
    func makeStrawberryBananaJuice() {
        if stockManager.strawberryStock >= 10 && stockManager.bananaStock >= 1 {
            stockManager.giveStrawberryBananaJuiceIngredients()
            print("딸기바나나 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            showAlert.printOutOfStock()
        }
    }
    
    func makeBananaJuice() {
        if stockManager.bananaStock >= 2 {
            stockManager.giveBananaJuiceIngredients()
            print("바나나 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            showAlert.printOutOfStock()
        }
    }
    
    func makeKiwiJuice() {
        if stockManager.kiwiStock >= 3 {
            stockManager.giveKiwiJuiceIngredients()
            print("키위 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            showAlert.printOutOfStock()
        }
    }
    
    func makePineappleJuice() {
        if stockManager.pineappleStock >= 2 {
            stockManager.givePineappleJuiceIngredients()
            print("파인애플 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            showAlert.printOutOfStock()
        }
    }
    
    func makeMangoJuice() {
        if stockManager.mangoStock >= 3 {
            stockManager.giveMangoJuiceIngredients()
            print("망고 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            showAlert.printOutOfStock()
        }
    }
    
    func makeMangoKiwiJuice() {
        if stockManager.mangoStock >= 2 && stockManager.kiwiStock >= 1 {
            stockManager.giveMangoKiwiJuiceIngredients()
            print("망고키위 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            showAlert.printOutOfStock()
        }
    }
}

class ShowAlert {
    func printOutOfStock() {
        print("재고가 부족합니다. 재고를 수정할까요?")
    }
}
