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
    
    private func initFruitLabelDictionary() {
        fruitLabelDictionary[.strawberry] = strawberryCount
        fruitLabelDictionary[.banana] = bananaCount
        fruitLabelDictionary[.pineapple] = pineappleCount
        fruitLabelDictionary[.kiwi] = kiwiCount
        fruitLabelDictionary[.mango] = mangoCount
    }
    
    @IBAction func Stepper(_ sender: Any) {
//        guard let menu = Menu(rawValue: )  else {
//            return
//        }
//        print(menu)
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
        delegate?.refreshDelegate(fruitList: fruitList)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruitLabelDictionary()
        refreshStock()
    }
}
