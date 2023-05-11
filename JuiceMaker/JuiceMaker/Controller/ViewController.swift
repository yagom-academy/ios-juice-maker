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
        strawberryBananaJuice.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
        mangoKiwiJuice.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
        strawberryJuice.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
        bananaJuice.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
        pineappleJuice.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
        kiwiJuice.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
        mangoJuice.addTarget(self, action: #selector(orderMenu(_:)), for: .touchUpInside)
    }
    
	@objc func orderMenu(_ sender: UIButton) {
        switch sender {
        case strawberryBananaJuice:
            orderJuice(.strawberryBananaJuice)
        case mangoKiwiJuice:
            orderJuice(.mangoKiwiJuice)
        case strawberryJuice:
            orderJuice(.strawberryJuice)
        case bananaJuice:
            orderJuice(.bananaJuice)
        case pineappleJuice:
            orderJuice(.pineappleJuice)
        case kiwiJuice:
            orderJuice(.kiwiJuice)
        case mangoJuice:
            orderJuice(.mangoJuice)
        default:
            break
        }
    }
    
    private func orderJuice(_ menuName: FruitJuice) {
        do {
            try juiceMaker.makeFruitJuice(menu: menuName)
            
        } catch StockError.fruitNotFound {
            print(StockError.fruitNotFound.message)
        } catch StockError.outOfStock {
            guard let stockViewController = self.storyboard?.instantiateViewController(identifier: "StockViewController") else { return }
            let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "예", style: .default, handler: { _ in
                self.navigationController?.show(stockViewController, sender: self)
            })
            let cancel = UIAlertAction(title: "아니오", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
        } catch {
            print(StockError.unKnown.message)
        }
    }
}

