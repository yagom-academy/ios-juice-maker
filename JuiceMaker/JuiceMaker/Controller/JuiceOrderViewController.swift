//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    @IBOutlet var fruitStockLabels: [UILabel] = []
    @IBOutlet var juiceOrderButtons: [UIButton] = []
    
    let juiceMaker = JuiceMaker(fruitStore: FruitStore(fruitInventory: [.strawberry: 10,
                                                                        .banana: 10,
                                                                        .pineapple: 10,
                                                                        .kiwi: 10,
                                                                        .mango: 10]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabels()
        setJuiceOrderButtonTag()
    }
    
    private func updateFruitStockLabels() {
        for (index, fruitStockLabel) in fruitStockLabels.enumerated() {
            guard let fruit = Fruit(rawValue: index),
                  let fruitCount = juiceMaker.fruitStore.getCurrentStock(of: fruit) else { return }
            fruitStockLabel.text = "\(fruitCount)"
        }
    }
    
    private func setJuiceOrderButtonTag() {
        for (tag, juiceOrderButton) in juiceOrderButtons.enumerated() {
            juiceOrderButton.tag = tag
        }
    }
    
    private func pushStockChangeViewController() {
        guard let stockChangeVC = storyboard?.instantiateViewController(withIdentifier: "StockChangeViewController") as? StockChangeViewController else { return }
        
        self.navigationController?.pushViewController(stockChangeVC, animated: true)
    }
    
    @IBAction func tapStockChangeButton(_ sender: UIBarButtonItem) {
        pushStockChangeViewController()
    }
    
    private func presentInsufficientStockAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) { _ in
            self.pushStockChangeViewController()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func presentJuiceReadyAlert(with juice: Juice) {
        let message = "\(juice.description) 나왔습니다! 맛있게 드세요!"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let selectedJuice = Juice(rawValue: sender.tag) else { return }
        let result = juiceMaker.make(selectedJuice)
        
        switch result {
        case .success(let juice):
            presentJuiceReadyAlert(with: juice)
            updateFruitStockLabels()
        case .failure(let error):
            guard let errorMessage = error.errorDescription else { return }
            presentInsufficientStockAlert(with: errorMessage)
        }
    }
}

