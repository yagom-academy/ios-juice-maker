//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StockManager {
    var showalert = ShowAlert()
    
    private(set) var strawberry: UInt = 10
    private(set) var banana: UInt = 10
    private(set) var pineapple: UInt = 10
    private(set) var kiwi: UInt = 10
    private(set) var mango: UInt = 10
    
    //MARK: - giveIngredients
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
        stockManager.giveStrawberryJuiceIngredients()
        print("딸기 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeStrawberryBananaJuice() {
        guard stockManager.strawberry >= 10 && stockManager.banana >= 1 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.giveStrawberryBananaJuiceIngredients()
        print("딸기바나나 쥬스 나왔습니다. 맛있게 드세요")
        
    }
    
    func makeBananaJuice() {
        guard stockManager.banana >= 2 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.giveBananaJuiceIngredients()
        print("바나나 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeKiwiJuice() {
        guard stockManager.kiwi >= 3 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.giveKiwiJuiceIngredients()
        print("키위 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makePineappleJuice() {
        guard stockManager.pineapple >= 2 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.givePineappleJuiceIngredients()
        print("파인애플 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeMangoJuice() {
        guard stockManager.mango >= 3 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.giveMangoJuiceIngredients()
        print("망고 쥬스 나왔습니다. 맛있게 드세요")
    }
    
    func makeMangoKiwiJuice() {
        guard stockManager.mango >= 2 && stockManager.kiwi >= 1 else {
            showAlert.printOutOfStock()
            return
        }
        stockManager.giveMangoKiwiJuiceIngredients()
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
