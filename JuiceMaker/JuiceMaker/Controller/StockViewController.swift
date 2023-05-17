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
    @IBOutlet private weak var closeBarButtonItem: UIBarButtonItem!
	
	@IBOutlet private weak var strawberryStepper: UIStepper!
	@IBOutlet private weak var bananaStepper: UIStepper!
	@IBOutlet private weak var pineappleStepper: UIStepper!
	@IBOutlet private weak var kiwiStepper: UIStepper!
	@IBOutlet private weak var mangoStepper: UIStepper!
    
	private var fruitStock: [Fruit: Int] = [:]
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(initializeFruitStock(notification:)),
                                               name: NSNotification.Name.stockChangeStart,
											   object: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		replaceStockLabel()
        setUpCloseBarButtonItem()
		setUpStepper()
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.setUpNotificationPost()
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
		guard let fruitStockStatus = notification.userInfo?[NotificationKey.fruitStock] as? [Fruit: Int] else {
			return
		}
		fruitStock = fruitStockStatus
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
            let ok = UIAlertAction(title: AlertActionText.ok.title,
                                   style: .default,
                                   handler: { _ in
                self.dismiss(animated: true)
            })
            let cancel = UIAlertAction(title: AlertActionText.cancel.title,
                                       style: .default,
                                       handler: { _ in
                self.dismiss(animated: true)
            })
            alert.addAction(ok)
            alert.addAction(cancel)
        default:
            break
        }
        present(alert, animated: true, completion: nil)
    }
    
    private func setUpNotificationPost() {
        NotificationCenter.default.post(name: NSNotification.Name.stockChangeEnd,
                                        object: nil,
                                        userInfo: [NotificationKey.fruitStock: fruitStock])
    }
	
	@IBAction private func touchUpStepper(_ sender: UIStepper) {
		sender.minimumValue = 0.0
		sender.stepValue = 1.0
		sender.isContinuous = true
		sender.autorepeat = true
		
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
}
