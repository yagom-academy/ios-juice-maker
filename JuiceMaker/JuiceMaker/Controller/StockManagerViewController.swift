//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/26.
//

import UIKit

class StockManagerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissStockManagerVC))
        let add = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissStockManagerVC))
        
        self.title = "Stock Manager"
        self.navigationItem.leftBarButtonItem = cancel
        self.navigationItem.rightBarButtonItem = add
    }
    
    @objc
    private func dismissStockManagerVC() {
        dismiss(animated: true, completion: nil)
    }
}


