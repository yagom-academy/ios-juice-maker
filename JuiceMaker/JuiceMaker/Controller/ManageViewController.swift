//
//  ManageViewController.swift
//  JuiceMaker
//
//  Created by Doogie & Malrang.
//

import UIKit

class ManageViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var fruitDic: [Fruits: Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        for (fruit, stock) in fruitDic {
            switch fruit {
            case .strawberry:
                self.strawberryStockLabel.text = String(stock)
            case .banana:
                self.bananaStockLabel.text = String(stock)
            case .pineapple:
                self.pineappleStockLabel.text = String(stock)
            case .kiwi:
                self.kiwiStockLabel.text = String(stock)
            case .mango:
                self.mangoStockLabel.text = String(stock)
            }
        }
    }
    
    @IBAction func touchCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
