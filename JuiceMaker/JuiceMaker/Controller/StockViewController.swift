//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minseong Kang on 2023/05/11.
//

import UIKit

class StockViewController: UIViewController {
	@IBOutlet private weak var strawberryStockLabel: UILabel!
	@IBOutlet private weak var bananaStockLabel: UILabel!
	@IBOutlet private weak var pineappleStockLabel: UILabel!
	@IBOutlet private weak var kiwiStockLabel: UILabel!
	@IBOutlet private weak var mangoStockLabel: UILabel!
	
	private var fruitStock: [Fruit: Int] = [:]
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(initializeFruitStock(notification:)),
											   name: NSNotification.Name("stockChange"),
											   object: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		replaceStockLabel()
    }
	
	private func replaceStockLabel() {
		guard let strawberryStock = fruitStock[.strawberry],
			  let bananaStock = fruitStock[.banana],
			  let pineappleStock = fruitStock[.pineapple],
			  let kiwiStock = fruitStock[.kiwi],
			  let mangoStock = fruitStock[.mango]
		else { return }
		
		strawberryStockLabel.text = String(strawberryStock)
		bananaStockLabel.text = String(bananaStock)
		pineappleStockLabel.text = String(pineappleStock)
		kiwiStockLabel.text = String(kiwiStock)
		mangoStockLabel.text = String(mangoStock)
	}
	
	@objc private func initializeFruitStock(notification: NSNotification) {
		guard let fruitStockStatus = notification.userInfo?["fruitStock"] as? [Fruit: Int] else {
			return
		}
		fruitStock = fruitStockStatus
	}
}
