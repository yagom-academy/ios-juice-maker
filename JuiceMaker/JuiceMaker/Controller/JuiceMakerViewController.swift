//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    @IBOutlet var fruitsLabelCollection: [UILabel]!
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    @IBOutlet var fruitsButtonCollection: [UIButton]!
    @IBOutlet weak var strawberrybananaButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!

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
    
    @IBAction func OrderJuicesbuttonPressed(_ sender: UIButton) {
        if let juiceType = JuiceTypes.init(rawValue: sender.tag) {
            orderJuices(juice: juiceType)
        }
    }
    
    func orderJuices(juice: JuiceTypes) {
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
    
    private func orderFruitsButton(sender: UIButton) {
        switch sender {
        case strawberrybananaButton:
            OrderJuicesbuttonPressed(sender)
        case mangoKiwiButton:
            OrderJuicesbuttonPressed(sender)
        case strawberryButton:
            OrderJuicesbuttonPressed(sender)
        case bananaButton:
            OrderJuicesbuttonPressed(sender)
        case pineappleButton:
            OrderJuicesbuttonPressed(sender)
        case kiwiButton:
            OrderJuicesbuttonPressed(sender)
        case mangoButton:
            OrderJuicesbuttonPressed(sender)
        default:
            JuiceMakerError.unexpectedError
        }
    }
    
    private func showStockChangeAlertMessage() {
        let juiceOutOfStockAlert = UIAlertController(title: AlertMessages.outOfStock, message: "", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: AlertMessages.ok, style: .default) {_ in
            guard let pushViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewController") else { return }
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
        for fruit in fruitStore.fruits {
            if fruit.key == FruitsTypes.strawberry {
                strawberryCountLabel.text = String(fruit.value)
            } else if fruit.key == FruitsTypes.banana {
                bananaCountLabel.text = String(fruit.value)
            } else if fruit.key == FruitsTypes.kiwi {
                kiwiCountLabel.text = String(fruit.value)
            } else if fruit.key == FruitsTypes.mango {
                mangoCountLabel.text = String(fruit.value)
            } else if fruit.key == FruitsTypes.pineapple {
                pineappleCountLabel.text = String(fruit.value)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruits()
    }
}
