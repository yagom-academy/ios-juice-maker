//
//  FruitStoreVC.swift
//  JuiceMaker
//
//  Created by hyunMac on 2023/09/15.
//

import UIKit

class FruitStoreViewController: UIViewController {
    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    var fruitList: [Fruit: Int] = [:]
    private var fruitLabelDictionary: [Fruit: UILabel] = [:]
    var delegate: testDelegate?
    
    private func initFruitDictionary() {
        fruitLabelDictionary[.strawberry] = strawberryCount
        fruitLabelDictionary[.banana] = bananaCount
        fruitLabelDictionary[.pineapple] = pineappleCount
        fruitLabelDictionary[.kiwi] = kiwiCount
        fruitLabelDictionary[.mango] = mangoCount
        
        strawberryStepper.value = Double(fruitList[.strawberry] ?? 0)
        strawberryStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        bananaStepper.value = Double(fruitList[.banana] ?? 0)
        bananaStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        pineappleStepper.value = Double(fruitList[.pineapple] ?? 0)
        pineappleStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        kiwiStepper.value = Double(fruitList[.kiwi] ?? 0)
        kiwiStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        mangoStepper.value = Double(fruitList[.mango] ?? 0)
        mangoStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else {
            return
        }
        fruitLabelDictionary[fruit]?.text = Int(sender.value).description
        fruitList[fruit] = Int(sender.value)
    }
    
    private func refreshStock() {
        for (fruit, label) in fruitLabelDictionary {
            guard let fruitStock = fruitList[fruit] else {
                return
            }
            
            label.text = String(fruitStock)
        }
    }
    
    @IBAction private func touchUpInsideDismissFruitStore(_ sender: UIButton) {
//        guard let juiceMakerViewController = storyboard?.instantiateViewController(identifier: String(describing: JuiceMakerViewController.self)) as? JuiceMakerViewController else {
//            return
//        }
//        juiceMakerViewController.refreshDelegate(fruitList: fruitList)
        
        delegate?.refreshDelegate(fruitList: fruitList)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruitDictionary()
        refreshStock()
    }
}
