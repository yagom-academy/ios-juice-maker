//
//  JuiceMakerViewController - JuiceMakerViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
	private let maker = JuiceMaker()
	
	@IBOutlet weak var strawberryStockLabel: UILabel!
	@IBOutlet weak var bananaStockLabel: UILabel!
	@IBOutlet weak var pineAppleStockLabel: UILabel!
	@IBOutlet weak var kiwiStockLabel: UILabel!
	@IBOutlet weak var mangoStockLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		receiveStockChangedNoti()
	}
	
	func receiveStockChangedNoti() {
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(didChangeStocks(noti:)),
			name: NSNotification.Name("stockChanged"),
			object: nil
		)
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
		let result = maker.makeJuice(juice: orderedJuice)
		showAlertController(isSuccess: result, juice: orderedJuice)
	}
	
	func showAlertController(isSuccess: Bool, juice: Juice) {
		let titleMessage = isSuccess ? AlertMessages.successTitle : AlertMessages.failureTitle
		let message = isSuccess ? "\(juice.description) \(AlertMessages.successMessage)" : AlertMessages.failureMessage
		let confirmMessage = isSuccess ? AlertMessages.successConfirmMessage : AlertMessages.failureConfirmMessage
		
		let alertController = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: confirmMessage, style: .default) { _ in
			if !isSuccess {
				self.performSegue(withIdentifier: "presentModify", sender: nil)
			}
		}
		
		if isSuccess {
			alertController.addAction(okAction)
		} else {
			let cancelAction = UIAlertAction(title: AlertMessages.failureCancelMessage, style: .default)
			alertController.addAction(cancelAction)
			alertController.addAction(okAction)
		}
		
		present(alertController, animated: true)
	}
}
