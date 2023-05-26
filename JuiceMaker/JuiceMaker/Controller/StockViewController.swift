//
//  JuiceMaker - StockViewController.swift
//  Created by Minseong Kang on 2023/05/11.
//  last modified by maxhyunm, kobe
//

import UIKit

class StockViewController: UIViewController {
	@IBOutlet private weak var strawberryStockLabel: UILabel!
	@IBOutlet private weak var bananaStockLabel: UILabel!
	@IBOutlet private weak var pineappleStockLabel: UILabel!
	@IBOutlet private weak var kiwiStockLabel: UILabel!
	@IBOutlet private weak var mangoStockLabel: UILabel!
	
    @IBOutlet private weak var closeBarButtonItem: UIBarButtonItem!
	
	@IBOutlet private weak var strawberryStepper: UIStepper!
	@IBOutlet private weak var bananaStepper: UIStepper!
	@IBOutlet private weak var pineappleStepper: UIStepper!
	@IBOutlet private weak var kiwiStepper: UIStepper!
	@IBOutlet private weak var mangoStepper: UIStepper!
    
	private var fruitStock: [Fruit: Int]
    weak var delegate: MainViewControllerDelegate?
    
    init?(coder: NSCoder, fruitStock: [Fruit: Int]) {
        self.fruitStock = fruitStock
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
		replaceStockLabel()
		setUpStepper()
        setUpCloseBarButtonItem()
    }
	
	private func replaceStockLabel() {
		guard let strawberryStock = fruitStock[.strawberry],
			  let bananaStock = fruitStock[.banana],
			  let pineappleStock = fruitStock[.pineapple],
			  let kiwiStock = fruitStock[.kiwi],
			  let mangoStock = fruitStock[.mango] else {
			return
		}
		
		strawberryStockLabel.text = String(strawberryStock)
		bananaStockLabel.text = String(bananaStock)
		pineappleStockLabel.text = String(pineappleStock)
		kiwiStockLabel.text = String(kiwiStock)
		mangoStockLabel.text = String(mangoStock)
	}
	
	private func setUpStepper() {
		guard let strawberryStock = fruitStock[.strawberry],
			  let bananaStock = fruitStock[.banana],
			  let pineappleStock = fruitStock[.pineapple],
			  let kiwiStock = fruitStock[.kiwi],
			  let mangoStock = fruitStock[.mango] else {
			return
		}
		
		strawberryStepper.value = Double(strawberryStock)
		bananaStepper.value = Double(bananaStock)
		pineappleStepper.value = Double(pineappleStock)
		kiwiStepper.value = Double(kiwiStock)
		mangoStepper.value = Double(mangoStock)
	}
    
    private func setUpCloseBarButtonItem() {
        closeBarButtonItem.target = self
        closeBarButtonItem.action = #selector(dismissStockViewController)
    }
    
    @objc private func dismissStockViewController() {
        showAlert(type: .confirmStockChange)
    }
    
	private func showAlert(type: AlertText) {
		let alert = UIAlertController(title: type.title,
									  message: type.message,
									  preferredStyle: .alert)
		
		switch type {
		case .confirmStockChange:
			let okAlertAction = UIAlertAction(title: AlertActionText.ok.title,
											  style: .default,
											  handler: { _ in
				self.removeStockViewController(isChange: true)
			})
			let cancelAlertAction = UIAlertAction(title: AlertActionText.cancel.title,
												  style: .default,
												  handler: { _ in
				self.removeStockViewController(isChange: false)
			})
			alert.addAction(okAlertAction)
			alert.addAction(cancelAlertAction)
		default:
			break
		}
		present(alert, animated: true, completion: nil)
	}
    
    private func removeStockViewController(isChange: Bool) {
        if isChange {
            delegate?.changeFruitInventory(fruitStockStatus: fruitStock)
        }
        self.dismiss(animated: true)
    }
    
	@IBAction private func touchUpStepper(_ sender: UIStepper) {
		switch sender {
		case strawberryStepper:
			fruitStock[.strawberry] = Int(sender.value)
			strawberryStockLabel.text = String(Int(sender.value))
		case bananaStepper:
			fruitStock[.banana] = Int(sender.value)
			bananaStockLabel.text = String(Int(sender.value))
		case pineappleStepper:
			fruitStock[.pineapple] = Int(sender.value)
			pineappleStockLabel.text = String(Int(sender.value))
		case kiwiStepper:
			fruitStock[.kiwi] = Int(sender.value)
			kiwiStockLabel.text = String(Int(sender.value))
		case mangoStepper:
			fruitStock[.mango] = Int(sender.value)
			mangoStockLabel.text = String(Int(sender.value))
		default:
			break
		}
	}
}
