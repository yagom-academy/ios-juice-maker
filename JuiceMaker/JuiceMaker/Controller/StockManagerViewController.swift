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
        self.title = "Stock Manager"
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToJuiceMaker))
        let add = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backToJuiceMaker))
        self.navigationItem.leftBarButtonItem = cancel
        self.navigationItem.rightBarButtonItem = add
    }
    
    @objc
    private func backToJuiceMaker() {
        dismiss(animated: true, completion: nil)
    }
}


