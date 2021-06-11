//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ").first,
              let juice = Juice(rawValue: juiceName) else {
            return
        }
        juiceMaker.orderJuice(name: juice)
        print(juiceMaker.fruitStore.fruits)
    }
}

