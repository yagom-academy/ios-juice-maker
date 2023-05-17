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
                self.dismiss(animated: true) {
                    // 메모리 관리, 순환 참조
                    self.setUpNotificationPost()
                }
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
}
