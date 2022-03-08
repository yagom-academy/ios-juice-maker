//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


final class JuiceMakerViewController: UIViewController {
    
    @IBOutlet var fruitsLabelCollection: [UILabel]!
    var fruitStore = FruitStore()
    let orderJuice = JuiceMaker()
    
    @IBAction private func changeViewControllerTapped(_ sender: Any) {
        guard let ChangeStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
        let notFoundStringLabelCount = "0"
        for fruitLabel in fruitsLabelCollection {
            let fruitsLabelTag = fruitLabel.tag
            if let fruitType = FruitsTypes.init(rawValue: fruitsLabelTag) {
                fruitLabel.text = String(fruitStore.fruits[fruitType] ?? .zero)
                ChangeStockViewController.fruitsNum.append(fruitLabel.text ?? notFoundStringLabelCount)
            }
        }
        if let naviController = navigationController {
            naviController.pushViewController(ChangeStockViewController, animated: true)
        } else {
            JuiceMakerError.notExistNavigationController
        }
    }
    
    @IBAction private func orderJuicesbuttonPressed(_ sender: UIButton) {
        if let juiceType = JuiceTypes.init(rawValue: sender.tag) {
            orderJuices(juice: juiceType)
        }
    }
    
    private func orderJuices(juice: JuiceTypes) {
        var fruitsStock = Dictionary<FruitsTypes, Int>()
        fruitsStock = orderJuice.makeJuice(juice: juice, fruitStore: fruitStore)
        if fruitsStock.isEmpty {
            showStockChangeAlertMessage()
        } else {
            updateFruitsLabel(fruits: fruitsStock)
            showJuiceAlertMessage(juiceMenu: juice)
        }
    }
    
    private func updateFruitsLabel(fruits: [FruitsTypes:Int]) {
        let notFoundFruitCount = 0
        for fruitsLabel in fruitsLabelCollection {
            let fruitsLabelTag = fruitsLabel.tag
            if let fruitType = FruitsTypes.init(rawValue: fruitsLabelTag) {
                fruitsLabelCollection[fruitsLabelTag].text = String(fruits[fruitType] ?? notFoundFruitCount)
            }
        }
    }
    
    private func showStockChangeAlertMessage() {
        let juiceOutOfStockAlert = UIAlertController(title: AlertMessages.outOfStock, message: "", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: AlertMessages.ok, style: .default) {_ in
            guard let ChangeStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
            let notFoundStringLabelCount = "0"
            for fruitLabel in self.fruitsLabelCollection {
                let fruitsLabelTag = fruitLabel.tag
                if let fruitType = FruitsTypes.init(rawValue: fruitsLabelTag) {
                    fruitLabel.text = String(self.fruitStore.fruits[fruitType] ?? .zero)
                    ChangeStockViewController.fruitsNum.append(fruitLabel.text ?? notFoundStringLabelCount)
                }
            }
            self.navigationController?.pushViewController(ChangeStockViewController, animated: true)
        }
        let noButton = UIAlertAction(title: AlertMessages.cancel, style: .destructive, handler: nil)
        juiceOutOfStockAlert.addAction(noButton)
        juiceOutOfStockAlert.addAction(yesButton)
        present(juiceOutOfStockAlert, animated: false, completion: nil)
    }
    
    private func showJuiceAlertMessage(juiceMenu: JuiceTypes) {
        let okButton = UIAlertAction(title: AlertMessages.ok, style: .default, handler: nil)
        let juiceAlert = UIAlertController(title: "\(juiceMenu) \(AlertMessages.completeOrder)", message: "", preferredStyle: .alert)
        juiceAlert.addAction(okButton)
        present(juiceAlert, animated: false, completion: nil)
    }
    
    private func initFruits() {
        let notFoundLabelCount = 0
        for fruitLabel in fruitsLabelCollection {
            let fruitLabelTag = fruitLabel.tag
            if let fruitType = FruitsTypes.init(rawValue: fruitLabelTag) {
                fruitLabel.text = String(fruitStore.fruits[fruitType] ?? notFoundLabelCount)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruits()
    }
}
