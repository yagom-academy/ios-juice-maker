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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel(label: strawberryAmountLabel, fruit: .strawberry)
        configureLabel(label: bananaAmountLabel, fruit: .banana)
        configureLabel(label: pineappleAmountLabel, fruit: .pineapple)
        configureLabel(label: kiwiAmountLabel, fruit: .kiwi)
        configureLabel(label: mangoAmountLabel, fruit: .mango)
    }
    
    func configureLabel(label: UILabel, fruit: Fruit) {
        let defaultStocks = juiceMaker.fruitStore.stocks
        
        if let amount = defaultStocks[fruit] {
            label.text = String(amount)
        }
    }
}

