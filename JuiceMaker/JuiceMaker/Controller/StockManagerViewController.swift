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


