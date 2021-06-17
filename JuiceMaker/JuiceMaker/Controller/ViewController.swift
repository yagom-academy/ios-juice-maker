//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    var stockAlert: UIAlertController {
        let alert = UIAlertController(title: "경고!", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "네",
                style: .default,
                handler: { _ in
                    print("go to next scene")
                }
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "아니오",
                style: .destructive,
                handler: nil
            )
        )
        
        return alert
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTextOn(label: strawberryStockLabel, about: .strawberry)
        changeTextOn(label: bananaStockLabel, about: .banana)
        changeTextOn(label: kiwiStockLabel, about: .kiwi)
        changeTextOn(label: mangoStockLabel, about: .mango)
        changeTextOn(label: pineappleStockLabel, about: .pineapple)
    }
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    
    @IBAction func makeStrawNanaJuice(_ sender: UIButton) {
        let currentMenu: JuiceMenu = .strawNanaJuice
        
        do {
            try juiceMaker.orderJuice(menu: currentMenu)
            
            changeTextOn(label: strawberryStockLabel, about: .strawberry)
            changeTextOn(label: bananaStockLabel, about: .banana)
            
            showCompleteAlert(about: currentMenu)
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeStrawberryJuice(_ sender: UIButton) {
        let currentMenu: JuiceMenu = .strawberryJuice
        
        do {
            try juiceMaker.orderJuice(menu: currentMenu)
            
            changeTextOn(label: strawberryStockLabel, about: .strawberry)
            
            showCompleteAlert(about: currentMenu)
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeMangoKiwiJuice(_ sender: UIButton) {
        let currentMenu: JuiceMenu = .mangoKiwiJuice
        
        do {
            try juiceMaker.orderJuice(menu: currentMenu)
            
            changeTextOn(label: mangoStockLabel, about: .mango)
            changeTextOn(label: kiwiStockLabel, about: .kiwi)
            
            showCompleteAlert(about: currentMenu)
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeMangoJuice(_ sender: UIButton) {
        let currentMenu: JuiceMenu = .mangoJuice
        
        do {
            try juiceMaker.orderJuice(menu: currentMenu)
            
            changeTextOn(label: mangoStockLabel, about: .mango)
            
            showCompleteAlert(about: currentMenu)
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    
    @IBAction func makeKiwiJuice(_ sender: UIButton) {
        let currentMenu: JuiceMenu = .kiwiJuice
        
        do {
            try juiceMaker.orderJuice(menu: currentMenu)
            
            changeTextOn(label: kiwiStockLabel, about: .kiwi)
            
            showCompleteAlert(about: currentMenu)
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeBananaJuice(_ sender: UIButton) {
        let currentMenu: JuiceMenu = .bananaJuice
        
        do {
            try juiceMaker.orderJuice(menu: currentMenu)
            
            changeTextOn(label: bananaStockLabel, about: .banana)
            
            showCompleteAlert(about: currentMenu)
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makePineappleJuice(_ sender: UIButton) {
        let currentMenu: JuiceMenu = .pineappleJuice
        
        do {
            try juiceMaker.orderJuice(menu: currentMenu)
            
            changeTextOn(label: pineappleStockLabel, about: .pineapple)
            
            showCompleteAlert(about: currentMenu)
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    func changeTextOn(label: UILabel, about fruit: Fruit) {
        let fruitStore = juiceMaker.fruitStores.filter { $0.name == fruit }.first
        if let stockLeft = fruitStore?.stock {
            label.text = "\(stockLeft)"
        }
    }
    
    
    func showCompleteAlert(about: JuiceMenu){
        let alert = UIAlertController(title: "확인", message: "\(about.rawValue)가 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "감사합니다",
                style: .default,
                handler: nil
            )
        )
        
        self.present(alert, animated: false, completion: nil)
    }
    
}
