//
//  ViewController2.swift
//  JuiceMaker
//
//  Created by 이예원 on 2021/06/17.
//

import UIKit

class ViewController2: UIViewController {
    private var juiceMaker: JuiceMaker?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
 
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitStepper()
        showFruitLabel()
    }
    
    private func setFruitStepper() {
        strawberryStepper.value = Double(juiceMaker?.getAmount(.strawberry) ?? 0)
        bananaStepper.value = Double(juiceMaker?.getAmount(.banana) ?? 0)
        pineappleStepper.value = Double(juiceMaker?.getAmount(.pineapple) ?? 0)
        kiwiStepper.value = Double(juiceMaker?.getAmount(.kiwi) ?? 0)
        mangoStepper.value = Double(juiceMaker?.getAmount(.mango) ?? 0)
    }
    
    private func showFruitLabel() {
        strawberryStockLabel.text = String(juiceMaker?.getAmount(.strawberry) ?? 0)
        bananaStockLabel.text = String(juiceMaker?.getAmount(.banana) ?? 0)
        pineappleStockLabel.text = String(juiceMaker?.getAmount(.pineapple) ?? 0)
        kiwiStockLabel.text = String(juiceMaker?.getAmount(.kiwi) ?? 0)
        mangoStockLabel.text = String(juiceMaker?.getAmount(.mango) ?? 0)
    }
    
    func updateJuiceMaker(juiceMaker: JuiceMaker) {
        self.juiceMaker = juiceMaker
    }
    
    @IBAction private func closeBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name("changeFruitStock"),
                                        object: nil, userInfo: nil)
    }
    
    @IBAction private func fruitStepper(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            juiceMaker?.stockPlus(.strawberry, stock: Int(sender.value))
            showFruitLabel()
        case bananaStepper:
            juiceMaker?.stockPlus(.banana, stock: Int(sender.value))
            showFruitLabel()
        case pineappleStepper:
            juiceMaker?.stockPlus(.pineapple, stock: Int(sender.value))
            showFruitLabel()
        case kiwiStepper:
            juiceMaker?.stockPlus(.kiwi, stock: Int(sender.value))
            showFruitLabel()
        case mangoStepper:
            juiceMaker?.stockPlus(.mango, stock: Int(sender.value))
            showFruitLabel()
        default:
            return
        }
    }
}
