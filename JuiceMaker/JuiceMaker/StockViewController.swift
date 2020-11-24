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
        guard let strawberry = JuiceMaker.shared.fruits[.strawberry],
              let banana = JuiceMaker.shared.fruits[.banana],
              let mango = JuiceMaker.shared.fruits[.mango],
              let kiwi = JuiceMaker.shared.fruits[.kiwi],
              let pineapple = JuiceMaker.shared.fruits[.pineapple] else {
            return
        }
        strawberryStockLabel.text = "\(strawberry.amount)"
        bananaStockLabel.text = "\(banana.amount)"
        mangoStockLabel.text = "\(mango.amount)"
        kiwiStockLabel.text = "\(kiwi.amount)"
        pineappleStockLabel.text = "\(pineapple.amount)"
    }
}
