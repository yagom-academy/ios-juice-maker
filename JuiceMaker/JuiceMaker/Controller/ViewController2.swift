//
//  ViewController2.swift
//  JuiceMaker
//
//  Created by 이예원 on 2021/06/17.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var strawberryStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStepper.value = Double(juiceMaker.getAmount(.strawberry))
        showFruitLabel()
    }
    
    @IBAction func closeBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func showFruitLabel() {
        strawberryStockLabel.text = String(juiceMaker.getAmount(.strawberry))
        bananaStockLabel.text = String(juiceMaker.getAmount(.banana))
        pineappleStockLabel.text = String(juiceMaker.getAmount(.pineapple))
        kiwiStockLabel.text = String(juiceMaker.getAmount(.kiwi))
        mangoStockLabel.text = String(juiceMaker.getAmount(.mango))
    }
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        juiceMaker.stockPlus(.strawberry, stock: Int(sender.value))
        showFruitLabel()
    }
}
