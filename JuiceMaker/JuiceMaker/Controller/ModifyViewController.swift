//
//  ModifyViewController - ModifyViewController.swift
//  Created by Ash, 미니.
//

import UIKit

protocol Stockable {
}

class ModifyViewController: UIViewController {
	static let identifier = "presentModifyViewController"
	var inventory: [Fruit: Int] = Fruit.beginningStock
	
	@IBOutlet weak var strawberryStockLabel: UILabel!
	@IBOutlet weak var bananaStockLabel: UILabel!
	@IBOutlet weak var pineAppleStockLabel: UILabel!
	@IBOutlet weak var kiwiStockLabel: UILabel!
	@IBOutlet weak var mangoStockLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		changeNavBackgroundColor()
		setUpLabels()
	}
	
	func changeNavBackgroundColor() {
		navigationController?.navigationBar.backgroundColor = .systemGray5
	}
	
	@IBAction func didTapDismissButton(_ sender: UIBarButtonItem) {
		dismiss(animated: true)
	}
	
	func setUpLabels() {
		[
			strawberryStockLabel,
			bananaStockLabel,
			pineAppleStockLabel,
			kiwiStockLabel,
			mangoStockLabel,
		].compactMap { $0 }.forEach {
			if let fruit = Fruit(rawValue: $0.tag),
			   let stock = inventory[fruit]?.description {
				$0.text = stock
			}
		}
	}
}
