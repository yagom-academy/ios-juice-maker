//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    var juiceMaker: JuiceMakerProtocol = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitAmountLabel(currentStockValue: receiveFruitStock())
        
    }
    
    func receiveFruitStock() -> [Fruit: Int]{
        return juiceMaker.sendFruitStockValue()
    }
    
    func updateFruitAmountLabel(currentStockValue: [Fruit: Int]) {
        for target in currentStockValue {
            switch target.key {
            case .strawberry:
                updateLabel(amount: target.value, label: strawberryAmountLabel)
            case .banana:
                updateLabel(amount: target.value, label: bananaAmountLabel)
            case .kiwi:
                updateLabel(amount: target.value, label: kiwiAmountLabel)
            case .pineapple:
                updateLabel(amount: target.value, label: pineappleAmountLabel)
            case .mango:
                updateLabel(amount: target.value, label: mangoAmountLabel)
            }
        }
    }
    
    func updateLabel(amount: Int, label: UILabel) {
        label.text = "\(String(amount))"
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrderButton(_ sender: Any) {
    }
    
    @IBAction func touchUpstrawberryJuiceOrderButton(_ sender: Any) {
    }
    
    @IBAction func touchUpBananaJuiceOrderButton(_ sender: Any) {
    }
    
    @IBAction func touchUpPineappleJuiceOrderButton(_ sender: Any) {
    }
    
    @IBAction func touchUpKiwiJuiceOrderButton(_ sender: Any) {
    }
    
    @IBAction func touchUpMangoJuiceOrderButton(_ sender: Any) {
    }
    
    @IBAction func touchUpMangoKiwiJuiceOrderButton(_ sender: Any) {
    }
    
    
}
