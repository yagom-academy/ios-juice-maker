//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by riji, kaki on 2023/01/09.
//

import UIKit

final class ManageStockViewController: UIViewController {

    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateStockLabel()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = juiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = juiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = juiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction private func closeViewBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
