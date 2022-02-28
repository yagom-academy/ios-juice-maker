//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

