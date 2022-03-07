//
//  ManageViewController.swift
//  JuiceMaker
//
//  Created by Doogie & Malrang.
//

import UIKit

class ManageViewController: UIViewController {
    
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
    
    var fruitDic: [Fruits: Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        for (fruit, stock) in fruitDic {
            switch fruit {
            case .strawberry:
                self.strawberryStockLabel.text = String(stock)
                self.strawberryStepper.value = Double(stock)
            case .banana:
                self.bananaStockLabel.text = String(stock)
                self.bananaStepper.value = Double(stock)
            case .pineapple:
                self.pineappleStockLabel.text = String(stock)
                self.pineappleStepper.value = Double(stock)
            case .kiwi:
                self.kiwiStockLabel.text = String(stock)
                self.kiwiStepper.value = Double(stock)
            case .mango:
                self.mangoStockLabel.text = String(stock)
                self.mangoStepper.value = Double(stock)
            }
        }
    }

    @IBAction func touchCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func touchStepper(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            self.strawberryStockLabel.text = String(Int(sender.value))
        case bananaStepper:
            self.bananaStockLabel.text = String(Int(sender.value))
        case pineappleStepper:
            self.pineappleStockLabel.text = String(Int(sender.value))
        case kiwiStepper:
            self.kiwiStockLabel.text = String(Int(sender.value))
        case mangoStepper:
            self.mangoStockLabel.text = String(Int(sender.value))
        default:
            print("에러")
        }
    }
}
