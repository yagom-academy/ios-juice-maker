//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by riji, kaki on 2023/01/09.
//

import UIKit

class ManageStockViewController: UIViewController {

    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateStockLabel()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction private func closeViewBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
