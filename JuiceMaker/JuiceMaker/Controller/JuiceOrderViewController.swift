//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    private var juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureJuiceOrderView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureJuiceOrderView()
    }

    @IBAction private func clickStock() {
        convertStockScreen()
    }
    
    @IBAction private func clickOrderJuiceButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            orderJuice(to: .strawberryJuice)
        case 2:
            orderJuice(to: .bananaJuice)
        case 3:
            orderJuice(to: .pineappleJuice)
        case 4:
            orderJuice(to: .kiwiJuice)
        case 5:
            orderJuice(to: .mangoJuice)
        case 6:
            orderJuice(to: .strawberryBananaJuice)
        case 7:
            orderJuice(to: .mangoKiwiJuice)
        default:
            break
        }
        
        configureJuiceOrderView()
    }
    
    private func configureJuiceOrderView() {
        let stock = juiceMaker.fruitStore.fruitStock.compactMapValues { stock in
            return String(stock)
        }
        
        strawberryLabel.text = stock[.strawberry]
        bananaLabel.text = stock[.banana]
        kiwiLabel.text = stock[.kiwi]
        pineappleLabel.text = stock[.pineapple]
        mangoLabel.text = stock[.mango]
    }
    
    private func orderJuice(to juice: Juice) {
        do {
            try juiceMaker.createJuice(juice: juice)
            alertJuiceReady(message: "\(juice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!")
        } catch FruitStoreError.outOfStock {
            alertLowInventory(message: "재료가 모자라요. 재고를 수정할까요?")
        } catch {
            print(error)
        }
    }
    
    private func alertJuiceReady(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(checkAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func alertLowInventory(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "아니오", style: .default)
        let okAction = UIAlertAction(title: "예", style: .default) { action in
            self.convertStockScreen()
        }
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func convertStockScreen() {
        guard let viewController = storyboard?.instantiateViewController(identifier: "StockViewController") as? StockViewController else { return }
        
        viewController.fruitInventory = juiceMaker.fruitStore.fruitStock
        
        viewController.delegate = self
        
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

extension JuiceOrderViewController: StockDelegate {
    func updateStock(to inventory: [Fruit : Int]) {
        juiceMaker.fruitStore.changeFruitStock(to: inventory)
    }
}
