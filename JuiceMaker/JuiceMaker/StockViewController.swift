//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 김찬우 on 2021/03/18.
//

import UIKit


class StockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStock.text = String(juiceMaker.fruitStock.strawberry)
    }
    
//    @IBAction func strawberryStepUp(_ sender: Any) {
//    }
//    @IBAction func bananaStepUp(_ sender: Any) {
//    }
//    @IBAction func pineappleStepUp(_ sender: Any) {
//    }
//    @IBAction func kiwiStepUp(_ sender: Any) {
//    }
//    @IBAction func mangoStepUp(_ sender: Any) {
//    }
    
}
