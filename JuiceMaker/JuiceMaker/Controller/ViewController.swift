//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {   
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJucieOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        takeOrder(sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel(label: strawberryAmountLabel, fruit: .strawberry)
        configureLabel(label: bananaAmountLabel, fruit: .banana)
        configureLabel(label: pineappleAmountLabel, fruit: .pineapple)
        configureLabel(label: kiwiAmountLabel, fruit: .kiwi)
        configureLabel(label: mangoAmountLabel, fruit: .mango)
    }
    
    private func configureLabel(label: UILabel, fruit: Fruit) {
        let defaultStocks = juiceMaker.fruitStore.stocks
        
        if let amount = defaultStocks[fruit] {
            label.text = String(amount)
        }
    }
    
    private func takeOrder(sender: UIButton) {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            juiceMaker.takeOrder(of: .strawberryBanana)
        case mangoKiwiJuiceOrderButton:
            juiceMaker.takeOrder(of: .mangoKiwi)
        case strawberryJucieOrderButton:
            juiceMaker.takeOrder(of: .strawberry)
        case bananaJuiceOrderButton:
            juiceMaker.takeOrder(of: .banana)
        case pineappleJuiceOrderButton:
            juiceMaker.takeOrder(of: .pineapple)
        case kiwiJuiceOrderButton:
            juiceMaker.takeOrder(of: .kiwi)
        case mangoJuiceOrderButton:
            juiceMaker.takeOrder(of: .mango)
        default:
            print()
        }
    }
}

