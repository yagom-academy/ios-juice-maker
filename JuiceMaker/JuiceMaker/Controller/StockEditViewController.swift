//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/23/24.
//

import UIKit

final class StockEditViewController: UIViewController, StockEditViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let stockEditView = self.view as? StockEditView else {
            return
        }
        stockEditView.delegate = self
    }
    
    func exitStockEditView() {
        self.dismiss(animated: true)
    }
}
