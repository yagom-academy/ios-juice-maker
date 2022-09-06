//
//  JuiceMaker - ViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class ViewController: UIViewController {
	private let maker = JuiceMaker()
	
	@IBOutlet weak var strawberryStockLabel: UILabel!
	@IBOutlet weak var bananaStockLabel: UILabel!
	@IBOutlet weak var pineAppleStockLabel: UILabel!
	@IBOutlet weak var kiwiStockLabel: UILabel!
	@IBOutlet weak var mangoStockLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self,
											   selector: #selector(didChangeStocks(noti:)),
											   name: NSNotification.Name("stockChanged"),
											   object: nil)
	}
	
	@objc func didChangeStocks(noti: Notification) {
		guard let stocks = noti.userInfo as? [Fruit: Int] else {
			return
		}
		setUpStockLabels(changedStocks: stocks)
	}
	
	func setUpStockLabels(changedStocks: [Fruit: Int]) {
		[
			strawberryStockLabel,
			bananaStockLabel,
			pineAppleStockLabel,
			kiwiStockLabel,
			mangoStockLabel,
		].compactMap { $0 }.forEach {
			if let fruit = Fruit(rawValue: $0.tag),
			   let stock = changedStocks[fruit]?.description {
				$0.text = stock
			}
		}
	}
	
	@IBAction func didTapJuiceButton(_ sender: UIButton) {
		guard let orderedJuice = Juice(rawValue: sender.tag) else {
			return
		}
		maker.makeJuice(juice: orderedJuice)
	}
}
