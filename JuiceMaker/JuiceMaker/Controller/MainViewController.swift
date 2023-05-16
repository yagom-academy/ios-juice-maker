//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        NotificationCenter.default.addObserver(self, selector: #selector(onChangedStock(_:)), name: Notification.Name("updatedStock"), object: nil)
    }
    
    @objc private func onChangedStock(_ notification: NSNotification) {
        if let stock = notification.userInfo!["fruitStock"], let fruitStock = stock as? [Fruit: Int] {
            self.strawberryStockLabel.text = String(fruitStock[.strawberry]!)
            self.bananaStockLabel.text = String(fruitStock[.banana]!)
            self.pineappleStockLabel.text = String(fruitStock[.pineapple]!)
            self.kiwiStockLabel.text = String(fruitStock[.kiwi]!)
            self.mangoStockLabel.text = String(fruitStock[.mango]!)
        }
    }
    
    private func configureLabel() {
        self.strawberryStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.strawberry]!)
        self.bananaStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.banana]!)
        self.pineappleStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.pineapple]!)
        self.kiwiStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.kiwi]!)
        self.mangoStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.mango]!)
    }
    
    @IBAction func onTouchStockButton(_ sender: UIBarButtonItem) {
        guard let vcStock = self.storyboard?.instantiateViewController(identifier: "StockViewController") as? UINavigationController else {
            return
        }
        self.navigationController?.present(vcStock, animated: true)
    }
    
    @IBAction func onTouchOrderButton(_ sender: UIButton) {
        var result: Result<Juice, FruitStoreError> = .failure(.unknown)
        
        switch sender.titleLabel?.text {
        case "딸바쥬스 주문":
            result = self.juiceMaker.makeJuice(juice: .strawberryBananaJuice)
        case "망키쥬스 주문":
            result = self.juiceMaker.makeJuice(juice: .mangoKiwiJuice)
        case "딸기쥬스 주문":
            result = self.juiceMaker.makeJuice(juice: .strawberryJuice)
        case "바나나쥬스 주문":
            result = self.juiceMaker.makeJuice(juice: .bananaJuice)
        case "파인애플쥬스 주문":
            result = self.juiceMaker.makeJuice(juice: .pineappleJuice)
        case "키위쥬스 주문":
            result = self.juiceMaker.makeJuice(juice: .kiwiJuice)
        case "망고쥬스 주문":
            result = self.juiceMaker.makeJuice(juice: .mangoJuice)
        default:
            print("알 수 없는 주문")
        }
        
        switch result {
        case .success(let juice):
            let alert = UIAlertController(title: "주문", message: "\(juice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
        case .failure(_):
            let alert = UIAlertController(title: "재고 부족", message: "재료가 모잘라요. 재고를 수정할까요?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "아니오", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
                guard let vcStock = self.storyboard?.instantiateViewController(identifier: "StockViewController") as? UINavigationController else {
                    return
                }
                self.navigationController?.present(vcStock, animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
