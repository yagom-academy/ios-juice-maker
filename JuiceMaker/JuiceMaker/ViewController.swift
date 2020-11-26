//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    let strawberry = JuiceMaker.common.fruits[.strawberry]
    let banana = JuiceMaker.common.fruits[.banana]
    let mango = JuiceMaker.common.fruits[.mango]
    let kiwi = JuiceMaker.common.fruits[.kiwi]
    let pineapple = JuiceMaker.common.fruits[.pineapple]
    
    override func viewWillAppear(_ animated: Bool) {
        updateFruitStockLabel()
    }
    
    func make(juice: JuiceName) {
        do {
            try JuiceMaker.common.make(juice: juice)
            showSuccessAlert(about: juice)
            updateFruitStockLabel(juice: juice)
        } catch JuiceMakerError.outOfStock {
            showOutOfStockAlert()
        } catch {
            showMachineErrorAlert()
        }
    }
    
    @IBAction func touchUpStrawberryJuiceButton() {
        make(juice: .strawberryJuice)
    }
    
    @IBAction func touchUpBananaJuiceButton() {
        make(juice: .bananaJuice)
    }
    
    @IBAction func touchUpMangoJuiceButton() {
        make(juice: .mangoJuice)
    }
    
    @IBAction func touchUpKiwiJuiceButton() {
        make(juice: .kiwiJuice)
    }
    
    @IBAction func touchUpPineappleJuiceButton() {
        make(juice: .pineappleJuice)
    }
    
    @IBAction func touchUpStrawberryBananaJuiceButton() {
        make(juice: .strawberryBananaJuice)
    }
    
    @IBAction func touchUpMangoKiwiJuiceButton() {
        make(juice: .mangoKiwiJuice)
    }
    
    @IBAction func touchUpMoveToStockViewButton() {
        moveToManageStockPage()
    }
    
    private func showSuccessAlert(about juice: JuiceName) {
        let message = juice.rawValue + Message.success.rawValue
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: { _ in
                                        self.updateFruitStockLabel(juice: juice)
                                     })
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    private func showOutOfStockAlert() {
        let alert = UIAlertController(title: nil,
                                      message: Message.outOfStock.rawValue,
                                      preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "yes",
                                      style: .default,
                                      handler: { _ in
                                        self.moveToManageStockPage()
                                      })
        let noButton = UIAlertAction(title: "no",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
    }
    
    private func showMachineErrorAlert() {
        let alert = UIAlertController(title: "ERROR", message: Message.machineError.rawValue, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    private func moveToManageStockPage() {
        guard let currentStoryboard = self.storyboard else { return }
        
        let stockViewController = currentStoryboard.instantiateViewController(withIdentifier: "StockViewController")
        
        stockViewController.modalPresentationStyle = .fullScreen
        present(stockViewController, animated: true, completion: nil)
    }
    
    private func updateFruitStockLabel() {
        strawberryStockLabel.text = String(strawberry?.amount ?? 0)
        bananaStockLabel.text = String(banana?.amount ?? 0)
        mangoStockLabel.text = String(mango?.amount ?? 0)
        kiwiStockLabel.text = String(kiwi?.amount ?? 0)
        pineappleStockLabel.text = String(pineapple?.amount ?? 0)
    }
    
    private func updateFruitStockLabel(juice: JuiceName) {
        guard let selctedjuice = JuiceMaker.common.recipes[juice] else { return }
        
        switch selctedjuice.name {
        case .strawberryJuice:
            strawberryStockLabel.text = String(strawberry?.amount ?? 0)
        case .bananaJuice:
            bananaStockLabel.text = String(banana?.amount ?? 0)
        case .mangoJuice:
            mangoStockLabel.text = String(mango?.amount ?? 0)
        case .kiwiJuice:
            kiwiStockLabel.text = String(kiwi?.amount ?? 0)
        case .pineappleJuice:
            pineappleStockLabel.text = String(pineapple?.amount ?? 0)
        case .strawberryBananaJuice:
            strawberryStockLabel.text = String(strawberry?.amount ?? 0)
            bananaStockLabel.text = String(banana?.amount ?? 0)
        case .mangoKiwiJuice:
            mangoStockLabel.text = String(mango?.amount ?? 0)
            kiwiStockLabel.text = String(kiwi?.amount ?? 0)
        }
    }
}
