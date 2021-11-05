//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

// MARK: - Properties and Lifecycle
class JuiceMakerViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var orderMangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var orderStrawberryJuiceButton: UIButton!
    @IBOutlet weak var orderBananaJuiceButton: UIButton!
    @IBOutlet weak var orderPineappleJuiceButton: UIButton!
    @IBOutlet weak var orderKiwiJuiceButton: UIButton!
    @IBOutlet weak var orderMangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabels()
        setUpbuttonLabelFontAttributes()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fruitLabelChanged(notification:)), name: .changedFruitStockNotification, object: nil)
    }
}

// MARK: - Setup Label and Button
extension JuiceMakerViewController {
    func setUpbuttonLabelFontAttributes() {
        orderStrawberryBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderMangoKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderStrawberryJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderPineappleJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        orderMangoJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        orderStrawberryBananaJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderMangoKiwiJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderStrawberryJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderBananaJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderPineappleJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderKiwiJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        orderMangoJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func updateFruitLabels() {
        do {
            let strawberryStock = try juiceMaker.fruitStore.stock(fruit: .strawberry)
            let bananaStock = try juiceMaker.fruitStore.stock(fruit: .banana)
            let pineappleStock = try juiceMaker.fruitStore.stock(fruit: .pineapple)
            let kiwiStock = try juiceMaker.fruitStore.stock(fruit: .kiwi)
            let mangoStock = try juiceMaker.fruitStore.stock(fruit: .mango)
            
            updateCurrentStockLabel(stock: strawberryStock, label: strawberryStockLabel)
            updateCurrentStockLabel(stock: bananaStock, label: bananaStockLabel)
            updateCurrentStockLabel(stock: pineappleStock, label: pineappleStockLabel)
            updateCurrentStockLabel(stock: kiwiStock, label: kiwiStockLabel)
            updateCurrentStockLabel(stock: mangoStock, label: mangoStockLabel)
        } catch {
            guard let requestError = error as? RequestError else { return }
            showNotificationAlert(message: requestError.errorDescription)
        }
    }
    
    func updateCurrentStockLabel(stock: Int, label: UILabel) {
        label.text = stock.description
    }
    
    func fruitlabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStockLabel
        case .banana:
            return bananaStockLabel
        case .pineapple:
            return pineappleStockLabel
        case .kiwi:
            return kiwiStockLabel
        case .mango:
            return mangoStockLabel
        }
    }
}

// MARK: - Order Juice
extension JuiceMakerViewController {
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        let juice: Juice
        
        switch sender {
        case orderStrawberryBananaJuiceButton:
            juice = .strawberryBanana
        case orderMangoKiwiJuiceButton:
            juice = .mangoKiwi
        case orderStrawberryJuiceButton:
            juice = .strawberry
        case orderBananaJuiceButton:
            juice = .banana
        case orderPineappleJuiceButton:
            juice = .pineapple
        case orderKiwiJuiceButton:
            juice = .kiwi
        case orderMangoJuiceButton:
            juice = .mango
        default:
            showNotificationAlert(message: Message.unknownError.description)
            return
        }
        
        mixFruit(juice: juice)
    }
    
    func mixFruit(juice: Juice) {
        do {
            try juiceMaker.mixFruit(juice: juice)
            showNotificationAlert(message: Message.juiceFinish(juice: juice).description)
        } catch RequestError.fruitStockOut {
            showOutOfStockAlert()
        } catch let error as RequestError {
            showNotificationAlert(message: error.errorDescription)
        } catch {
            showNotificationAlert(message: Message.unknownError.description)
        }
    }
    
    func showNotificationAlert(message: String, title: String = Text.ok.title) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: title, style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func showOutOfStockAlert() {
        let alert = UIAlertController(title: nil, message: Message.outOfStock.description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Text.cancel.title, style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: Text.ok.title, style: .default, handler: presentFruitStoreViewController)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Transition
extension JuiceMakerViewController {
    private func presentFruitStoreViewController(_ action: UIAlertAction) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") as? UINavigationController else { return }
        self.present(viewController, animated: true, completion: nil)
        guard let nextViewController = viewController.topViewController as? FruitStoreViewController else { return }
        nextViewController.juiceMaker = juiceMaker
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController else { return }
        guard let nextViewController = navigationController.topViewController as? FruitStoreViewController else { return }
        nextViewController.juiceMaker = juiceMaker
    }
    

}

// MARK: - Notification
extension JuiceMakerViewController {
    @objc func fruitLabelChanged(notification: Notification) {
        guard let fruitStock = notification.object as? FruitStock else {
            showNotificationAlert(message: Message.unknownError.description)
            return
        }
        updateCurrentStockLabel(stock: fruitStock.stock, label: fruitlabel(of: fruitStock.fruit))
    }
}
