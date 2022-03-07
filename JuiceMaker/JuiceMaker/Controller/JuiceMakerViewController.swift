//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    @IBOutlet private var fruitsLabelCollection: [UILabel]!
    var fruitStore = FruitStore()
    let orderJuice = JuiceMaker()
    
    @IBAction private func changeViewControllerTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let ChangeStockViewController = storyboard.instantiateViewController(withIdentifier: "ChangeStockViewController")
        if let naviController = navigationController {
            naviController.pushViewController(ChangeStockViewController, animated: false)
        } else {
            JuiceMakerError.notExistNavigationController
        }
    }
    
    @IBAction private func OrderJuicesbuttonPressed(_ sender: UIButton) {
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
            guard let pushViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewController")  else { return }
            self.navigationController?.pushViewController(pushViewController, animated: true)
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
