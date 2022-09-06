//
//  JuiceMaker - ViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class ViewController: UIViewController {
	private let maker = JuiceMaker()
	private let shared = FruitStore.shared
	
	@IBOutlet weak var strawberryStockLabel: UILabel!
	@IBOutlet weak var bananaStockLabel: UILabel!
	@IBOutlet weak var pineAppleStockLabel: UILabel!
	@IBOutlet weak var kiwiStockLabel: UILabel!
	@IBOutlet weak var mangoStockLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpStockLabels()
	}
	
	func setUpStockLabels() {
		[
			strawberryStockLabel,
			bananaStockLabel,
			pineAppleStockLabel,
			kiwiStockLabel,
			mangoStockLabel,
		].compactMap { $0 }.forEach {
			if let fruit = Fruit(rawValue: $0.tag) {
				$0.text = shared.inventory[fruit]?.description
			}
		}
	}
	
	@IBAction func didTapJuiceButton(_ sender: UIButton) {
		guard let orderedJuice = Juice(rawValue: sender.tag) else {
			return
		}
		maker.makeJuice(juice: orderedJuice)
		setUpStockLabels()
	}
}
