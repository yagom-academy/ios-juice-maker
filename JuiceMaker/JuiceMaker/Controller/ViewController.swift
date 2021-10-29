//
//  JuiceMaker - ViewController.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var showStockStrawberry: UILabel!
    @IBOutlet weak var showStockBanana: UILabel!
    @IBOutlet weak var showStockPineapple: UILabel!
    @IBOutlet weak var showStockKiwi: UILabel!
    @IBOutlet weak var showStockMango: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showCurrentStock()
    }
 
    func showCurrentStock() {
        guard let strawberry = stock.fruitStockList[.strawberry],
              let banana = stock.fruitStockList[.banana],
              let pineapple = stock.fruitStockList[.pineapple],
              let kiwi = stock.fruitStockList[.kiwi],
              let mango = stock.fruitStockList[.mango] else {
            return
        }
        showStockStrawberry.text = String(strawberry)
        showStockBanana.text = String(banana)
        showStockPineapple.text = String(pineapple)
        showStockKiwi.text = String(kiwi)
        showStockMango.text = String(mango)
    }
}
