//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var juiceMaker: JuiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
        // Do any additional setup after loading the view.
    }
    
    func updateStockLabel() {
        updateStrawberryStockLabel()
        updateBananaStockLabel()
        updatePineappleStockLabel()
        updateKiwiStockLabel()
        updateMangoStockLabel()
    }

    func updateStrawberryStockLabel() {
        let strawberryStock = try! juiceMaker.fetchStock(of: .strawberry)
        strawberryStockLabel.text = String(strawberryStock)
    }
    
    func updateBananaStockLabel() {
        let bananaStock = try! juiceMaker.fetchStock(of: .banana)
        bananaStockLabel.text = String(bananaStock)
    }
    
    func updatePineappleStockLabel() {
        let pineappleStock = try! juiceMaker.fetchStock(of: .pineapple)
        pineappleStockLabel.text = String(pineappleStock)
    }
    
    func updateKiwiStockLabel() {
        let kiwiStock = try! juiceMaker.fetchStock(of: .kiwi)
        kiwiStockLabel.text = String(kiwiStock)
    }
    
    func updateMangoStockLabel() {
        let mangoStock = try! juiceMaker.fetchStock(of: .mango)
        mangoStockLabel.text = String(mangoStock)
    }
}

