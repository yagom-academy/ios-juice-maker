//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

class ManageStockViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    
    // MARK: - Property
    
    var fruitStore: FruitStoreType?
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.title = "재고 추가"
        self.setupBarItem()
    }

}

// MARK: - Extension For Setup Funcs

extension ManageStockViewController {
    
    func setupBarItem() {
        let dismissButton: UIBarButtonItem = UIBarButtonItem(title: "닫기")
        dismissButton.target = self
        dismissButton.action = #selector(touchDismissButton)
        self.navigationItem.rightBarButtonItem = dismissButton
    }
    
}

// MARK: - Extension For Actions

extension ManageStockViewController {
    
    @objc private func touchDismissButton() {
        guard let presentingViewController: OrderViewController = presentingViewController as? OrderViewController else {
            return
        }
        
        presentingViewController.dismiss(animated: true) {
            presentingViewController.didChangeStock()
        }
    }
    
}
