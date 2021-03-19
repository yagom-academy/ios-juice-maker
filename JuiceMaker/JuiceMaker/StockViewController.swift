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
    @IBOutlet weak var strawStepper: UIStepper!
    
    func showPresentStock() {
        strawberryStock.text = String(FruitStock.shared.strawberry)
        bananaStock.text = String(FruitStock.shared.banana)
        pineappleStock.text = String(FruitStock.shared.pineapple)
        kiwiStock.text = String(FruitStock.shared.kiwi)
        mangoStock.text = String(FruitStock.shared.mango)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPresentStock()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
