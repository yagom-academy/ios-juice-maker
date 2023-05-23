//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/15.
//

import UIKit

final class StockManagementViewController: UIViewController {
    private var stockList: [String] = []
    
    @IBOutlet var fruitStockLabelCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStockLabel()
        
    }
    
    @IBAction func goBackPreviousView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    func setStockList(with stockList: [String]) {
        self.stockList = stockList
    }
    
    private func configureStockLabel() {
        for index in fruitStockLabelCollection.indices {
            fruitStockLabelCollection[index].text = stockList[index]
        }
    }
}
