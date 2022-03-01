//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceStoreViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStock()
    }
    
    @IBAction private func orderStrawberryBananaButton(_ sender: Any) {
        juiceMaker.makeJuice(.strawberryBanana) ? showSuccessAlert(juice: .strawberryBanana) : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction private func orderStrawberryButton(_ sender: Any) {
        juiceMaker.makeJuice(.strawberry) ? showSuccessAlert(juice: .strawberry) : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction private func orderBananaButton(_ sender: Any) {
        juiceMaker.makeJuice(.banana) ? showSuccessAlert(juice: .banana) : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction private func orderPineappleButton(_ sender: Any) {
        juiceMaker.makeJuice(.pineapple) ? showSuccessAlert(juice: .pineapple) : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction private func orderMangoKiwiButton(_ sender: Any) {
        juiceMaker.makeJuice(.mangoKiwi) ? showSuccessAlert(juice: .mangoKiwi) : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction private func orderKiwiButton(_ sender: Any) {
        juiceMaker.makeJuice(.kiwi) ? showSuccessAlert(juice: .kiwi) : showFailureAlert()
        updateFruitStock()
    }
    
    @IBAction private func orderMangoButton(_ sender: Any) {
        juiceMaker.makeJuice(.mango) ? showSuccessAlert(juice: .mango) : showFailureAlert()
        updateFruitStock()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EditFruitStockViewController" else { return }
        if let navigationController = segue.destination as? UINavigationController,
           let editFruitStockViewController = navigationController.topViewController as? EditFruitStockViewController {
            asignFruitStock(to: editFruitStockViewController)
        }
    }
    
    private func updateFruitStock() {
        strawberryStockLabel.text = juiceMaker.fruitStore.bringStockValue(for: .strawberry)
        bananaStockLabel.text = juiceMaker.fruitStore.bringStockValue(for: .banana)
        pineappleStockLabel.text = juiceMaker.fruitStore.bringStockValue(for:.pineapple)
        kiwiStockLabel.text = juiceMaker.fruitStore.bringStockValue(for: .kiwi)
        mangoStockLabel.text = juiceMaker.fruitStore.bringStockValue(for: .mango)
    }
    
    private func showSuccessAlert(juice: Juice) {
        let successAlertViewController = UIAlertController(title: juice.name+AlertMessage.cameOut.description,
                                                           message: AlertMessage.enjoyDrink.description,
                                                           preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok.description,
                                     style: .default,
                                     handler: nil)
        successAlertViewController.addAction(okAction)
        present(successAlertViewController, animated: true, completion: nil)
    }
    
    private func showFailureAlert() {
        let failureAlertViewController = UIAlertController(title: AlertMessage.outOfStock.description,
                                                           message: AlertMessage.editStock.description,
                                                           preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.yes.description,
                                     style: .default) { _ in
            self.moveEditFruitStockViewController()
        }
        let noAction = UIAlertAction(title: AlertMessage.no.description,
                                     style: .default, handler: nil)
        failureAlertViewController.addAction(okAction)
        failureAlertViewController.addAction(noAction)
        present(failureAlertViewController, animated: true, completion: nil)
    }
    
    private func moveEditFruitStockViewController() {
        guard let editFruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditFruitStockViewController") else { return }
        asignFruitStock(to: editFruitStockViewController as! EditFruitStockViewController)
        self.present(editFruitStockViewController, animated: true, completion: nil)
    }
    
    private func asignFruitStock(to editFruitStockViewController: EditFruitStockViewController) {
        editFruitStockViewController.strawberryCount = self.strawberryStockLabel.text ?? ""
        editFruitStockViewController.bananaCount = self.bananaStockLabel.text ?? ""
        editFruitStockViewController.pineappleCount = self.pineappleStockLabel.text ?? ""
        editFruitStockViewController.kiwiCount = self.kiwiStockLabel.text ?? ""
        editFruitStockViewController.mangoCount = self.mangoStockLabel.text ?? ""
    }
}

