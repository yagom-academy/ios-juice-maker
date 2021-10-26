//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitCount()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    func updateFruitCount() {
        let fruitCountList: [FruitStore.Fruits: Int] = FruitStore.shared.inventoryStatus
        
        for fruitCountLabel in fruitCountLabels {
            
            guard let fruitID = fruitCountLabel.restorationIdentifier else {
                return
            }
            
            guard let kindOfFruit = FruitStore.Fruits(rawValue: fruitID) else {
                return
            }
            
            guard let fruitCount = fruitCountList[kindOfFruit] else {
                return
            }
            
            fruitCountLabel.text = String(fruitCount)
        }
    }
    
    
}

