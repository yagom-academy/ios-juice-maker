//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    private let juiceMaker: JuiceMaking = JuiceMaker(store: FruitStore())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFruitStockLabels()
        NotificationCenter.default.addObserver(self, selector: #selector(didFruitStockChange(_:)), name: .FruitStockChanged, object: nil)
    }
    
    @IBAction func juiceOrderButtonDidTap(_ sender: UIButton) {
        do {
            let juiceMenu = try matchJuiceMenu(with: sender)
            try juiceMaker.makeJuice(menu: juiceMenu)
            showSuccessAlert(juiceMenu: juiceMenu)
        } catch FruitStoreError.stockShortage {
            showFailureAlert()
        } catch let error {
            showErrorAlert(error: error)
        }
    }

    @IBAction func modifyStockButtonDidTap(_ sender: UIBarButtonItem) {
        moveToStockModifyView()
    }
    
    @objc func didFruitStockChange(_ notification: Notification) {
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
    
    func updateLabel(fruit: Fruit) throws {
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
    
    func initializeFruitStockLabels() {
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
    
    func matchJuiceMenu(with button: UIButton) throws -> JuiceMenu {
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
    
    func showSuccessAlert(juiceMenu: JuiceMenu) {
        let alert = UIAlertController(title: nil, message: juiceMenu.rawValue + AlertMessage.juiceMakeSuccess.korean, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok.korean, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showFailureAlert() {
        let alert = UIAlertController(title: nil, message: FruitStoreError.stockShortage.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.modifyStock.korean, style: .default) { _ in self.moveToStockModifyView() }
        let noAction = UIAlertAction(title: AlertMessage.cancel.korean, style: .cancel)
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
    
    func showErrorAlert(error: Error) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok.korean, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardSegue.toStockModifyView.identifier {
            guard let stockModifyViewNavigationController = segue.destination as? UINavigationController else {
                return
            }
            guard let stockModifyViewController = stockModifyViewNavigationController.visibleViewController as? StockModifyViewController else {
                return
            }
            stockModifyViewController.juiceMaker = self.juiceMaker
        }
    }
    
    func moveToStockModifyView() {
        performSegue(withIdentifier: StoryboardSegue.toStockModifyView.identifier, sender: nil)
    }
}
