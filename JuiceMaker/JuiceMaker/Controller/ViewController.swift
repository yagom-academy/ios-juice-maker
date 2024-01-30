//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var modifyStockButton: UIBarButtonItem!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker = JuiceMaker()
    var menuList: MenuList = MenuList(strawberryJuice: [JuiceMenu.recipe(.strawberry, 3)],
                                      bananaJuice: [JuiceMenu.recipe(.banana, 3)],
                                      pineappleJuice: [JuiceMenu.recipe(.pineapple, 2)],
                                      kiwiJuice: [JuiceMenu.recipe(.kiwi, 3)],
                                      mangoJuice: [JuiceMenu.recipe(.mango, 3)],
                                      strawberryBananaJuice: [JuiceMenu.recipe(.strawberry, 10), JuiceMenu.recipe(.banana, 1)],
                                      mangoKiwiJuice: [JuiceMenu.recipe(.mango, 2), JuiceMenu.recipe(.kiwi, 1)])
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func modifyStockButtonTapped(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") as? ModifyStockViewController else {
            return
        }
        vc.modalPresentationStyle = .pageSheet
        
        self.present(vc, animated: true)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menuList.strawberryJuice)
            juiceMaker.fruitStore.consumeStock(recipe: menuList.strawberryJuice)
            alertSufficientStock(juiceName: "딸기")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menuList.bananaJuice)
            juiceMaker.fruitStore.consumeStock(recipe: menuList.bananaJuice)
            alertSufficientStock(juiceName: "바나나")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menuList.strawberryBananaJuice)
            juiceMaker.fruitStore.consumeStock(recipe: menuList.strawberryBananaJuice)
            alertSufficientStock(juiceName: "딸기바나나")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menuList.pineappleJuice)
            juiceMaker.fruitStore.consumeStock(recipe: menuList.pineappleJuice)
            alertSufficientStock(juiceName: "파인애플")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menuList.mangoJuice)
            juiceMaker.fruitStore.consumeStock(recipe: menuList.mangoJuice)
            alertSufficientStock(juiceName: "망고")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menuList.kiwiJuice)
            juiceMaker.fruitStore.consumeStock(recipe: menuList.kiwiJuice)
            alertSufficientStock(juiceName: "키위")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menuList.mangoKiwiJuice)
            juiceMaker.fruitStore.consumeStock(recipe: menuList.mangoKiwiJuice)
            alertSufficientStock(juiceName: "망고키위")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    func alertSufficientStock(juiceName: String) {
        let alert = UIAlertController(title: "알림", message: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(confirm)
        
        present(alert, animated: true, completion: nil)
    }
    
    func alertInsufficientStock() {
        let alert = UIAlertController(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "예", style: .default)  { _ in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") as? ModifyStockViewController else {
                return
            }
            vc.modalPresentationStyle = .pageSheet
            
            self.present(vc, animated: true)
        }
        
        let close = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(confirm)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
}
