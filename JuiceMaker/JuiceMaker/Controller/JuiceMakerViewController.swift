//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
        
    @IBOutlet private var juiceOrderButtons: [UIButton]!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initJuiceMakerViewController()
    }
    
    private func initJuiceMakerViewController() {
        changeStockLabel()
        adjustOrderButtonTitle()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeStockLabel), name: FruitStore.shared.didChangeStock, object: nil)
    }

    @objc
    private func changeStockLabel() {
        strawberryStockLabel.text =  FruitStore.shared.showStock(of: .strawberry)
        bananaStockLabel.text =  FruitStore.shared.showStock(of: .banana)
        pineappleStockLabel.text =  FruitStore.shared.showStock(of: .pineapple)
        kiwiStockLabel.text =  FruitStore.shared.showStock(of: .kiwi)
        mangoStockLabel.text =  FruitStore.shared.showStock(of: .mango)
    }
    
    private func adjustOrderButtonTitle() {
        for button in juiceOrderButtons {
            button.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
    
    @IBAction private func touchUpOrderButton(_ sender: UIButton) {
        let order = sender.currentTitle?.components(separatedBy: " ").first ?? ""
        
        let juice = Juice(rawValue: order)
        do {
            try juiceMaker.make(juice: juice)
            showCompletedOrderAlert(of: order)
        } catch JuiceMakerError.invalidSelection {
            showInvalidOrderAlert()
        } catch FruitStoreError.outOfStock(let neededFruit) {
            showFailedOrderAlert(fruitAndQuantity: neededFruit)
        } catch {
            print(error)
        }
    }
    
    @IBAction private func tapStockModifyButton(_ sender: UIBarButtonItem) {
        presentStockModifyView()
    }
    
    private func presentStockModifyView() {
        let stockModifyNavController = StockModifyNavController()

        let storyboard = UIStoryboard(name: stockModifyNavController.storyboardName, bundle: nil)
        let stockModifyNC = storyboard.instantiateViewController(identifier: stockModifyNavController.storyboardID)
            
        present(stockModifyNC, animated: true, completion: nil)
    }
    
    private func showInvalidOrderAlert() {
        let message = "메뉴에 없는 주문입니다. 다시 확인해 주세요."
        
        let alert = UIAlertController(title: "주문 실패", message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showCompletedOrderAlert(of order: String) {
        let message = "\(order) 나왔습니다! 맛있게 드세요!"
        
        let alert = UIAlertController(title: "쥬스 완성", message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showFailedOrderAlert(fruitAndQuantity: [Fruit: Int]) {
        let message = "\(DataFormatConverter().convert(using: fruitAndQuantity))가 모자라요. 재고를 수정할까요?"
        
        let alert = UIAlertController(title: "재고 부족", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "재고 수정하기", style: .default) { _ in self.presentStockModifyView() }
        let close = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(close)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}

