//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

class ManageStockViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: JMStepper!
    @IBOutlet weak private var bananaStepper: JMStepper!
    @IBOutlet weak private var pineappleStepper: JMStepper!
    @IBOutlet weak private var kiwiStepper: JMStepper!
    @IBOutlet weak private var mangoStepper: JMStepper!
    
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
        self.configureBarItem()
        self.configureCountLabels()
        self.configureSteppers()
    }

    @IBAction func stepperValueChanged(_ sender: JMStepper) {
        guard let fruitStore = self.fruitStore,
              let fruit = sender.fruitType
        else {
            return
        }
        let updatedCount = Int(sender.value)
        fruitStore.changeStock(of: fruit, to: updatedCount)
        self.updateCountLabel(of: fruit, to: updatedCount)
    }
}

// MARK: - Extension For Setup Funcs

extension ManageStockViewController {
    
    private func configureBarItem() {
        let dismissButton: UIBarButtonItem = UIBarButtonItem(title: "닫기")
        dismissButton.target = self
        dismissButton.action = #selector(touchDismissButton)
        self.navigationItem.rightBarButtonItem = dismissButton
    }
    
    private func configureCountLabels() {
        guard let fruitStore: FruitStoreType = self.fruitStore
        else {
            self.touchDismissButton()
            return
        }
        
        fruitStore.store.forEach { fruit, currentCount in
            self.updateCountLabel(of: fruit, to: currentCount)
        }
    }
    
    private func configureSteppers() {
        guard let fruitStore: FruitStoreType = self.fruitStore
        else {
            self.touchDismissButton()
            return
        }
        
        fruitStore.store.forEach { fruit, currentCount in
            let stepper = self.getStepper(for: fruit)
            stepper.fruitType = fruit
            stepper.wraps = false
            stepper.autorepeat = true
            stepper.value = Double(currentCount)
            stepper.minimumValue = 0
            stepper.maximumValue = 100
        }
    }
}

// MARK: - Extension For Actions

extension ManageStockViewController {
    
    @objc private func touchDismissButton() {
        guard let presentingViewController: UINavigationController = presentingViewController as? UINavigationController
        else {
            return
        }
        
        if let orderViewController = presentingViewController.viewControllers.last as? OrderViewController {
            orderViewController.didChangeStock()
        }
        
        presentingViewController.dismiss(animated: true)
    }
    
    /// Returns each fruit count label's reference according to the fruit type
    private func getCountLabel(for fruit: Fruit) -> UILabel {
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
    
    /// Returns each fruit's stepper reference according to the fruit type
    private func getStepper(for fruit: Fruit) -> JMStepper {
        switch fruit {
        case .strawberry:
            return self.strawberryStepper
        case .banana:
            return self.bananaStepper
        case .pineapple:
            return self.pineappleStepper
        case .kiwi:
            return self.kiwiStepper
        case .mango:
            return self.mangoStepper
        }
    }
    
    private func updateCountLabel(of fruit: Fruit, to count: Int) {
        let label: UILabel = self.getCountLabel(for: fruit)
        DispatchQueue.main.async {
            label.text = "\(count)"
        }
    }
    
}
