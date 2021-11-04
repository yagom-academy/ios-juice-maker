//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/26.
//

import UIKit

class StockManagerViewController: UIViewController {
    @IBOutlet var currentStrawberryStockLabel: UILabel!
    @IBOutlet var currentBananaStockLabel: UILabel!
    @IBOutlet var currentPineappleStockLabel: UILabel!
    @IBOutlet var currentKiwiStockLabel: UILabel!
    @IBOutlet var currentMangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStockLabels()
        setupNavigationBar()
    }
    
    private func setupStockLabels() {
        let currentFruitStock = juiceMaker.retrieveCurrentFruitStock()
        let fruits = currentFruitStock.keys
        let amounts = currentFruitStock.values
        
        for (fruit, amount) in zip(fruits, amounts) {
            updateStockLabel(of: fruit, by: amount)
        }
    }
    
    private func updateStockLabel(of fruit: Fruit, by amount: Int) {
        switch fruit {
        case .strawberry:
            self.currentStrawberryStockLabel.text = "\(amount)"
        case .bananna:
            self.currentBananaStockLabel.text = "\(amount)"
        case .pineapple:
            self.currentPineappleStockLabel.text = "\(amount)"
        case .kiwi:
            self.currentKiwiStockLabel.text = "\(amount)"
        case .mango:
            self.currentMangoStockLabel.text = "\(amount)"
        }
    }
    
    private func setupNavigationBar() {
        let navigationBarItem = UINavigationItem()
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissStockManagerVC))
        let add = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissStockManagerVC))
        navigationBarItem.leftBarButtonItem = cancel
        navigationBarItem.rightBarButtonItem = add
        navigationBarItem.title = "재고 수정"
        
        let width = self.view.frame.width
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 32))
        navigationBar.isTranslucent = false
        navigationBar.items = [navigationBarItem]
        self.view.addSubview(navigationBar)
    }
    
    @objc
    private func dismissStockManagerVC() {
        dismiss(animated: true, completion: nil)
    }
}


