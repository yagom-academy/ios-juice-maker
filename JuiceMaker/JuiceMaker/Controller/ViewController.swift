//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, kobe
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryBananaJuice: UIButton!
    @IBOutlet weak var mangoKiwiJuice: UIButton!
    @IBOutlet weak var strawberryJuice: UIButton!
    @IBOutlet weak var bananaJuice: UIButton!
    @IBOutlet weak var pineappleJuice: UIButton!
    @IBOutlet weak var kiwiJuice: UIButton!
    @IBOutlet weak var mangoJuice: UIButton!
	
	@IBOutlet var strawberryStock: UILabel!
	@IBOutlet weak var bananaStock: UILabel!
	@IBOutlet weak var pineappleStock: UILabel!
	@IBOutlet weak var kiwiStock: UILabel!
	@IBOutlet weak var manggoStock: UILabel!
	
	let fruitStore = FruitStore(equalizedStock: 10)
	lazy var juiceMaker = JuiceMaker(fruitStore: fruitStore)

	override func viewDidLoad() {
        super.viewDidLoad()
        strawberryBananaJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        mangoKiwiJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        strawberryJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        bananaJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        pineappleJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        kiwiJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        mangoJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
    }
    
	@objc func orderJuice(_ sender: UIButton) {
		
		do {
			try juiceMaker.makeFruitJuice(menu: .kiwiJuice)
			
		} catch StockError.fruitNotFound {
			print(StockError.fruitNotFound.message)
		} catch StockError.outOfStock {
			let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
			let ok = UIAlertAction(title: "예", style: .default, handler: nil)
			let cancel = UIAlertAction(title: "아니오", style: .default, handler: nil)
			
			alert.addAction(ok)
			alert.addAction(cancel)
			
			present(alert, animated: true, completion: nil)
		} catch {
			print(StockError.unKnown.message)
		}
    }
}

