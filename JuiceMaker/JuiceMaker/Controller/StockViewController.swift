//
//  JuiceMaker - StockViewController.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class StockViewController: UIViewController {
    
    weak var delegate: StockDeliveryProtocol?
    var currentStocks: [Fruit: Int] = [:]
    
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
        currentStocks.keys.forEach {
            switch $0 {
            case .strawberry:
                strawberryStockLabel.text = currentStocks[.strawberry]?.description
                strawberryStepper.value = Double(currentStocks[.strawberry] ?? 0)
            case .banana:
                bananaStockLabel.text = currentStocks[.banana]?.description
                bananaStepper.value = Double(currentStocks[.banana] ?? 0)
            case .pineapple:
                pineappleStockLabel.text = currentStocks[.pineapple]?.description
                pineappleStepper.value = Double(currentStocks[.pineapple] ?? 0)
            case .kiwi:
                kiwiStockLabel.text = currentStocks[.kiwi]?.description
                kiwiStepper.value = Double(currentStocks[.kiwi] ?? 0)
            case .mango:
                mangoStockLabel.text = currentStocks[.mango]?.description
                mangoStepper.value = Double(currentStocks[.mango] ?? 0)
            }
        }
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        if sender == strawberryStepper {
            strawberryStockLabel.text = Int(sender.value).description
            currentStocks[.strawberry] = Int(sender.value)
        } else if sender == bananaStepper {
            bananaStockLabel.text = Int(sender.value).description
            currentStocks[.banana] = Int(sender.value)
        } else if sender == pineappleStepper {
            pineappleStockLabel.text = Int(sender.value).description
            currentStocks[.pineapple] = Int(sender.value)
        } else if sender == kiwiStepper {
            kiwiStockLabel.text = Int(sender.value).description
            currentStocks[.kiwi] = Int(sender.value)
        } else if sender == mangoStepper {
            mangoStockLabel.text = Int(sender.value).description
            currentStocks[.mango] = Int(sender.value)
        }
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        delegate?.update(by: currentStocks)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
