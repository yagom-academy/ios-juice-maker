//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        strawberryStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.strawberry] ?? 0)
        bananaStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.banana] ?? 0)
        pineappleStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.pineapple] ?? 0)
        kiwiStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.kiwi] ?? 0)
        mangoStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.mango] ?? 0)
        
    }

    @IBAction func strawberryBananaJuiceButton(_ sender: UIButton) {
        
    }
    
    @IBAction func mangoKiwiJuiceButton(_ sender: UIButton) {
        
    }
    
    @IBAction func strawberryJuiceButton(_ sender: UIButton) {
        
    }
    @IBAction func bananaJuiceButton(_ sender: UIButton) {
        
    }
    @IBAction func pineappleJuiceButton(_ sender: UIButton) {
        
    }
    @IBAction func kiwiJuiceButton(_ sender: UIButton) {
        
    }
    
    @IBAction func mangoJuiceButton(_ sender: UIButton) {
        
    }

}

