//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	let juiceMaker = JuiceMaker()
	
    var stockAlert: UIAlertController{
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
    
    var completeAlert: UIAlertController {
        let alert = UIAlertController(title: "확인", message: "***쥬스가 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)

        alert.addAction(
            UIAlertAction(
                title: "감사합니다",
                style: .default,
                handler: nil
            )
        )
        
        return alert
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
        changePineappleStockUILabel()
        changeKiwiStockUILabel()
        changeMangoStockUILabel()
        changeBananaStockUILabel()
        changeStrawberryStockUILabel()
	}
	
	@IBOutlet weak var strawberryStockLabel: UILabel!
	@IBOutlet weak var bananaStockLabel: UILabel!
	@IBOutlet weak var pineappleStockLabel: UILabel!
	@IBOutlet weak var kiwiStockLabel: UILabel!
	@IBOutlet weak var mangoStockLabel: UILabel!

    
    @IBAction func makeStrawNanaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.orderJuice(menu: .strawNanaJuice)
            
            changeStrawberryStockUILabel()
            changeBananaStockUILabel()
            
            self.present(completeAlert, animated: false, completion: nil)

        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeStrawberryJuice(_ sender: UIButton) {
        do {
            try juiceMaker.orderJuice(menu: .strawberryJuice)
            
            changeStrawberryStockUILabel()
            
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeMangoKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.orderJuice(menu: .mangoKiwiJuice)
            
            changeMangoStockUILabel()
            changeKiwiStockUILabel()
            
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeMangoJuice(_ sender: UIButton) {
        do {
            try juiceMaker.orderJuice(menu: .mangoJuice)
            
            changeMangoStockUILabel()
            
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    
    @IBAction func makeKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.orderJuice(menu: .kiwiJuice)
            
            changeKiwiStockUILabel()
            
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makeBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.orderJuice(menu: .bananaJuice)
            
            changeBananaStockUILabel()
            
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    @IBAction func makePineappleJuice(_ sender: UIButton) {
        do {
            try juiceMaker.orderJuice(menu: .pineappleJuice)
            
            changePineappleStockUILabel()
            
        } catch {
            self.present(stockAlert, animated: false, completion: nil)
        }
    }
    
    func changeStrawberryStockUILabel() {
        let strawberryStore = juiceMaker.fruitStores.filter { $0.name == .strawberry }.first
        
        if let strawberryLeft = strawberryStore?.stock {
            strawberryStockLabel.text = "\(strawberryLeft)"
        }
    }
    
    func changeBananaStockUILabel() {
        let bananaStore = juiceMaker.fruitStores.filter{ $0.name == .banana }.first
        
        if let bananaLeft = bananaStore?.stock {
            bananaStockLabel.text = "\(bananaLeft)"
        }
    }
    
    func changePineappleStockUILabel() {
        let pineappleStore = juiceMaker.fruitStores.filter { $0.name == .pineapple }.first
        
        if let pineappleLeft = pineappleStore?.stock {
            pineappleStockLabel.text = "\(pineappleLeft)"
        }
    }
    
    func changeMangoStockUILabel() {
        let mangoStore = juiceMaker.fruitStores.filter{ $0.name == .mango }.first
        
        if let mangoLeft = mangoStore?.stock {
            mangoStockLabel.text = "\(mangoLeft)"
        }
    }
    
    func changeKiwiStockUILabel() {
        let kiwiStore = juiceMaker.fruitStores.filter{ $0.name == .kiwi }.first
        
        if let kiwiLeft = kiwiStore?.stock {
            kiwiStockLabel.text = "\(kiwiLeft)"
        }
    }
}
