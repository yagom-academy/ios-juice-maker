//
//  File.swift
//  JuiceMaker
//
//  Created by NAMU on 2022/05/02.
//

import UIKit

final class FruitStoreViewController: UIViewController {
    private var fruitsStock: [Fruit: Int] = [:]
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsStock[.strawberry] = 10
        fruitsStock[.banana] = 10
        fruitsStock[.pineapple] = 10
        fruitsStock[.mango] = 10
        fruitsStock[.mango] = 10
    }

    @IBAction private func pressBackBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func pressStepper(_ sender: UIStepper) {
    }
}
