//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    @IBOutlet var stockLabels: [UILabel]!
    
    @IBOutlet var juiceOrderButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentStock()
    }

    func showCurrentStock() {
        juiceMaker.fruitStore.inventory.keys.forEach {
            switch $0 {
            case .strawberry:
                stockLabels[0].text = String(juiceMaker.fruitStore.inventory[.strawberry] ?? 0)
            case .banana:
                stockLabels[1].text = String(juiceMaker.fruitStore.inventory[.banana] ?? 0)
            case .pineapple:
                stockLabels[2].text = String(juiceMaker.fruitStore.inventory[.pineapple] ?? 0)
            case .kiwi:
                stockLabels[3].text = String(juiceMaker.fruitStore.inventory[.kiwi] ?? 0)
            default:
                stockLabels[4].text = String(juiceMaker.fruitStore.inventory[.mango] ?? 0)
            }
        }
    }

    @IBAction func strawberryBananaJuiceOrderButtonClicked(_ sender: UIButton) {
        juiceMaker.selectMenu(.strawberryBananaJuice)
        showCurrentStock()
    }
    
    @IBAction func mangoKiwiJuiceOrderButtonClicked(_ sender: UIButton) {
        juiceMaker.selectMenu(.mangoKiwiJuice)
        showCurrentStock()
    }
    
    @IBAction func strawberryJuiceOrderButtonClicked(_ sender: UIButton) {
        juiceMaker.selectMenu(.strawberryJuice)
        showCurrentStock()
    }
    
    @IBAction func bananaJuiceOrderButtonClicked(_ sender: UIButton) {
        juiceMaker.selectMenu(.bananaJuice)
        showCurrentStock()
    }
    
    @IBAction func pineappleJuiceOrderButtonClicked(_ sender: UIButton) {
        juiceMaker.selectMenu(.pineappleJuice)
        showCurrentStock()
    }
    
    @IBAction func kiwiJuiceOrderButtonClicked(_ sender: UIButton) {
        juiceMaker.selectMenu(.kiwiJuice)
        showCurrentStock()
    }
    
    @IBAction func mangoJuiceOrderButtonClicked(_ sender: UIButton) {
        juiceMaker.selectMenu(.mangoJuice)
        showCurrentStock()
    }
}

