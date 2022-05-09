//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 변재은 on 2022/05/09.
//

import UIKit

class FruitStoreViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = "\(fruitStore.stocks[.strawberry]!)"
        bananaLabel.text = "\(fruitStore.stocks[.banana]!)"
        pineappleLabel.text = "\(fruitStore.stocks[.pineapple]!)"
        kiwiLabel.text = "\(fruitStore.stocks[.kiwi]!)"
        mangoLabel.text = "\(fruitStore.stocks[.mango]!)"
    }
}
