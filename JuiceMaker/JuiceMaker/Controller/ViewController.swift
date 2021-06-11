//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {

    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBAction func orderDdalbaJuice(_ sender: Any) {
        juiceMaker.makeJuice(recipe: .ddalbaJuice)
    }
    
    @IBAction func orderMangkiJuice(_ sender: Any) {
        juiceMaker.makeJuice(recipe: .mangoKiwiJuice)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: Any) {
        juiceMaker.makeJuice(recipe: .strawberryJuice)
    }
    
    @IBAction func orderBananaJuice(_ sender: Any) {
        juiceMaker.makeJuice(recipe: .bananaJuice)
    }
    
    @IBAction func orderPineappleJuice(_ sender: Any) {
        juiceMaker.makeJuice(recipe: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuice(_ sender: Any) {
        juiceMaker.makeJuice(recipe: .mangoKiwiJuice)
    }
    
    @IBAction func orderMangoJuice(_ sender: Any) {
        juiceMaker.makeJuice(recipe: .mangoJuice)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stocks = FruitStore.fruitStore.lookUpStocks()
        for (fruit, quantity) in stocks {
            switch fruit {
            case .strawberry:
                strawberryStockLabel?.text = "\(quantity)"
            case .banana:
                bananaStockLabel?.text = "\(quantity)"
            case .pineapple:
                pineappleStockLabel?.text = "\(quantity)"
            case .kiwi:
                kiwiStockLabel?.text = "\(quantity)"
            case .mango:
                mangoStockLabel?.text = "\(quantity)"
            }
        }
    }
    
	func showOrderSuccessAlert(message: String) {
		let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "네!", style: .default)
		
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}
}

