//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, kobe
// 

import UIKit

class ViewController: UIViewController {
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

	let juiceMaker = JuiceMaker(equalizedStock: 10)
	
	override func viewDidLoad() {
        super.viewDidLoad()
		showStock()
        addButtonAction()
    }
	
	private func showStock() {
		
		let fruitStock: [Fruit: Int] = juiceMaker.getFruitInventoryStatus()
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
	
	private func addButtonAction() {
		strawberryBananaJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		mangoKiwiJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		strawberryJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		bananaJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		pineappleJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		kiwiJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
		mangoJuiceButton.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
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
        guard let stockViewController =
				self.storyboard?.instantiateViewController(identifier: "StockViewController") else { return }
        
        do {
            try juiceMaker.makeFruitJuice(menu: menuName)
            showStock()
            let alert = UIAlertController(title: "\(menuName.name) 나왔습니다!",
										  message: "맛있게 드세요!",
										  preferredStyle: .alert)
            let ok = UIAlertAction(title: "야호!",
								   style: .default,
								   handler: nil)
            
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } catch StockError.fruitNotFound {
            print(StockError.fruitNotFound.message)
        } catch StockError.outOfStock {
            let alert = UIAlertController(title: "재료가 모자라요.",
										  message: "재고를 수정할까요?",
										  preferredStyle: .alert)
            let ok = UIAlertAction(title: "예",
								   style: .default,
								   handler: { _ in
                self.navigationController?.show(stockViewController, sender: self)
            })
            let cancel = UIAlertAction(title: "아니오",
									   style: .default,
									   handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        } catch {
            print(StockError.unKnown.message)
        }
    }
}

