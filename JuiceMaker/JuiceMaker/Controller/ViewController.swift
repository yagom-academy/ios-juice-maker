//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    

    @IBOutlet var stockLabels: [UILabel]!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
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
    }
    
    @IBAction func mangoKiwiJuiceOrderButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func strawberryJuiceOrderButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func bananaJuiceOrderButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func pineappleJuiceOrderButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func kiwiJuiceOrderButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func mangoJuiceOrderButtonClicked(_ sender: UIButton) {
    }
    
}

