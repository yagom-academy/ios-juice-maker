//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    enum JuiceError: Error {
        case invalidJuiceOrder
    }
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAllFruitStockLabels()
    }
    
    func showAllFruitStockLabels() {
        showCurrentStockLabel(of: .strawberry, label: strawberryStockLabel)
        showCurrentStockLabel(of: .banana, label: bananaStockLabel)
        showCurrentStockLabel(of: .pineapple, label: pineappleStockLabel)
        showCurrentStockLabel(of: .kiwi, label: kiwiStockLabel)
        showCurrentStockLabel(of: .mango, label: mangoStockLabel)
    }

    func showCurrentStockLabel(of fruit: Fruit, label: UILabel) {
        guard let currentStock = try? fruitStore.showStockLeft(fruit: fruit) else {
            return
        }
        label.text = String(currentStock)
    }
    
    func findJuiceMenu(from sender: UIButton) throws -> Juice {
        switch sender {
        case strawberryBananaJuiceButton:
            return .strawberryBananaJuice
        case mangoKiwiJuiceButton:
            return .mangoKiwiJuice
        case strawberryJuiceButton:
            return .strawberryJuice
        case bananaJuiceButton:
            return .bananaJuice
        case pineappleJuiceButton:
            return .pineappleJuice
        case kiwiJuiceButton:
            return .kiwiJuice
        case mangoJuiceButton:
            return .mangoJuice
        default:
            throw JuiceError.invalidJuiceOrder
        }
    }

    @IBAction func juiceButtonTapped(_ sender: UIButton) {
        let juiceMaker = JuiceMaker()

        do {
            let juice = try findJuiceMenu(from: sender)
            try juiceMaker.order(juice: juice)
            showAllFruitStockLabels()
            showJuiceIsReadyAlert(message: "\(juice.menu)쥬스 나왔습니다! 맛있게 드세요!")
        } catch {
            showOutOfStockAlert()
        }
    }

    func showJuiceIsReadyAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "🥤", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showOutOfStockAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) {
            action in
            self.navigateToFruitStore()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToFruitStore() {
        guard let fruitStoreNavigationController = self.storyboard?.instantiateViewController(
                withIdentifier: "fruitStoreNavigationController"
        ) else {
            return
        }
        
        self.present(fruitStoreNavigationController, animated: true, completion: nil)
    }
}
