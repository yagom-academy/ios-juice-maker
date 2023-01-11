//  JuiceMaker - FruitStockViewController.swift
//  Created by Vetto, 레옹아범 on 2023.01.06


import UIKit

final class FruitStockViewController: UIViewController {

    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    
    private let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel(juice: fruitStore.getFruits())
    }
    
   private func updateLabel(juice: [Fruit: Int]) {
        guard let strawberry = juice[.strawberry],
              let banana = juice[.banana],
              let kiwi = juice[.kiwi],
              let pineapple = juice[.pineapple],
              let mango = juice[.mango] else { return }
        
        strawberryLabel.text = String(strawberry)
        bananaLabel.text = String(banana)
        kiwiLabel.text = String(kiwi)
        pineappleLabel.text = String(pineapple)
        mangoLabel.text = String(mango)
    }
}
