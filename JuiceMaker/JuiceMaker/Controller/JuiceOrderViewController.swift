//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet private weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet private weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet var juiceOrderButtons: [UIButton]!
    
    private lazy var juiceMaker: JuiceMaking = JuiceMaker(store: FruitStore())

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didFruitStockChange(_:)), name: .FruitStockChanged, object: nil)
        setJuiceOrderButtons()
        updateAllLabels()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .FruitStockChanged, object: nil)
    }
}

// MARK: - IBAction Method
extension JuiceOrderViewController {
    @IBAction private func juiceOrderButtonDidTap(_ sender: UIButton) {
        orderJuice(button: sender)
    }

    @IBAction private func modifyStockButtonDidTap(_ sender: UIBarButtonItem) {
        presentStockModifyView()
    }
}

// MARK: - View Method
extension JuiceOrderViewController {
    private func updateLabel(fruit: Fruit) throws {
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = String(try juiceMaker.currentFruitStock(of: .strawberry))
        case .banana:
            bananaStockLabel.text = String(try juiceMaker.currentFruitStock(of: .banana))
        case .pineapple:
            pineappleStockLabel.text = String(try juiceMaker.currentFruitStock(of: .pineapple))
        case .kiwi:
            kiwiStockLabel.text = String(try juiceMaker.currentFruitStock(of: .kiwi))
        case .mango:
            mangoStockLabel.text = String(try juiceMaker.currentFruitStock(of: .mango))
        }
    }
    
    private func updateAllLabels() {
        do {
            strawberryStockLabel.text = String(try juiceMaker.currentFruitStock(of: .strawberry))
            bananaStockLabel.text = String(try juiceMaker.currentFruitStock(of: .banana))
            pineappleStockLabel.text = String(try juiceMaker.currentFruitStock(of: .pineapple))
            kiwiStockLabel.text = String(try juiceMaker.currentFruitStock(of: .kiwi))
            mangoStockLabel.text = String(try juiceMaker.currentFruitStock(of: .mango))
        } catch let error {
            showErrorAlert(error: error)
        }
    }
    
    private func setJuiceOrderButtons() {
        juiceOrderButtons.forEach { button in
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.titleLabel?.textAlignment = .center
        }
    }
}

// MARK: - Model Method
extension JuiceOrderViewController {
    private func juiceMenu(for button: UIButton) throws -> JuiceMenu {
        switch button {
        case strawberryBananaJuiceOrderButton:
            return .strawberryBanana
        case mangoKiwiJuiceOrderButton:
            return .mangoKiwi
        case strawberryJuiceOrderButton:
            return .strawberry
        case bananaJuiceOrderButton:
            return .banana
        case pineappleJuiceOrderButton:
            return .pineapple
        case kiwiJuiceOrderButton:
            return .kiwi
        case mangoJuiceOrderButton:
            return .mango
        default:
            throw JuiceOrderError.invalidJuiceOrder
        }
    }
    
    private func orderJuice(button: UIButton) {
        do {
            let juice = try juiceMenu(for: button)
            try juiceMaker.makeJuice(menu: juice)
            showSuccessAlert(juiceMenu: juice)
        } catch FruitStoreError.stockShortage {
            showFailureAlert()
        } catch let error {
            showErrorAlert(error: error)
        }
    }
}

// MARK: - NotificationCenter Method
extension JuiceOrderViewController {
    @objc private func didFruitStockChange(_ notification: Notification) {
        guard let fruit = notification.object as? Fruit else {
            showErrorAlert(error: FruitStoreError.invalidFruit)
            return
        }
        do{
            try updateLabel(fruit: fruit)
        } catch let error {
            showErrorAlert(error: error)
        }
    }
}

// MARK: - Alert Method
extension JuiceOrderViewController {
    private func showSuccessAlert(juiceMenu: JuiceMenu) {
        let alertController = UIAlertController(title: nil, message: juiceMenu.name + AlertMessage.juiceMakeSuccess, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    private func showFailureAlert() {
        let alertController = UIAlertController(title: nil, message: FruitStoreError.stockShortage.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.modifyStock, style: .default) { _ in self.presentStockModifyView() }
        let cancelAction = UIAlertAction(title: AlertMessage.cancel, style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func showErrorAlert(error: Error) {
        let alertController = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

// MARK: - View Transition Method
extension JuiceOrderViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == StoryboardSegue.toStockModifyView,
              let stockModifyViewNavigationController = segue.destination as? UINavigationController,
              let stockModifyViewController = stockModifyViewNavigationController.visibleViewController as? StockModifyViewController else {
            showErrorAlert(error: ViewTransitionError.viewTransitionFailed)
            return
        }
        stockModifyViewController.juiceMaker = self.juiceMaker
    }
    
    private func presentStockModifyView() {
        performSegue(withIdentifier: StoryboardSegue.toStockModifyView, sender: nil)
    }
}
