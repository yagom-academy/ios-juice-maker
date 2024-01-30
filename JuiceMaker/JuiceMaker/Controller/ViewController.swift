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
    var menuList: MenuList = MenuList(strawberryJuice: [JuiceMenu.recipe(.strawberry, 16)],
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
        tryMakingJuice(menu: menuList.strawberryJuice, menuName: "딸기")
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.bananaJuice, menuName: "바나나")
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.strawberryBananaJuice, menuName: "딸기바나나")
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.pineappleJuice, menuName: "파인애플")
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.mangoJuice, menuName: "망고")
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.kiwiJuice, menuName: "키위")
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.mangoKiwiJuice, menuName: "망고키위")
    }
    
    func tryMakingJuice(menu: [JuiceMenu], menuName: String) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menu)
            try juiceMaker.fruitStore.consumeStock(recipe: menu)
            alertSufficientStock(juiceName: "\(menuName)")
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
