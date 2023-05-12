//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Hyungmin Lee on 2023/05/12.
//

import UIKit

class FruitStockViewController: UIViewController {
    
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet var bananaLabel: UIView!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func test(_ sender: UIStepper) {
        print(sender.value)
    }
    
}
