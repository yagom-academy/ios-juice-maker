//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by stone, jpush.
//

import UIKit

class EditStockViewController: UIViewController {
    let fruitStore = FruitStore.shared
    var stock: [Fruit : Int] = [:]
    
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
        setStepperValue()
        setStockLabel()
        addNotification()
    }
    
    func setStepperValue() {
        self.strawberryStepper.value = Double(stock[.strawberry] ?? 0)
        self.bananaStepper.value = Double(stock[.banana] ?? 0)
        self.pineappleStepper.value = Double(stock[.pineapple] ?? 0)
        self.kiwiStepper.value = Double(stock[.kiwi] ?? 0)
        self.mangoStepper.value = Double(stock[.mango] ?? 0)
    }
    
    func setStockLabel() {
        self.strawberryStockLabel.text = "\(Int(self.strawberryStepper.value))"
        self.bananaStockLabel.text = "\(Int(self.bananaStepper.value))"
        self.pineappleStockLabel.text = "\(Int(self.pineappleStepper.value))"
        self.kiwiStockLabel.text = "\(Int(self.kiwiStepper.value))"
        self.mangoStockLabel.text = "\(Int(self.mangoStepper.value))"
    }
    
    func addNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceivedFruitsAmountChanged(_:)),
                                               name: NSNotification.Name("fruitStockChange"),
                                               object: nil)
    }
    
    @objc func didReceivedFruitsAmountChanged(_ noti: Notification){
        guard let userInfo = noti.userInfo?["fruitsStock"],
              let fruitsStock = userInfo as? Dictionary<Fruit,Int> else { return }
        
        self.strawberryStockLabel.text = "\(fruitsStock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(fruitsStock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(fruitsStock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(fruitsStock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(fruitsStock[.mango] ?? 0)"
    }
    
    @IBAction func changeFruitStock(_ sender: UIStepper) {
        var fruit: Fruit?
        switch sender {
        case strawberryStepper:
            fruit = .strawberry
        case bananaStepper:
            fruit = .banana
        case pineappleStepper:
            fruit = .pineapple
        case kiwiStepper:
            fruit = .kiwi
        case mangoStepper:
            fruit = .mango
        default:
            break
        }
        
        if let fruit = fruit { fruitStore.fruitsStock[fruit] = Int(sender.value) }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}



