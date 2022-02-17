//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
    
    // MARK: - Property

    var juiceMaker: JuiceMaker
    
    // MARK: - Initialize

    required init?(coder: NSCoder) {
        self.juiceMaker = JuiceMaker(fruitStore: FruitStore())
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    // MARK: - Configure
    
    /// Does one-time configuration
    private func configure() {
        self.setupRightBarButtonItem()
        self.didChangeStock()
    }
    
}

// MARK: - Extension For Setup Funcs

extension OrderViewController {
    
    /// Sets up `self.navigationItem.rightBarButtonItem`
    /// and adds action to it.
    func setupRightBarButtonItem() {
        guard let navagationItem: UIBarButtonItem = self.navigationItem.rightBarButtonItem else {
            return
        }
        
        navagationItem.target = self
        navagationItem.action = #selector(presentManageStockViewController)
    }
    
}

// MARK: - Extension For Actions

extension OrderViewController {
    
    // MARK: - Button Action
    
    @IBAction private func touchStrawberryBananaJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .strawberryBananaJuice)
    }
    
    @IBAction private func touchMangoKiwiJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .mangoKiwiJuice)
    }
    
    @IBAction private func touchStrawberryJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .strawberryJuice)
    }
    
    @IBAction private func touchBananaJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .bananaJuice)
    }
    
    @IBAction private func touchPinappleJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .pineappleJuice)
    }
    
    @IBAction private func touchKiwiJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .kiwiJuice)
    }
    
    @IBAction private func touchMangoJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .mangoJuice)
    }
    
    // MARK: - Helper Method of Ordering Juice Process
    
    /// Invokes `juiceMaker.makeJuice(of:result:)`.
    private func orderJuice(menu: Juice) {
        self.juiceMaker.makeJuice(of: menu, result: { result in
            switch result {
            case .success:
                self.didChangeStock()
                self.showAlert(alertTitle: "\(menu.name) 나왔습니다! 맛있게 드세요!")
            case .fail(let error):
                let errorMessage: String? = parseErrorMessage(of: error)
                self.showAlert(
                    alertTitle: "재료가 모자라요. 재고를 수정할까요?",
                    message: errorMessage,
                    okActionTitle: "예",
                    okActionHandler: { _ in self.presentManageStockViewController() },
                    cancelActionTitle: "아니오"
                )
            }
        })
    }
    
    /// Returns error description string by casting `error`.
    /// Returns nil if `error` can't be casted into
    ///`FruitStoreError` or `JuiceMakerError`.
    private func parseErrorMessage(of error: Error) -> String? {
        var errorMessage: String?
        
        if let fruitStoreError: FruitStoreError = error as? FruitStoreError {
            errorMessage = fruitStoreError.errorDescription
        }
        else if let juiceMakerError: JuiceMakerError = error as? JuiceMakerError {
            errorMessage = juiceMakerError.errorDescription
        }
        
        return errorMessage
    }
    
    // MARK: - Fruit Stock Label Related
    
    /// Called in viewDidLoad() and orderJuice(menu:). It changes fruit count labels
    private func didChangeStock() {
        let stocks = self.juiceMaker.fruitStore.store
        
        stocks.forEach { fruit, currentCount in
            let label = self.getCountLabel(of: fruit)
            DispatchQueue.main.async {
                label.text = "\(currentCount)"
            }
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
    
    // MARK: - Presenting ManageStockViewController
    
    /// Presents `UINavigationController` that has
    /// `ManageStockView` as root view controller.
    @objc func presentManageStockViewController() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        if let manageStockNavigationController: UINavigationController = mainStoryboard.instantiateViewController(withIdentifier: "ManageStockNavigation") as? UINavigationController,
           let manageStockViewController: ManageStockViewController = manageStockNavigationController.viewControllers[0] as? ManageStockViewController {
            manageStockNavigationController.modalPresentationStyle = .fullScreen
            manageStockViewController.fruitStore = self.juiceMaker.fruitStore
            present(manageStockNavigationController, animated: true, completion: nil)
        }
    }
    
}
