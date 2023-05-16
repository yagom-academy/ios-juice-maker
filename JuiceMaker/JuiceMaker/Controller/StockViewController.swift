//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup & Serena on 2023/05/15.
//

import UIKit

class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    private func configureNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "닫기",
            style: .plain,
            target: self,
            action: #selector(onTouchCloseButton)
        )
        self.navigationItem.title = "재고추가"
    }
    
    @objc private func onTouchCloseButton() {
        self.dismiss(animated: true)
    }
}
