//
//  StockEditViewController.swift
//  JuiceMaker
//
//  Created by jin on 9/6/22.
//

import UIKit

class StockEditViewController: UIViewController {
    
    var fruitStock = [Fruit: Int]()
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .systemGray5
    }

    @IBAction func dismissButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func strawberryStepperPressed(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func bananaStepperPressed(_ sender: UIStepper) {
        bananaStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func pineappleStepperPressed(_ sender: UIStepper) {
        pineappleStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func kiwiStepperPressed(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func mangoStepperPressed(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
    }
    
}
