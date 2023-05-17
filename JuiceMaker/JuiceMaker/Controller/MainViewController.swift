//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.juiceMaker.setDelegate(by: self)
        configureLabel()
    }
    
    private func configureLabel() {
        self.strawberryStockLabel.text = juiceMaker.getStock(fruit: .strawberry).toString
        self.bananaStockLabel.text = juiceMaker.getStock(fruit: .banana).toString
        self.pineappleStockLabel.text = juiceMaker.getStock(fruit: .pineapple).toString
        self.kiwiStockLabel.text = juiceMaker.getStock(fruit: .kiwi).toString
        self.mangoStockLabel.text = juiceMaker.getStock(fruit: .mango).toString
    }
    
    @IBAction func onTouchStockButton(_ sender: UIBarButtonItem) {
        let stockViewController = StockViewController.instantiate()
        self.navigationController?.present(stockViewController, animated: true)
    }
    
    @IBAction func onTouchOrderButton(_ sender: UIButton) {        
        switch sender.titleLabel?.text {
        case "딸바쥬스 주문":
            showAlert(result: self.juiceMaker.makeJuice(juice: .strawberryBananaJuice))
        case "망키쥬스 주문":
            showAlert(result: self.juiceMaker.makeJuice(juice: .mangoKiwiJuice))
        case "딸기쥬스 주문":
            showAlert(result: self.juiceMaker.makeJuice(juice: .strawberryJuice))
        case "바나나쥬스 주문":
            showAlert(result: self.juiceMaker.makeJuice(juice: .bananaJuice))
        case "파인애플쥬스 주문":
            showAlert(result: self.juiceMaker.makeJuice(juice: .pineappleJuice))
        case "키위쥬스 주문":
            showAlert(result: self.juiceMaker.makeJuice(juice: .kiwiJuice))
        case "망고쥬스 주문":
            showAlert(result: self.juiceMaker.makeJuice(juice: .mangoJuice))
        default:
            showAlert(result: .failure(.unknown))
        }
    }
    
    private func showAlert(result: Result<Juice, FruitStoreError>) {
        switch result {
        case .success(let juice):
            let alert = UIAlertController(
                title: "주문",
                message: "\(juice.name) 나왔습니다! 맛있게 드세요!",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(
                title: "잘먹겠습니다❤️",
                style: .default,
                handler: nil
            ))
            
            self.present(alert, animated: true, completion: nil)
            
        case .failure(let error):
            let alert = UIAlertController(
                title: error.errorTitle,
                message: error.errorDescription,
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(
                title: "아니오",
                style: .default,
                handler: nil
            ))
            
            alert.addAction(UIAlertAction(
                title: "예",
                style: .default,
                handler: { _ in
                let stockViewController = StockViewController.instantiate()
                self.navigationController?.present(stockViewController, animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension MainViewController: FruitStoreDelegate {
    func onChangeStock() {
        self.configureLabel()
    }
}
