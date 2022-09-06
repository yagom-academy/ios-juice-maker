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
		maker.makeJuice(juice: orderedJuice)
		showAlertController(isSuccess: false, juice: orderedJuice)
	}
	
	func showAlertController(isSuccess: Bool, juice: Juice) {
		let titleMessage = isSuccess ? "주문 완료" : "주문 불가"
		let message = isSuccess ? "\(juice.description) 나왔습니다! 맛있게 드세요!" : "재료가 모자라요. 재고를 수정할까요?"
		let confirmMessage = isSuccess ? "확인" : "예"
		let cancelMessage = isSuccess ? "" : "아니요"
		
		let alertController = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: confirmMessage, style: .default) { action in
			if !isSuccess {
				print("is Not Success")
			}
		}
		let cancelAction = UIAlertAction(title: cancelMessage, style: .default)
		
		if isSuccess {
			alertController.addAction(okAction)
		} else {
			alertController.addAction(cancelAction)
			alertController.addAction(okAction)
		}
		
		present(alertController, animated: true)
	}
}
