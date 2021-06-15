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
    
    func takeInitialNumber(of fruit: Fruit) -> Int {
        var initialNumber: Int
        do {
           initialNumber = try juiceMaker.fruitStore.giveBackNumberIfExist(of: fruit)
        } catch {
            initialNumber = 0
        }
        return initialNumber
    }
    
    func setUp(number: Int, on label: UILabel) {
        label.text = String(number)
    }
    
    func showInitialNumberOnLabel() {
        setUp(number: takeInitialNumber(of: .strawberry), on: strawberryNumber)
        setUp(number: takeInitialNumber(of: .banana), on: bananaNumber)
        setUp(number: takeInitialNumber(of: .mango), on: mangoNumber)
        setUp(number: takeInitialNumber(of: .pineapple), on: pineappleNumber)
        setUp(number: takeInitialNumber(of: .kiwi), on: kiwiNumber)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialNumberOnLabel()
    }
 
}

