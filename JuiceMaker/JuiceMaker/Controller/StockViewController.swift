//
//  JuiceMaker - StockViewController.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class StockViewController: UIViewController {
    
    weak var delegate: StockDeliveryProtocol?
    var changedStock: [Fruit: Int] = [:]
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentStock()
    }
    
    private func showCurrentStock() {
        changedStock.keys.forEach {
            switch $0 {
            case .strawberry:
                strawberryStockLabel.text = changedStock[.strawberry]?.description
                strawberryStepper.value = Double(changedStock[.strawberry] ?? 0)
            case .banana:
                bananaStockLabel.text = changedStock[.banana]?.description
                bananaStepper.value = Double(changedStock[.banana] ?? 0)
            case .pineapple:
                pineappleStockLabel.text = changedStock[.pineapple]?.description
                pineappleStepper.value = Double(changedStock[.pineapple] ?? 0)
            case .kiwi:
                kiwiStockLabel.text = changedStock[.kiwi]?.description
                kiwiStepper.value = Double(changedStock[.kiwi] ?? 0)
            case .mango:
                mangoStockLabel.text = changedStock[.mango]?.description
                mangoStepper.value = Double(changedStock[.mango] ?? 0)
            }
        }
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        if sender == strawberryStepper {
            strawberryStockLabel.text = Int(sender.value).description
            changedStock[.strawberry] = Int(sender.value)
            
        } else if sender == bananaStepper {
            bananaStockLabel.text = Int(sender.value).description
            changedStock[.banana] = Int(sender.value)
            
        } else if sender == pineappleStepper {
            pineappleStockLabel.text = Int(sender.value).description
            changedStock[.pineapple] = Int(sender.value)
            
        } else if sender == kiwiStepper {
            kiwiStockLabel.text = Int(sender.value).description
            changedStock[.kiwi] = Int(sender.value)
            
        } else {
            mangoStockLabel.text = Int(sender.value).description
            changedStock[.mango] = Int(sender.value)
        }
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        delegate?.updateStock(changedStock)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
