//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by riji, kaki on 2023/01/09.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateStockLabel()
    }
    
    func updateStockLabel() {
        strawberryStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
