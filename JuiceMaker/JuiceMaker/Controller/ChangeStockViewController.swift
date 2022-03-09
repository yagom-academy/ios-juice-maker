//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/03/03.
//

import UIKit

protocol ChangeStockViewControllerDelegate: AnyObject {
    func sendData(stocks: [FruitsTypes: Int])
}

class ChangeStockViewController: UIViewController {
    weak var delegate: ChangeStockViewControllerDelegate?
    var changedStock: [FruitsTypes: Int] = [:]
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bannaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bannaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitsStock()
    }

    func showFruitsStock() {
        changedStock.keys.forEach{ fruits in
            switch fruits{
            case .strawberry:
                strawberryStockLabel.text = changedStock[.strawberry]?.description
                strawberryStockStepper.value = Double(changedStock[.strawberry] ?? .zero)
            case .banana:
                bannaStockLabel.text = changedStock[.banana]?.description
                bannaStockStepper.value = Double(changedStock[.banana] ?? .zero)
            case .pineapple:
                pineappleStockLabel.text = changedStock[.pineapple]?.description
                pineappleStockStepper.value = Double(changedStock[.pineapple] ?? .zero)
            case .kiwi:
                kiwiStockLabel.text = changedStock[.kiwi]?.description
                kiwiStockStepper.value = Double(changedStock[.kiwi] ?? .zero)
            case .mango:
                mangoStockLabel.text = changedStock[.mango]?.description
                mangoStockStepper.value = Double(changedStock[.mango] ?? .zero)
            }
        }
    }
    
    @IBAction func closedButtonTapped(_ sender: Any) {
        delegate?.sendData(stocks: changedStock)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        switch sender{
        case strawberryStockStepper:
            strawberryStockLabel.text = Int(sender.value).description
            changedStock[.strawberry] = Int(sender.value)
        case bannaStockStepper:
            bannaStockLabel.text = Int(sender.value).description
            changedStock[.banana] = Int(sender.value)
        case pineappleStockStepper:
            pineappleStockLabel.text = Int(sender.value).description
            changedStock[.pineapple] = Int(sender.value)
        case kiwiStockStepper:
            kiwiStockLabel.text = Int(sender.value).description
            changedStock[.kiwi] = Int(sender.value)
        case mangoStockStepper:
            mangoStockLabel.text = Int(sender.value).description
            changedStock[.mango] = Int(sender.value)
        default:
            JuiceMakerError.stepperError
        }
    }
}
