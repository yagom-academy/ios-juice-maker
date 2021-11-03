//
//  StockUpdateController.swift
//  JuiceMaker
//
//  Created by 권나영 on 2021/10/28.
//

import UIKit

class StockUpdateController: UIViewController {
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    var stockOfFruit: [Fruit: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStockOfFruitLabel()
    }
    
    func setStockOfFruitLabel() {
        stockOfFruit.forEach({ (fruit, stock) in
            switch fruit {
            case .strawberry:
                strawberryLabel.text = String(stock)
            case .banana:
                bananaLabel.text = String(stock)
            case .pineapple:
                pineappleLabel.text = String(stock)
            case .kiwi:
                kiwiLabel.text = String(stock)
            case .mango:
                mangoLabel.text = String(stock)
            }
        })
    }
    
    @IBAction func tapExitButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
