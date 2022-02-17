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
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
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
        self.setupCountLabels()
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
    
    func setupCountLabels() {
        guard let fruitStore: FruitStoreType = self.fruitStore else {
            self.touchDismissButton()
            return
        }
        
        fruitStore.store.forEach { fruit, currentCount in
            self.updateCountLabel(of: fruit, to: currentCount)
        }
    }
    
}

// MARK: - Extension For Actions

extension ManageStockViewController {
    
    @objc private func touchDismissButton() {
        guard let presentingViewController: UINavigationController = presentingViewController as? UINavigationController else {
            return
        }
        
        presentingViewController.dismiss(animated: true) {
            guard let orderViewController: OrderViewController = presentingViewController.viewControllers[0] as? OrderViewController else {
                return
            }
            
            orderViewController.didChangeStock()
        }
    }
    
    /// Returns each fruit count label's reference according to the fruit type
    private func getCountLabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return self.strawberryCountLabel
        case .banana:
            return self.bananaCountLabel
        case .pineapple:
            return self.pineappleCountLabel
        case .kiwi:
            return self.kiwiCountLabel
        case .mango:
            return self.mangoCountLabel
        }
    }
    
    private func updateCountLabel(of fruit: Fruit, to count: Int) {
        let label: UILabel = self.getCountLabel(of: fruit)
        label.text = "\(count)"
    }
    
}
