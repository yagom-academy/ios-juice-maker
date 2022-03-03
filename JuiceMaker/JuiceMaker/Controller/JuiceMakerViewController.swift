//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    @IBOutlet weak var strawberrybananaButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!

    var fruitStore = FruitStore()

    @IBAction private func changeViewControllerTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ChangeStockViewController = storyboard.instantiateViewController(withIdentifier: "ChangeStockViewController")
        if let naviController = navigationController {
            naviController.pushViewController(ChangeStockViewController, animated: false)
        } else {
            JuiceMakerError.notExistNavigationController
        }
    }
    
    @IBAction private func orderStrawberryBananaJuiceTapped(_ sender: Any) {
        orderJuices(fruitJuice: .strawberryBanana)
    }
    
    @IBAction private func orderStrawberryJuiceTapped(_ sender: Any) {
        orderJuices(fruitJuice: .strawberry)
    }
    
    @IBAction private func orderMangoKiwiJuiceTapped(_ sender: Any) {
        orderJuices(fruitJuice: .mangoKiwi)
    }
    
    @IBAction private func orderBananaJuiceTapped(_ sender: Any) {
        orderJuices(fruitJuice: .banana)
    }
    
    @IBAction private func orderPineappleJuiceTapped(_ sender: Any) {
        orderJuices(fruitJuice: .pineapple)
    }
    
    @IBAction private func orderKiwiJuiceTapped(_ sender: Any) {
        orderJuices(fruitJuice: .kiwi)
    }
    
    @IBAction private func orderMangoJuiceTapped(_ sender: Any) {
        orderJuices(fruitJuice: .mango)
    }
    
    func orderJuices(fruitJuice: JuiceTypes) {
        var juicesStock = Dictionary<JuiceTypes, Int>()
        let orderJuice = JuiceMaker()
        juicesStock = orderJuice.makeJuice(fruitJuice: fruitJuice, fruitStore: fruitStore)
        if juicesStock.isEmpty {
            showStockChangeAlertMessage()
        } else {
            updateFruitsLabel(juice: juicesStock, juices: fruitJuice)
            showJuiceAlertMessage(juiceMenu: fruitJuice)
        }
    }
    
    private func updateFruitsLabel(juice: [JuiceTypes:Int], juices: JuiceTypes) {
        let errorNumber = 0
        switch juices {
        case .strawberryBanana:
            strawberryCountLabel.text = String(juice[.strawberry] ?? errorNumber)
            bananaCountLabel.text = String(juice[.banana] ?? errorNumber)
        case .mangoKiwi:
            mangoCountLabel.text = String(juice[.mango] ?? errorNumber)
            kiwiCountLabel.text = String(juice[.kiwi] ?? errorNumber)
        case .strawberry:
            strawberryCountLabel.text = String(juice[.strawberry] ?? errorNumber)
        case .banana:
            bananaCountLabel.text = String(juice[.banana] ?? errorNumber)
        case .pineapple:
            pineappleCountLabel.text = String(juice[.pineapple] ?? errorNumber)
        case .kiwi:
            kiwiCountLabel.text = String(juice[.kiwi] ?? errorNumber)
        case .mango:
            mangoCountLabel.text = String(juice[.mango] ?? errorNumber)
        }
    }
    
    private func orderFruitsButton(sender: UIButton) {
        switch sender {
        case strawberrybananaButton:
            orderStrawberryBananaJuiceTapped(sender)
        case mangoKiwiButton:
            orderMangoKiwiJuiceTapped(sender)
        case strawberryButton:
            orderStrawberryJuiceTapped(sender)
        case bananaButton:
            orderBananaJuiceTapped(sender)
        case pineappleButton:
            orderPineappleJuiceTapped(sender)
        case kiwiButton:
            orderKiwiJuiceTapped(sender)
        case mangoButton:
            orderMangoJuiceTapped(sender)
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
            if fruit.key == JuiceTypes.strawberry {
                strawberryCountLabel.text = String(fruit.value)
            } else if fruit.key == JuiceTypes.banana {
                bananaCountLabel.text = String(fruit.value)
            } else if fruit.key == JuiceTypes.kiwi {
                kiwiCountLabel.text = String(fruit.value)
            } else if fruit.key == JuiceTypes.mango {
                mangoCountLabel.text = String(fruit.value)
            } else if fruit.key == JuiceTypes.pineapple {
                pineappleCountLabel.text = String(fruit.value)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruits()
    }
}
