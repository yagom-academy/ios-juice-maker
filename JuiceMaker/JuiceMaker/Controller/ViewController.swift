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
        updateStockLabels()
        
    }
    
    func updateStockLabels() {
        do {
            strawberryStockLabel.text = try juiceMaker.returnStockString(of: .strawberry)
            bananaStockLabel.text = try juiceMaker.returnStockString(of: .banana)
            pineappleStockLabel.text = try juiceMaker.returnStockString(of: .pineapple)
            kiwiStockLabel.text = try juiceMaker.returnStockString(of: .kiwi)
            mangoStockLabel.text = try juiceMaker.returnStockString(of: .mango)
        } catch {
            print("에러")
        }
        
    }

    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ").first,
              let juice = Juice(rawValue: juiceName) else {
            return
        }
        juiceMaker.orderJuice(name: juice)
        updateStockLabels()
    }
}

