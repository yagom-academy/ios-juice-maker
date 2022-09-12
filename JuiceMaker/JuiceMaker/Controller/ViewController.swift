//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, FruitStoreDelegate {
    
    var fruitStore: FruitStore = .init(inventory: [.strawberry: 10, .banana:10, .kiwi: 10, .mango: 10])
    lazy var juiceMaker: JuiceMaker = .init(fruitStore: fruitStore)
    
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryBananaMixJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiMixJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitStockLabel()
        fitText()
    }
    
    @IBAction func touchUpEditStockButton(_ sender: UIBarButtonItem) {
        presentStockEditView()
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        guard let juice: Juice = juice(orderedBy: sender) else {
            return
        }
        let result: Result<Juice, FruitStoreError> = juiceMaker.make(juice)
        switch result {
        case .success(let madeJuice):
            updateFruitStockLabel()
            showOkayAlert("\(madeJuice.name) \(AlertText.juiceCompletion)")
        case .failure(let fruitStoreError):
            switch fruitStoreError {
            case .outOfStock:
                showStockEditAlert(fruitStoreError.localizedDescription)
            case .notInInventoryFruitList:
                showAddFruitsAlert(of: juice, fruitStoreError.localizedDescription)
            default:
                showOkayAlert(fruitStoreError.localizedDescription)
            }
        }
    }
    
    func juice(orderedBy button: UIButton) -> Juice? {
        switch button {
        case strawberryJuiceOrderButton:
            return .strawberryJuice
        case bananaJuiceOrderButton:
            return .bananaJuice
        case kiwiJuiceOrderButton:
            return .kiwiJuice
        case pineappleJuiceOrderButton:
            return .pineappleJuice
        case strawberryBananaMixJuiceOrderButton:
            return .strawberryBananaMixJuice
        case mangoJuiceOrderButton:
            return .mangoJuice
        case mangoKiwiMixJuiceOrderButton:
            return .mangoKiwiMixJuice
        default:
            return nil
        }
    }
    
    func showOkayAlert(_ message: String) {
        let okAction = UIAlertAction(title: AlertText.okay,
                                     style: .default,
                                     handler: nil)
        showAlert(message, alertActions: okAction)
    }
    
    func showStockEditAlert(_ message: String) {
        let editAction = UIAlertAction(title: AlertText.yes,
                                       style: .default) { (action) in
            self.presentStockEditView()
        }
        let cancelAction = UIAlertAction(title: AlertText.no,
                                         style: .default)
        showAlert(message, alertActions: editAction, cancelAction)
    }
    
    func showAddFruitsAlert(of juice: Juice, _ message: String) {
        let addAction = UIAlertAction(title: AlertText.yes,
                                      style: .default) { (action) in
            self.fruitStore.addFruit(of: juice)
            self.updateFruitStockLabel()
        }
        let cancelAction = UIAlertAction(title: AlertText.no,
                                         style: .default)
        showAlert(message, alertActions: addAction, cancelAction)
    }
    
    func showAlert(_ message: String, alertActions: UIAlertAction...) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        for alertAction in alertActions {
            alert.addAction(alertAction)
        }
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func presentStockEditView() {
        guard let stockEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockEditViewController") as? StockEditViewController else {
            return
        }
        stockEditViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: stockEditViewController)
        navigationController.modalTransitionStyle = .coverVertical
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController,
                     animated: true,
                     completion: nil)
    }
    
    func updateFruitStockLabel() {
        if let strawberryStock = try? fruitStore.currentStock(of: .strawberry) {
            strawberryStockLabel.text = "\(strawberryStock)"
        } else {
            strawberryStockLabel.text = FruitStoreError.notExist
        }
        if let bananaStock = try? fruitStore.currentStock(of: .banana) {
            bananaStockLabel.text = "\(bananaStock)"
        } else {
            bananaStockLabel.text = FruitStoreError.notExist
        }
        if let kiwiStock = try? fruitStore.currentStock(of: .kiwi) {
            kiwiStockLabel.text = "\(kiwiStock)"
        } else {
            kiwiStockLabel.text = FruitStoreError.notExist
        }
        if let pineappleStock = try? fruitStore.currentStock(of: .pineapple) {
            pineappleStockLabel.text = "\(pineappleStock)"
        } else {
            pineappleStockLabel.text = FruitStoreError.notExist
        }
        if let mangoStock = try? fruitStore.currentStock(of: .mango) {
            mangoStockLabel.text = "\(mangoStock)"
        } else {
            mangoStockLabel.text = FruitStoreError.notExist
        }
    }
    
    func fitText() {
        let buttons: [UIButton] = [strawberryJuiceOrderButton, bananaJuiceOrderButton, kiwiJuiceOrderButton, pineappleJuiceOrderButton, strawberryBananaMixJuiceOrderButton, mangoJuiceOrderButton, mangoKiwiMixJuiceOrderButton]
        for button in buttons {
            button.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
}
