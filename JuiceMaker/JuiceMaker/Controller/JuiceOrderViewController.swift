//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryBananaOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiOrder: UIButton!
    @IBOutlet weak var strawberryOrder: UIButton!
    @IBOutlet weak var bananaOrder: UIButton!
    @IBOutlet weak var mangoOrder: UIButton!
    @IBOutlet weak var kiwiOrder: UIButton!
    @IBOutlet weak var pineappleOrder: UIButton!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickJuiceButton(_ sender: UIButton) {
        var juice: JuiceMaker.Juice
        
        switch sender {
        case strawberryOrder: juice = .strawberry
        case strawberryBananaOrderButton: juice = .strawberrybanana
        case bananaOrder: juice = .banana
        case mangoKiwiOrder: juice = .mangokiwi
        case mangoOrder: juice = .mango
        case kiwiOrder: juice = .kiwi
        case pineappleOrder: juice = .pineapple
        default:
            juice = .strawberry // temp
        }
        
    }
    
}

