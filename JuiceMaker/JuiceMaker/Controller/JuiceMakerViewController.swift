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
        
    }
    
    
}

