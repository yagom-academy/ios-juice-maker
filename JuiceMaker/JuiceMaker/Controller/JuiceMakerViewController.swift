//
//  JuiceMakerViewController - JuiceMakerViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class JuiceMakerViewController: UIViewController, ModifyStockDelegate {
	private let store = FruitStore()
	lazy var maker = JuiceMaker(store: store)
	
    @IBOutlet var fruitLabels: [UILabel]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
        setUpStockLabels(changedStocks: Fruit.beginningStock)
		receiveStockChangedNoti()
	}
	
	private func receiveStockChangedNoti() {
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(didChangeStocks(noti:)),
			name: Notification.Name.stockChanged,
			object: nil
		)
	}
	
	@objc func didChangeStocks(noti: Notification) {
		guard let stocks = noti.userInfo as? [Fruit: Int] else {
			return
		}
		setUpStockLabels(changedStocks: stocks)
	}
	
	private func setUpStockLabels(changedStocks: [Fruit: Int]) {
		fruitLabels.compactMap { $0 }.forEach {
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
        showAlertControllerBased(on: result, of: orderedJuice)
	}
	
	private func showAlertControllerBased(on isMaked: Bool, of juice: Juice) {
		let titleMessage = isMaked ? AlertMessages.successTitle : AlertMessages.failureTitle
		let message = isMaked ? "\(juice.description) \(AlertMessages.successMessage)" : AlertMessages.failureMessage
		let confirmMessage = isMaked ? AlertMessages.successConfirmMessage : AlertMessages.failureConfirmMessage
		let alertController = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: confirmMessage, style: .default) { _ in
			if !isMaked {
                self.presentModiftController()
			}
		}
		
		if isMaked {
			alertController.addAction(okAction)
		} else {
			let cancelAction = UIAlertAction(title: AlertMessages.failureCancelMessage, style: .default)
			alertController.addAction(cancelAction)
			alertController.addAction(okAction)
		}
		
		present(alertController, animated: true)
	}
    
    @IBAction func didTapEditButton(_ sender: UIButton) {
        presentModiftController()
    }
    
    func presentModiftController() {
        self.performSegue(withIdentifier: ModifyViewController.identifier, sender: nil)
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == ModifyViewController.identifier {
			guard let nabViewController = segue.destination as? UINavigationController,
				  let controller = nabViewController.viewControllers.first as? ModifyViewController else {
				return
			}
			controller.inventory = store.inventory
			controller.delegate = self
		}
	}
	
	func updateValues(changedStock: [Fruit : Int]) {
		store.inventory = changedStock
	}
}
