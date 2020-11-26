//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 임리나 on 2020/11/23.
//

import UIKit

class StockViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabels()
    }
    
    @IBAction func touchUpDismissPageButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeLabels() {
        guard let strawberry = JuiceMaker.common.fruits[.strawberry],
              let banana = JuiceMaker.common.fruits[.banana],
              let mango = JuiceMaker.common.fruits[.mango],
              let kiwi = JuiceMaker.common.fruits[.kiwi],
              let pineapple = JuiceMaker.common.fruits[.pineapple] else {
            return
        }
        strawberryStockLabel.text = "\(strawberry.amount)"
        bananaStockLabel.text = "\(banana.amount)"
        mangoStockLabel.text = "\(mango.amount)"
        kiwiStockLabel.text = "\(kiwi.amount)"
        pineappleStockLabel.text = "\(pineapple.amount)"
    }
}
