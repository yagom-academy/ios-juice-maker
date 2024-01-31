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
        
        initLabel()
    }
    
    @IBAction func modifyStockButtonTapped(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") as? ModifyStockViewController else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.present(navigationController, animated: true)
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
    
    func initLabel() {
        for fruit in FruitCategory.allCases {
            var fruitCount = String(juiceMaker.manageFruitStore(fruit: fruit))
            
            switch fruit {
            case .strawberry:
                self.strawberryStockLabel.text = fruitCount
            case .banana:
                self.bananaStockLabel.text = fruitCount
            case .pineapple:
                self.pineappleStockLabel.text = fruitCount
            case .kiwi:
                self.kiwiStockLabel.text = fruitCount
            case .mango:
                self.mangoStockLabel.text = fruitCount
            }
        }
    }
    
    func tryMakingJuice(menu: [JuiceMenu], menuName: String) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menu)
            try juiceMaker.consumeFruit(recipe: menu)
            alertSufficientStock(menu: menu, juiceName: "\(menuName)")
        } catch FruitStoreError.outOfStock {
            alertInsufficientStock()
        } catch FruitStoreError.invalidFruitName {
            print("유효하지 않은 과일 이름입니다.")
        } catch {
            print("잘못된 입력입니다.")
        }
    }
    
    func updateMenu(menu: [JuiceMenu]) {
        for fruit in menu {
            switch fruit {
            case .recipe(let fruitName, _):
                do {
                    try self.updateFruitCount(fruitName: fruitName)
                } catch FruitStoreError.invalidFruitName {
                    print("유효하지 않은 과일 이름입니다.")
                } catch {
                    print("잘못된 입력입니다.")
                }
            }
        }
    }
    
    func updateFruitCount(fruitName: FruitCategory) throws {
        let fruitNumberForLabel = String(juiceMaker.manageFruitStore(fruit: fruitName))

        switch fruitName {
        case .strawberry:
            self.strawberryStockLabel.text = fruitNumberForLabel
        case .banana:
            self.bananaStockLabel.text = fruitNumberForLabel
        case .pineapple:
            self.pineappleStockLabel.text = fruitNumberForLabel
        case .kiwi:
            self.kiwiStockLabel.text = fruitNumberForLabel
        case .mango:
            self.mangoStockLabel.text = fruitNumberForLabel
        }
        
        print("\(fruitName.koreanName)의 수량은 \(fruitNumberForLabel)입니다.")
    }
    
    func alertSufficientStock(menu: [JuiceMenu], juiceName: String) {
        let alert = UIAlertController(title: "알림", message: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default) { _ in
            self.updateMenu(menu: menu)
        }
        
        alert.addAction(confirm)
        
        present(alert, animated: true, completion: nil)
    }
    
    func alertInsufficientStock() {
        let alert = UIAlertController(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "예", style: .default)  { _ in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") as? ModifyStockViewController else {
                return
            }
            self.present(vc, animated: true)
        }
        
        let close = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(confirm)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
}
