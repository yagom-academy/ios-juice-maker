//
//  ViewController2.swift
//  JuiceMaker
//
//  Created by 이예원 on 2021/06/17.
//

import UIKit

class ViewController2: UIViewController {
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
        setFruitStepper()
        showFruitLabel()
    }
    
    func setFruitStepper() {
        strawberryStepper.value = Double(juiceMaker.getAmount(.strawberry))
        bananaStepper.value = Double(juiceMaker.getAmount(.banana))
        pineappleStepper.value = Double(juiceMaker.getAmount(.pineapple))
        kiwiStepper.value = Double(juiceMaker.getAmount(.kiwi))
        mangoStepper.value = Double(juiceMaker.getAmount(.mango))
    }
    
    private func showFruitLabel() {
        strawberryStockLabel.text = String(juiceMaker.getAmount(.strawberry))
        bananaStockLabel.text = String(juiceMaker.getAmount(.banana))
        pineappleStockLabel.text = String(juiceMaker.getAmount(.pineapple))
        kiwiStockLabel.text = String(juiceMaker.getAmount(.kiwi))
        mangoStockLabel.text = String(juiceMaker.getAmount(.mango))
    }
    
    @IBAction func closeBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name("changeFruitStock"),
                                        object: nil, userInfo: nil)
    }
    
    @IBAction func fruitStepper(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            juiceMaker.stockPlus(.strawberry, stock: Int(sender.value))
            showFruitLabel()
        case bananaStepper:
            juiceMaker.stockPlus(.banana, stock: Int(sender.value))
            showFruitLabel()
        case pineappleStepper:
            juiceMaker.stockPlus(.pineapple, stock: Int(sender.value))
            showFruitLabel()
        case kiwiStepper:
            juiceMaker.stockPlus(.kiwi, stock: Int(sender.value))
            showFruitLabel()
        case mangoStepper:
            juiceMaker.stockPlus(.mango, stock: Int(sender.value))
            showFruitLabel()
        default:
            return
        }
    }
}
