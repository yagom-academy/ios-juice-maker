//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by YB on 2021/03/17.
//

import UIKit

class EditStockViewController: UIViewController {

    @IBAction func touchUpDismissButton (_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel : UILabel!
    @IBOutlet weak var pineappleStockLabel : UILabel!
    @IBOutlet weak var kiwiStockLabel : UILabel!
    @IBOutlet weak var mangoStockLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingStockLabel()
    }
    
    private func settingStockLabel() {
        strawberryStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Strawberry.self)))
        bananaStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Banana.self)))
        pineappleStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Pineapple.self)))
        kiwiStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Kiwi.self)))
        mangoStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Mango.self)))
    }
    
    
}
