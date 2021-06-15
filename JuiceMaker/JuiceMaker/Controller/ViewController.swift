//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var strawberryNumber: UILabel!
    @IBOutlet var bananaNumber: UILabel!
    @IBOutlet var pineappleNumber: UILabel!
    @IBOutlet var kiwiNumber: UILabel!
    @IBOutlet var mangoNumber: UILabel!
    var juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    func takeInitialNumber(of fruit: Fruit) -> String {
        var initialNumber: String
        do {
            let fruitNumber = try juiceMaker.fruitStore.giveBackNumberIfExist(of: fruit)
            initialNumber = String(fruitNumber)
        } catch {
            initialNumber = "0"
        }
        return initialNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
}

