//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by 표현수 on 2023/05/19.
//

import UIKit

class ChangeStockViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        composeText()
    }
    
    @IBAction private func closeButtonTap(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func changeStockStepper(_ sender: UIStepper) {
        switch sender.tag {
        case 0:
            strawberryStockLabel.text = Int(sender.value).description
        case 1:
            bananaStockLabel.text = Int(sender.value).description
        case 2:
            pineappleStockLabel.text = Int(sender.value).description
        case 3:
            kiwiStockLabel.text = Int(sender.value).description
        case 4:
            mangoStockLabel.text = Int(sender.value).description
        default:
            break
        }
    }
    
    private func composeText() {
        strawberryStockLabel.text = String(juiceMaker.fruitStore.bringStock(.strawberry))
        bananaStockLabel.text = String(juiceMaker.fruitStore.bringStock(.banana))
        pineappleStockLabel.text = String(juiceMaker.fruitStore.bringStock(.pineapple))
        kiwiStockLabel.text = String(juiceMaker.fruitStore.bringStock(.kiwi))
        mangoStockLabel.text = String(juiceMaker.fruitStore.bringStock(.mango))
    }
}
