//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	let juiceMaker = JuiceMaker()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		strawberryStockLabel.text = "10"
		bananaStockLabel.text = "10"
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
			
		} catch {
			print(error)
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
}
