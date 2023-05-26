//
//  JuiceMaker - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, kobe
// 

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func changeFruitInventory(fruitStockStatus: [Fruit: Int])
}

class MainViewController: UIViewController {
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
	
	@IBOutlet private weak var strawberryStockLabel: UILabel!
	@IBOutlet private weak var bananaStockLabel: UILabel!
	@IBOutlet private weak var pineappleStockLabel: UILabel!
	@IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!

	private let juiceMaker = JuiceMaker(equalizedStock: 10)
    private lazy var fruitStock: [Fruit: Int] = juiceMaker.getFruitInventoryStatus()
	
	override func viewDidLoad() {
        super.viewDidLoad()
        addButtonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        replaceStockLabel()
    }
	
	private func addButtonAction() {
		strawberryBananaJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		mangoKiwiJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		strawberryJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		bananaJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		pineappleJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		kiwiJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		mangoJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
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
	
	@objc private func orderMenu(_ sender: UIButton) {
		switch sender {
		case strawberryBananaJuiceButton:
			orderJuice(.strawberryBananaJuice)
		case mangoKiwiJuiceButton:
			orderJuice(.mangoKiwiJuice)
		case strawberryJuiceButton:
			orderJuice(.strawberryJuice)
		case bananaJuiceButton:
			orderJuice(.bananaJuice)
		case pineappleJuiceButton:
			orderJuice(.pineappleJuice)
		case kiwiJuiceButton:
			orderJuice(.kiwiJuice)
		case mangoJuiceButton:
			orderJuice(.mangoJuice)
		default:
			break
		}
	}
    
	private func orderJuice(_ menuName: FruitJuice) {
		do {
			try juiceMaker.makeFruitJuice(menu: menuName)
			fruitStock = juiceMaker.getFruitInventoryStatus()
			replaceStockLabel()
			showAlert(type: .menuOut(menu: menuName.name))
		} catch StockError.fruitNotFound {
			print(StockError.fruitNotFound.message)
		} catch StockError.outOfStock {
			showAlert(type: .outOfStock)
		} catch {
			print(StockError.unKnown.message)
		}
	}
	
    private func showAlert(type: AlertText) {
        let alert = UIAlertController(title: type.title,
                                      message: type.message,
                                      preferredStyle: .alert)
        
        switch type {
        case .menuOut:
            let okAlertAction = UIAlertAction(title: AlertActionText.interjection.title,
                                   style: .default,
                                   handler: nil)
    
            alert.addAction(okAlertAction)
        case .outOfStock:
            let okAlertAction = UIAlertAction(title: AlertActionText.ok.title,
                                   style: .default,
                                   handler: { _ in
				self.presentStockViewController()
            })
            let cancelAlertAction = UIAlertAction(title: AlertActionText.cancel.title,
                                       style: .default,
                                       handler: nil)
            
            alert.addAction(okAlertAction)
            alert.addAction(cancelAlertAction)
        default:
            break
        }
        present(alert, animated: true, completion: nil)
    }
	
	@IBAction private func presentStockViewController() {
		let storyboard = UIStoryboard(name: Identifier.mainStoryboard.name, bundle: nil)
        let stockViewController = storyboard.instantiateViewController(
			identifier: Identifier.stockViewController.name,
            creator: { coder in
                return StockViewController(coder: coder, fruitStock: self.fruitStock)
            })
		stockViewController.delegate = self
        
		stockViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
		self.navigationController?.present(stockViewController, animated: true)
	}
}

extension MainViewController: MainViewControllerDelegate {
	func changeFruitInventory(fruitStockStatus: [Fruit: Int]) {
		juiceMaker.changeFruitStock(fruitStockStatus)
		fruitStock = fruitStockStatus
	}
}
