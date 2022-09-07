//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    var stock: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let stock = stock {
            strawberryCount.text = String(stock[Fruit.strawberry.index])
            bananaCount.text = String(stock[Fruit.banana.index])
            pineappleCount.text = String(stock[Fruit.pineapple.index])
            kiwiCount.text = String(stock[Fruit.kiwi.index])
            mangoCount.text = String(stock[Fruit.mango.index])
        }
    }
    
    @IBAction private func tappedApplyButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
