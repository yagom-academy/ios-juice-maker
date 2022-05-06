//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by 전민수 on 2022/05/05.
//

import UIKit

class FruitStockViewController: UIViewController {
    @IBOutlet  weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    static var strawberryText = ""
    static var bananaText = ""
    static var pineappleText = ""
    static var kiwiText = ""
    static var mangoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabel()
    }
    
    private func updateFruitLabel() {
        strawberryLabel.text = FruitStockViewController.strawberryText
        bananaLabel.text = FruitStockViewController.bananaText
        pineappleLabel.text = FruitStockViewController.pineappleText
        kiwiLabel.text = FruitStockViewController.kiwiText
        mangoLabel.text = FruitStockViewController.mangoText
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func pineappleStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func mangoStepper(_ sender: UIStepper) {
        
    }
}



