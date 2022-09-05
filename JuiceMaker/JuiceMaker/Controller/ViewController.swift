//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateInventory()
    }
    
    func updateInventory() {
        let errorValue = -1
        strawberryLabel.text = "\(FruitStore.shared.inventoryList[.strawberry] ?? errorValue)"
        bananaLabel.text = "\(FruitStore.shared.inventoryList[.banana] ?? errorValue)"
        pineappleLabel.text = "\(FruitStore.shared.inventoryList[.pineapple] ?? errorValue)"
        kiwiLabel.text = "\(FruitStore.shared.inventoryList[.kiwi] ?? errorValue)"
        mangoLabel.text = "\(FruitStore.shared.inventoryList[.mango] ?? errorValue)"
    }
 
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        if let juice = Juice.init(rawValue: sender.tag) {
            juiceMaker.make(juice)
        }
    }
    
}

