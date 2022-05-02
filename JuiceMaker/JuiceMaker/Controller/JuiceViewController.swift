//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValue()
    }
    
    func updateValue() {
        self.strawberryLabel.text = juiceMaker.fruitStore.count(.strawberry).description
        self.bananaLabel.text = juiceMaker.fruitStore.count(.banana).description
        self.pineappleLabel.text = juiceMaker.fruitStore.count(.pineapple).description
        self.kiwiLabel.text = juiceMaker.fruitStore.count(.kiwi).description
        self.mangoLabel.text = juiceMaker.fruitStore.count(.mango).description
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let orderedJuice = JuiceType(rawValue: sender.tag) else {
            return
        }

        let juice = Drink(juice: orderedJuice)
        juiceMaker.make(juice)
        updateValue()
    }
}

